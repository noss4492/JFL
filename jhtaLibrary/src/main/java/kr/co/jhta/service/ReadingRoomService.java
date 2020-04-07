package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.dto.ReadingRoomDTO;


public interface ReadingRoomService {
	public List<ReadingRoomDTO> rSelectAll();
	public ReadingRoomDTO rSelectOne(long ReserveSeatId);
	//	public ArrayList<ReadingRoomDTO> rSelectAll(현재시간??);
	public void reserveOne(ReadingRoomDTO dto);
	public void rCancel(long userId);
	
	public long rSelectNoByUserName(String userName);
  
	public int rCheckUser(long userId);
	
	
}
