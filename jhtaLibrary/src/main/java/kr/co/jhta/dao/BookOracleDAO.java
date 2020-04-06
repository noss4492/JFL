package kr.co.jhta.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.PageStartEnd;
import lombok.Setter;

@Repository
public class BookOracleDAO implements BookDAO{
	
	@Setter(onMethod=@__({@Autowired}))
	private SqlSession ss;
	
	@Override
	public List<GeneralBookDTO> selectSearchPage(int startNo, int endNo, String generalBookId, String authorName, String title) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("bookId", generalBookId);
		map.put("author",authorName);
		map.put("title", title);
		// int startNo, int endNo, String gBookId, String author, String title -> 한개만 받을 수 있으므로 Hashmap으로 사용함.
		return ss.selectList("kr.co.jhta.book.selectSimepleSearchPage", map);
	}

	@Override
	public void insertOne(GeneralBookDTO dto) {
		ss.insert("kr.co.jhta.book.insertOne", dto);
	}

	@Override
	public void deleteOne(GeneralBookDTO dto) {
		ss.delete("kr.co.jhta.book.deleteOne", dto);
	}

	@Override
	public int getTotal() {
		return ss.selectOne("kr.co.jhta.book.totalCount");
	}
}
