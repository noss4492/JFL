package kr.co.jhta.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.jhta.dto.GeneralBookDTO;

public interface BookDAO {
	// public List<GeneralBookDTO> selectPageAll(int startNo, int endNo);
	// 검색 조건 : 고유번호(ISBN/DRM/E-ISBN), 저자명(AUTHOR), 책이름(TITLE) 
	public List<GeneralBookDTO> selectSearchPage(int startNo, int endNo, String bookId, String author, String title);
	//	HashMap<String, Object> map 사실 전달되는건 hash인데 mapper로 전달될때만 map으로 전달되면 되니까 이렇게 만드는게 사용하기 더 편하지 않을까?
	/* int startNo, int endNo, String gBookId, String author, String title); */
	public void insertOne(GeneralBookDTO dto);
	public void deleteOne(GeneralBookDTO dto);
	public int getTotal();
}
