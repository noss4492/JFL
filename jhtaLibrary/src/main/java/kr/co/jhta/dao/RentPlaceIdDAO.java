package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.dto.RentPlaceIdDTO;

public interface RentPlaceIdDAO {
	public List<RentPlaceIdDTO> rpiSelectAll();
	public List<RentPlaceIdDTO> rpiSelectByDate(String rentDate);
	public void rpiReserve(RentPlaceIdDTO rpidto);
}
