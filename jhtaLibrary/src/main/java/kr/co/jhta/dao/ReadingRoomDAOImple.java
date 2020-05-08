package kr.co.jhta.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.dto.ReadingRoomDTO;
import lombok.Setter;

@Repository
public class ReadingRoomDAOImple implements ReadingRoomDAO {

	@Setter(onMethod = @__({ @Autowired }))
	private SqlSession ss;

	
	
	@Override
	public List<ReadingRoomDTO> rSelectAll() {

		return ss.selectList("kr.co.jhta.readingRoom.selectAll");
	}

	@Override
	public ReadingRoomDTO rSelectOne(long ReserveSeatId) {
		return ss.selectOne("kr.co.jhta.readingRoom.selectOne");

	}

	@Override
	public void rCancel(long userId) {
		ss.delete("kr.co.jhta.readingRoom.rCancel", userId);
	}

	@Override
	public void reserveOne(ReadingRoomDTO rdto) {
		ss.insert("kr.co.jhta.readingRoom.rentOne", rdto);
	}

	@Override
	public long rSelectNoByUserName(String userName) {
		return ss.selectOne("kr.co.jhta.readingRoom.rselectNoByUserName", userName);
	}

	@Override
	public int rCheckUser(long userId) {
		
		return ss.selectOne("kr.co.jhta.readingRoom.rCheckUser", userId);
	}

	@Override
	public List<Long> rFinish() {
		// TODO Auto-generated method stub
		return ss.selectList("kr.co.jhta.readingRoom.rFinish");
	}

}
