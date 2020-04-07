package kr.co.jhta.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.ReadingRoomDTO;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.service.ReadingRoomService;
import lombok.Setter;

@Controller
public class ApplicationController {

	
	@Setter(onMethod=@__({@Autowired}))
	ReadingRoomService rrs;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@RequestMapping(value ="/readingRoom" , method = RequestMethod.GET)
	public ModelAndView readingRoom(Principal principal) {
		ModelAndView mv = new ModelAndView();
		
		List<ReadingRoomDTO> list = rrs.rSelectAll();
		long userId = rrs.rSelectNoByUserName(principal.getName());
		int rCount = rrs.rCheckUser(userId);
		//long loggedUserNo = ms.readOneMember(principal.getName()).getUserId();
		
		//mv.addObject("loggedUserNo", loggedUserNo);
		mv.addObject("list", list);
		mv.addObject("rCount", rCount);
		mv.setViewName("/readingRoom");
		
		return mv;
	}
	@RequestMapping(value ="/timeCalTest" , method = RequestMethod.GET)
	public String timeCalTest() {
		//List<ReadingRoomDTO> list = rrs.rSelectAll();
		
		
		return "timeCalTest";
	}
	@RequestMapping(value="/selectSeat", method = RequestMethod.GET)
	public String selectSeat(Model model,@RequestParam("startTime")String startTime, 
			@RequestParam("rentSeatId")long rentSeatId, @RequestParam("seatId")long seatId, 
			@RequestParam("userName")String userName, 
			@RequestParam("status")byte status,@RequestParam("endTime")String endTime,
			Principal principal) {

		long userId = rrs.rSelectNoByUserName(userName);

//		int rCount = rrs.rCheckUser(userId);
//		if(rCount>=1) {
//			System.out.println("2자리 이상 사용 하실 수 없습니다.");
//		}else {
//			
//		}
		ReadingRoomDTO rdto = new ReadingRoomDTO(rentSeatId, seatId, userId, startTime, endTime, status);
		rrs.reserveOne(rdto);
//		model.addAttribute("rdto", rdto);
		
//		System.out.println(rdto);
//		System.out.println(rdto.toString());
		//rrs.reserveOne(rdto);
		return "redirect:readingRoom";
	}
	
	@RequestMapping(value="rCancel")
	public String rCancel(Principal principal) {
		
		long userId = rrs.rSelectNoByUserName(principal.getName());
		rrs.rCancel(userId);
		return "redirect:readingRoom";
	}
}
