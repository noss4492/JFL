package kr.co.jhta.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.dto.AuthorDTO;
import kr.co.jhta.dto.BorrowBookDTO;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.LibraryBookDTO;
import kr.co.jhta.dto.TranslatorDTO;
import kr.co.jhta.service.BookService;
import kr.co.jhta.service.MemberService;
import lombok.Setter;

@Controller
@RequestMapping(value="/book")
public class BookController {
	
	//private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Setter(onMethod=@__({@Autowired}))
	BookService bs;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@RequestMapping("/simpleSearch")
	public String simpleSearchBook(
			@RequestParam(name = "currentPageNo", defaultValue = "1")int currentPageNo,
			@RequestParam(name = "keyword", defaultValue = "")String keyword,
			Model model) { // default = null
		
		List<HashMap<String, Object>> gbMapList = bs.readBookSearchPage(1, 999, keyword, keyword, keyword);
		System.out.println("keyword : "+keyword);
		model.addAttribute("gbMapList", gbMapList);
		
		return "libBookSearch/test-bookSimpleSearch";
	}
	
	@RequestMapping("/detail")
	public String bookDetail(
			@RequestParam(name = "isbn", defaultValue = "")long isbn,
			Model model) {
		String generalBookId = String.valueOf(isbn);
		System.out.println(generalBookId);
		GeneralBookDTO gbdto = bs.readOneGeneralBookDetail(generalBookId);
		List<String> aList = bs.readAuthorByIsbn(generalBookId);
		List<String> tList = bs.readTranslatorByIsbn(generalBookId);
		List<LibraryBookDTO> lbdtoList = bs.readLibraryBookByIsbn(generalBookId);

		// lbid length = lbdtoList length
//		Map<String, Object> statusAndLbook = new HashMap<String, Object>();
//		int cnt = 0;
//		
//		for(LibraryBookDTO lbdto : lbdtoList) {
//			statusAndLbook.put("borrowStatus", (bs.readBorrowBookByLid(lbdto.getLibraryBookId())).getStatus());
//			statusAndLbook.put("lbdto", lbdtoList.get(cnt++));
//			System.out.println("n-1 번째 루프 : "+cnt);
//			System.out.println("bstatus"+statusAndLbook.get("borrowStatus"));
//			System.out.println("lbdto"+statusAndLbook.get("lbdto"));
//		}
		
		
		System.out.println("gbdto : "+gbdto);
		System.out.println("a : "+aList);	
		System.out.println("t : "+tList);
		System.out.println("lbdtoList : "+ lbdtoList);
		
		model.addAttribute("gbdto", gbdto);
		model.addAttribute("aList", aList);
		model.addAttribute("tList", tList);
		model.addAttribute("lbdtoList", lbdtoList);
		
		return "libBookSearch/bookDetail";
	}
	
	@RequestMapping("/borrow")
	public String bookBorrow(
			@RequestParam("libraryBookId")String libraryBookId,
			@RequestParam("isbn")String isbn,
			Model model, Principal principal, HttpSession session ) {
		
		System.out.println("#lid:"+libraryBookId);
		System.out.println("#isbn:"+isbn);
		System.out.println("#prin:"+principal.getName());
		
		BorrowBookDTO bbdto = new BorrowBookDTO();
		bbdto.setLibraryBookId(Long.parseLong(libraryBookId));
		bbdto.setUserId(ms.readOneMemberByName(principal.getName()).getUserId());
//		bbdto.setUserId(Long.parseLong((String)session.getAttribute("userId"))); //이렇게도 될텐데 바빠서 걍 딴거씀
		
		bs.writeBorrowBorrowBook(bbdto);
		bs.modifyIsBorrowedBook(Long.parseLong(libraryBookId));
		System.out.println(" 책 대여됨 : "+bbdto.getUserId()+" | "+bbdto.getLibraryBookId());
		
		return "redirect:detail?isbn="+isbn+"";
		
	}
	
}
