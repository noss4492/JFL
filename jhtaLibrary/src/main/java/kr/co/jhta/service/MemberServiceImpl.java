package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.jhta.dao.MemberDAO;
import kr.co.jhta.dto.UserDTO;
import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod=@__({@Autowired}))
	MemberDAO dao;
	
	@Override
	public List<UserDTO> readAllMember() {
		return dao.selectAll();
	}

	@Override
	public UserDTO readOneMember(int uno) {
		return dao.selectOne(uno);
	}
	
	@Override
	public UserDTO readOneMember(String username) {
		return dao.selectOne(username);
	}
	
	@Override
	public void wrtieOneMember(UserDTO dto) {
		dao.insertOne(dto);
	}


	@Override
	public void changeOneMember(UserDTO dto) {
		dao.updateOne(dto);
	}

	@Override
	public void removeOneMember(int uno) {
		dao.deleteOne(uno);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

//	@Override
//	public int idChk(String userid) {
//		return dao.idChk(userid);
//	
//	}

//	@Override
//	public int nickChk(String nickname) {
//		return dao.nickChk(nickname);
//	}
	
	
}
