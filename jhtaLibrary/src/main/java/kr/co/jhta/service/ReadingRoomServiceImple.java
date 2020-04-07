package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.ReadingRoomDAO;
import kr.co.jhta.dto.ReadingRoomDTO;
import lombok.Setter;

@Service
public class ReadingRoomServiceImple implements ReadingRoomService{

	@Setter(onMethod=@__({@Autowired}))
	ReadingRoomDAO dao;
	
	@Override
	public List<ReadingRoomDTO> rSelectAll() {
		return dao.rSelectAll();
	}

	@Override
	public ReadingRoomDTO rSelectOne(long ReserveSeatId) {
		return dao.rSelectOne(ReserveSeatId);
	}

	@Override
	public void reserveOne(ReadingRoomDTO rdto) {
		dao.reserveOne(rdto);
	}

	@Override
	public void rCancel(long userId) {
		dao.rCancel(userId);
	}

	@Override
	public long rSelectNoByUserName(String userName) {
		return dao.rSelectNoByUserName(userName);
	}

	@Override
	public int rCheckUser(long userId) {
		return dao.rCheckUser(userId);
	}

}
