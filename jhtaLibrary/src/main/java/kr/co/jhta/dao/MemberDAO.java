package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.dto.UserDTO;

public interface MemberDAO {
	public List<UserDTO> selectAll();
	public void insertOne(UserDTO dto);
	public UserDTO selectOne(int uno);
	public UserDTO selectOne(String username);
	public void updateOne(UserDTO dto);
	public void deleteOne(int uno);
	public int getTotal();
}
