package kr.co.jhta.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.dto.RentPlaceIdDTO;
import lombok.Setter;

@Repository
public class RentPlaceIdDAOImple implements RentPlaceIdDAO{

	@Setter(onMethod = @__({ @Autowired }))
	private SqlSession ss;
	
	
	@Override
	public List<RentPlaceIdDTO> rpiSelectAll() {
		
		return ss.selectList("kr.co.jhta.rentPlaceId.selectAll");
	}


	@Override
	public List<RentPlaceIdDTO> rpiSelectByDate(String rentDate) {
		
		return ss.selectList("kr.co.jhta.rentPlaceId.selectByDate");
	}


	@Override
	public void rpiReserve(RentPlaceIdDTO rpidto) {
		ss.insert("kr.co.jhta.rentPlaceId.rpiReserve", rpidto);
	}

}
