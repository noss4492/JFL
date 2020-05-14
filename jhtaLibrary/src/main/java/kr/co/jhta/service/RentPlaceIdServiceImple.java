package kr.co.jhta.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.ReadingRoomDAO;
import kr.co.jhta.dao.RentPlaceIdDAO;
import kr.co.jhta.dto.RentPlaceIdDTO;
import lombok.Setter;

@Service
public class RentPlaceIdServiceImple implements RentPlaceIdService{

	@Setter(onMethod=@__({@Autowired}))
	RentPlaceIdDAO dao;
	
	@Override
	public List<RentPlaceIdDTO> rpiSelectAll() {
		return dao.rpiSelectAll();
	}

	@Override
	public List<RentPlaceIdDTO> rpiSelectByDate(String rentDate) {
		return dao.rpiSelectByDate(rentDate);
	}

	@Override
	public void rpiReserve(RentPlaceIdDTO rpidto) {
		dao.rpiReserve(rpidto);
	}

}
