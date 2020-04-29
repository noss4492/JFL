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
import kr.co.jhta.dto.RentPlaceIdDTO;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.service.ReadingRoomService;
import kr.co.jhta.service.RentPlaceIdService;
import kr.co.jhta.service.RentPlaceIdServiceImple;
import lombok.Setter;

@Controller
public class ApplicationController {

	
	@Setter(onMethod=@__({@Autowired}))
	ReadingRoomService rrs;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@Setter(onMethod=@__({@Autowired}))
	RentPlaceIdService rpis;
	
	@RequestMapping(value ="/readingRoom" , method = RequestMethod.GET)
	public ModelAndView readingRoom(Principal principal) {
		
		
		ModelAndView mv = new ModelAndView();
		List<ReadingRoomDTO> list = rrs.rSelectAll();
		long userId = rrs.rSelectNoByUserName(principal.getName());
		int rCount = rrs.rCheckUser(userId);
		mv.addObject("list", list);
		mv.addObject("rCount", rCount);
		mv.setViewName("/readingRoom");
		
		
			
		
		
		//long loggedUserNo = ms.readOneMember(principal.getName()).getUserId();
		
		//mv.addObject("loggedUserNo", loggedUserNo);
		
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
	//////////////////////////////////신청서비스 관련////////////////////////////////////////
	@RequestMapping(value ="/facilityRentForm1" , method = RequestMethod.GET)
	public String facilityRentForm1(Model model) {
		  model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "시설대관신청");
	      model.addAttribute("menu", "대관안내");

		return "libApplicationService/facilityRentForm/facilityRentForm1";
	}
	@RequestMapping(value ="/facilityRentForm2" , method = RequestMethod.GET)
	public String facilityRentForm2(Model model) {
		model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "시설대관신청");
	      model.addAttribute("menu", "시설안내");
		return "/libApplicationService/facilityRentForm/facilityRentForm2facilityRentForm2";
	}
	@RequestMapping(value ="/facilityRentForm3" , method = RequestMethod.GET)
	public ModelAndView facilityRentForm3(Model model) {
		model.addAttribute("category", "신청서비스");
	    model.addAttribute("title", "시설대관신청");
	    model.addAttribute("menu", "신청현황/신청하기");
	    
	    ModelAndView mv = new ModelAndView();
	    
	    List<RentPlaceIdDTO> list = rpis.rpiSelectAll();
	    
	    mv.addObject("list", list);
	    mv.setViewName("/libApplicationService/facilityRentForm/facilityRentForm3");
		return mv;
	}
	@RequestMapping(value ="/facilityRentInfo" , method = RequestMethod.GET)
	public ModelAndView facilityRentInfo(String rentDate) {
		
	    
	    ModelAndView mv = new ModelAndView();
	    
	    List<RentPlaceIdDTO> list = rpis.rpiSelectByDate(rentDate);
	    for (RentPlaceIdDTO dto : list) {
			System.out.println(dto);
		}
	    mv.addObject("list1", list);
	    mv.setViewName("/libApplicationService/facilityRentForm/facilityRentForm3");
		return mv;
	}
	
	
	@RequestMapping(value ="/tourApplication1" , method = RequestMethod.GET)
	public String tourApplication1(Model model) {
			model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "도서관견학신청");
	      model.addAttribute("menu", "신청안내");
		return "/libApplicationService/tourApplication/tourApplication1";
	}
	@RequestMapping(value ="/tourApplication2" , method = RequestMethod.GET)
	public String tourApplication2(Model model) {
		model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "도서관견학신청");
	      model.addAttribute("menu", "신청현황/신청하기");
		return "/libApplicationService/tourApplication/tourApplication2";
	}
	@RequestMapping(value ="/volunteerApplication1" , method = RequestMethod.GET)
	public String volunteerApplication() {
		return "/libApplicationService/volunteerApplication/volunteerApplication1";
	}
	@RequestMapping(value ="/basicForm" , method = RequestMethod.GET)
	public String basicForm() {
		return "/basicForm";
	}
	
}
