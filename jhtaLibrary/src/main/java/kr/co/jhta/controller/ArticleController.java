package kr.co.jhta.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.ArticleDTO;
import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.ArticleService;
import kr.co.jhta.service.MemberServiceImpl;
import lombok.Setter;

@Controller
//@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod=@__({@Autowired}))
	ArticleService as;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberServiceImpl memberServiceImple;
//	@RequestMapping("/showPrincipal")
//	public String show(Principal principal) {
//		System.out.println(">>>> info of principal : "+principal); 
//				return "showPrincipal";
//	}
	
	@RequestMapping(value="/list")
	public String list(Model model, 
			@RequestParam(name = "currentPageNo", defaultValue = "1")int currentPageNo) {//, int startNo, int endNo
		model.addAttribute("msg", "메세징");

		int totalNumber = as.getTotal(2);
		model.addAttribute("totalNumber", totalNumber);
		int countPerPage = 10; 
		int startNo = (currentPageNo-1)*countPerPage+1;
		int endNo = currentPageNo*countPerPage;
		int totalPage = (totalNumber%countPerPage==0)?totalNumber/countPerPage:totalNumber/countPerPage+1;
//		int startPageNo = currentPageNo-5<=0?1:currentPageNo-5;
		//위는 일정 숫자 넘어가면 전체 페이징 갯수가 하나하나 줄어듬
		//아래는 일정 숫자 넘어가더라도 최소 11개 고정
		int startPageNo = currentPageNo-5<=0?1:totalPage-currentPageNo<5?currentPageNo-(10-(totalPage-currentPageNo)):currentPageNo-5;
		int endPageNo = startPageNo+10>=totalPage?totalPage:startPageNo+10;
		
		boolean prev = currentPageNo     >= 5         ? true  : false;
		boolean next = currentPageNo + 5 >= totalPage ? false : true;
		
		model.addAttribute("totalNumber",totalNumber);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("countPerPage", countPerPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);	
		model.addAttribute("prev", prev);	
		model.addAttribute("next", next);	
//------------------- paging ----------------------------//
		
		model.addAttribute("list", as.readAll(startNo, endNo, 2));
//		logger.info("bs : " + as);
		model.addAttribute("category", "도서관소식");
		model.addAttribute("title", "열린소리함");
		return "board";
	}
	
	@RequestMapping(value="/notice")
	public String notice(Model model, 
			@RequestParam(name = "currentPageNo", defaultValue = "1")int currentPageNo) {//, int startNo, int endNo
		model.addAttribute("msg", "메세징");
		
		int totalNumber = as.getTotal(1);
		model.addAttribute("totalNumber", totalNumber);
		int countPerPage = 10; 
		int startNo = (currentPageNo-1)*countPerPage+1;
		int endNo = currentPageNo*countPerPage;
		int totalPage = (totalNumber%countPerPage==0)?totalNumber/countPerPage:totalNumber/countPerPage+1;
//		int startPageNo = currentPageNo-5<=0?1:currentPageNo-5;
		//위는 일정 숫자 넘어가면 전체 페이징 갯수가 하나하나 줄어듬
		//아래는 일정 숫자 넘어가더라도 최소 11개 고정
		int startPageNo = currentPageNo-5<=0?1:totalPage-currentPageNo<5?currentPageNo-(10-(totalPage-currentPageNo)):currentPageNo-5;
		int endPageNo = startPageNo+10>=totalPage?totalPage:startPageNo+10;
		
		boolean prev = currentPageNo     >= 5         ? true  : false;
		boolean next = currentPageNo + 5 >= totalPage ? false : true;
		
		model.addAttribute("totalNumber",totalNumber);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("countPerPage", countPerPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);	
		model.addAttribute("prev", prev);	
		model.addAttribute("next", next);	
//------------------- paging ----------------------------//
		
		model.addAttribute("list", as.readAll(startNo, endNo, 1));
//		logger.info("bs : " + as);
		model.addAttribute("category", "도서관소식");
		model.addAttribute("title", "공지사항");
		return "notice";
	}
	
	//@RequestMapping(value="/write", method=RequestMethod.GET)
	@GetMapping("/write")
	public String toWriteForm(Model model, Principal principal,HttpServletRequest req) {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd");
		Date time = new Date();
		UserDTO dto = memberServiceImple.readOneMemberByName(principal.getName());
		model.addAttribute("name", dto.getName());
		model.addAttribute("time",format1.format(time));		
		model.addAttribute("category", "도서관소식");
		model.addAttribute("title", "열린소리함");		
		return "boardForm";
	}
	
	@PostMapping("/write")
	public String writeOk(HttpServletRequest req,Model model, @ModelAttribute("dto")ArticleDTO dto, Principal principal) {
//		dto.setIp(req.getRemoteAddr());
		for(int i = 0 ; i < 172; i ++) {
			 UserDTO dto2 = memberServiceImple.readOneMemberByName(principal.getName());
			 dto.setUserId(dto2.getUserId());
			 as.writeOne(dto);
		}
		System.out.println(dto.toString());
		//as.writeOne(dto);
		return "redirect:/list";
	}
	
	@GetMapping("/detail")
	public String toDetailForm(@RequestParam("bno")int bno,@RequestParam("currentPageNo")int currentPageNo, Model model,Principal principal) {
		ArticleDTO dto = as.readOne(bno);
		model.addAttribute("dto", dto);
		if(principal != null) {
		UserDTO udto = memberServiceImple.readOneMemberByName(principal.getName());
		model.addAttribute("userId",udto.getUserId());
		}
		model.addAttribute("boardUserId",dto.getUserId());
		model.addAttribute("currentPageNo",currentPageNo);
		model.addAttribute("category", "도서관소식");
		model.addAttribute("title", "열린소리함");
		return "boardDetail";
	}
	
	@GetMapping("/modifyForm")
	public ModelAndView toModifyForm(@RequestParam("bno")int bno, Model model) {
		model.addAttribute("category", "도서관소식");
		model.addAttribute("title", "열린소리함");
		return	new ModelAndView("boardModifyForm", "dto", as.readOne(bno));
	}
	
	@PostMapping("/modify")
	public String modifyOk(@ModelAttribute("dto")ArticleDTO dto) {
		System.out.println(dto.toString());
		as.changeOne(dto);
		return "redirect:/list";
	}
	
	@GetMapping("/delete")
	public String deleteOk(@RequestParam("bno")int bno) {
		as.removeOne(bno);
		return "redirect:/list";
	}
}
