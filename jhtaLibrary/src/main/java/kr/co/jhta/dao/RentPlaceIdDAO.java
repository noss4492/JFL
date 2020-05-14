package kr.co.jhta.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import kr.co.jhta.dto.RentPlaceIdDTO;

public interface RentPlaceIdDAO {
	public List<RentPlaceIdDTO> rpiSelectAll();
	public List<RentPlaceIdDTO> rpiSelectByDate(String rentDate);
	public void rpiReserve(RentPlaceIdDTO rpidto);
	public List<Map<String, Object>> selectDate();
}
