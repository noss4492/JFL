package kr.co.jhta.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.service.BookService;
import kr.co.jhta.service.MemberService;
import lombok.Setter;

@Controller(value="/book")
public class BookController {
	
	//private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
//	@Setter(onMethod=@__({@Autowired}))
//	BookService bs;
//	
//	@RequestMapping("/simpleSearch")
//	public String simpleSearchBook(
//			@RequestParam(name = "currentPageNo", defaultValue = "1")int currentPageNo)) {
//		
//	}
	
}
