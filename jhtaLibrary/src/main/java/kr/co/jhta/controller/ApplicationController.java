package kr.co.jhta.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.ReadingRoomDTO;
import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.service.ReadingRoomService;
import lombok.Setter;

@Controller
@Component
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
	
	/*	1. 매일 1일 새벽 2시에 자동으로 결재완료하는 스케쥴로
	* 을 입력학 경우 모두(항상)으로 설정함.
	                                           초  분  시  일  월  요일  */		
	/*@Scheduled(cron = "0/10 * * * * *")
	public void autoUpdate(Model model,@RequestParam("startTime")String startTime, 
			@RequestParam("rentSeatId")long rentSeatId, @RequestParam("seatId")long seatId, 
			@RequestParam("userName")String userName, 
			@RequestParam("status")byte status,@RequestParam("endTime")String endTime,
			Principal principal ) {

		if(startTime != endTime)
		System.out.println("시간다름");
		else if(startTime == endTime){
			System.out.println("끝");
		}

	}*/
	
	
	
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
	
	
	@Component 
	public class Scheduler{
		
 	@Scheduled(cron = "0/30 * * * * *")
	public void autoUpdate() {
		
 		Date today = new Date();
 		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		String to = transFormat.format(today);
 		
 		ReadingRoomDTO rdto = new ReadingRoomDTO(); 	
 		UserDTO udto = new UserDTO();

 		List<ReadingRoomDTO> list = rrs.rSelectAll();
 		List<Long> list2 = rrs.rFinish();

 		rrs.rFinish();
 		for(int i=0 ; i<list2.size(); i++) {
 			long unml = list2.get(i); 
 			System.out.println(unml);
 			UserDTO unml2 = ms.readOneMember((int)unml);
 			System.out.println("id : "+unml2); //numl2.getname으로 이름만 가져올 수 있음		
 		} 		
 		
 		System.out.println("list2" +list2);
		System.out.println("30초마다");

//for문 안에서 db 접근 2개가 돌아야 함
	}
	  
	}
	 
	
	
}
