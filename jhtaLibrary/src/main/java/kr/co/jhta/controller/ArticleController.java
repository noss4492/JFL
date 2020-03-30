package kr.co.jhta.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import kr.co.jhta.dto.ArticleDTO;
import kr.co.jhta.service.ArticleService;
import lombok.Setter;

@Controller
@RequestMapping("/article")
public class ArticleController {
	/*
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod=@__({@Autowired}))
	ArticleService as;
	
	@RequestMapping("/showPrincipal")
	public String show(Principal principal) {
		System.out.println(">>>> info of principal : "+principal); 
				return "showPrincipal";
	}
	
	@RequestMapping(value="/list")
	public String list(Model model, 
			@RequestParam(name = "currentPageNo", defaultValue = "1")int currentPageNo) {//, int startNo, int endNo
		model.addAttribute("msg", "메세징");

		int totalNumber = as.getTotal();
		model.addAttribute("totalNumber", totalNumber);
		int countPerPage = 10; 
		int startNo = (currentPageNo-1)*countPerPage+1;
		int endNo = currentPageNo*countPerPage;
		int totalPage = (totalNumber%countPerPage==0)?totalNumber/countPerPage:totalNumber/countPerPage+1;
		int startPageNo = currentPageNo-5<=0?1:currentPageNo-5;
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
		
		model.addAttribute("list", as.readAll(startNo, endNo));
		logger.info("bs : " + as);
		return "list";
	}
	
	//@RequestMapping(value="/write", method=RequestMethod.GET)
	@GetMapping("/write")
	public String toWriteForm() {
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String writeOk(HttpServletRequest req, @ModelAttribute("dto")ArticleDTO dto) {
//		dto.setIp(req.getRemoteAddr());
		as.writeOne(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/detail")
	public String toDetailForm(@RequestParam("bno")int bno, Model model) {
		ArticleDTO dto = as.readOne(bno);
		model.addAttribute("dto", dto);
		return "detail";
	}
	
	@GetMapping("/modifyForm")
	public ModelAndView toModifyForm(@RequestParam("bno")int bno) {
		return	new ModelAndView("modifyForm", "dto", as.readOne(bno));
	}
	
	@PostMapping("/modify")
	public String modifyOk(@ModelAttribute("dto")ArticleDTO dto) {
		as.changeOne(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String deleteOk(@RequestParam("bno")int bno) {
		as.removeOne(bno);
		return "redirect:/board/list";
	}
	
	*/
}
