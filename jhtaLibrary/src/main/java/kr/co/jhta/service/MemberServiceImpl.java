package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.jhta.dao.MemberDAO;
import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.security.CustomPasswordEncoder;
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
	public UserDTO readOneMemberByName(String username) {
		return dao.selectOnebyUsername(username);
	}
	
	@Override
	public void wrtieOneMember(UserDTO dto) {
		CustomPasswordEncoder cpe;
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


	@Override
	public int idChk(String username) {		
		int idCnt = dao.idChk(username);
		return idCnt;
	}

	@Override
	public int mailChk(String email) {
		int mailCnt = dao.mailChk(email);
		
		return mailCnt;
	}

	@Override
	public long selectUserPkByUsername(String username) {
		return 0 ;

	}


	
	
}
