package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.dto.UserDTO;

public interface MemberService {
	public List<UserDTO> readAllMember();
	public UserDTO readOneMember(int uno);
	public UserDTO readOneMember(String username);
	public void wrtieOneMember(UserDTO dto);
	public void changeOneMember(UserDTO dto);
	public void removeOneMember(int uno);
	public int getTotal();
	public int idChk(String username);
	public int mailChk(String email);	
	public long selectUserPkByUsername(String username);;



}
