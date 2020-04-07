package kr.co.jhta.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.dto.UserDTO;
import lombok.Setter;

@Repository
public class MemberOracleDAO implements MemberDAO{
	
	@Setter(onMethod=@__({@Autowired}))
	private SqlSession ss;

	@Override
	public List<UserDTO> selectAll() {
		return ss.selectList("kr.co.jhta.member.selectAll");
	}
	
	@Override
	public void insertOne(UserDTO dto) {
		ss.insert("kr.co.jhta.member.insertOne", dto);	
	}
	
	@Override
	public UserDTO selectOne(int uno) {
		return ss.selectOne("kr.co.jhta.member.selectOne", uno);
	}
	
	@Override
	public UserDTO selectOneByUsername(String username) {
		System.out.println("Member Oracle DAO");
		System.out.println("Username : "+username);
		return ss.selectOne("kr.co.jhta.member.selectOnebyUsername", username);
	}	
	
	@Override
	public void updateOne(UserDTO dto) {
		ss.update("kr.co.jhta.member.updateOne", dto);
	}
	
	@Override
	public void deleteOne(int uno) {
		ss.delete("kr.co.jhta.member.deleteOne", uno);
	}
	
	@Override
	public int getTotal() {
		return ss.selectOne("kr.co.jhta.member.totalCount");
	}

	// 아이디 중복 확인
	@Override
	public int idChk(String username) {		
		System.out.println("dao insert complete");
		int idCount = ss.selectOne("idCheck", username.replace("=", ""));
		return idCount;
	}

	@Override
	public int mailChk(String email) {
		System.out.println("mail check");
		int mailCount = ss.selectOne("emCheck", email.replace("=",""));
		System.out.println(email);
		return mailCount;
	}

	@Override
	public long selectUserPkByUsername(String username) {
		System.out.println("member oracle dao : select user pk by username : "+username);
		return ss.selectOne("selectUserPkByUsername", username);
	}

}
