package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.dto.RentPlaceIdDTO;

public interface RentPlaceIdService {
	public List<RentPlaceIdDTO> rpiSelectAll();
	public List<RentPlaceIdDTO> rpiSelectByDate(String rentDate);
}
