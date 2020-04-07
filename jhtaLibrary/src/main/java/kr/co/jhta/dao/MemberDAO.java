package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.dto.UserDTO;

public interface MemberDAO {
	public List<UserDTO> selectAll();
	public void insertOne(UserDTO dto);
	public UserDTO selectOne(int uno);
	public UserDTO selectOneByName(String username);
	public void updateOne(UserDTO dto);
	public void deleteOne(int uno);
	public int getTotal();

	//아이디 중복 체크
	public int idChk(String username);
	//이메일 중복 체크
	public int mailChk(String email);
	
}
