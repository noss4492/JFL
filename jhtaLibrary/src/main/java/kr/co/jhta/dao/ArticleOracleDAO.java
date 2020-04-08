package kr.co.jhta.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.dto.ArticleDTO;
import kr.co.jhta.dto.PageStartEnd;
import lombok.Setter;

@Repository
public class ArticleOracleDAO implements ArticleDAO {
	
	//private static final Logger logger = LoggerFactory.getLogger(.class);
	
	@Setter(onMethod=@__({@Autowired}))
	private SqlSession ss;

	
	@Override
	public List<ArticleDTO> selectAll(int startNo, int endNo, int category) {
		PageStartEnd se = new PageStartEnd(startNo, endNo, category);
		return ss.selectList("kr.co.jhta.board.selectAll", se);
	}

	@Override
	public void insertOne(ArticleDTO dto) {		
		ss.insert("kr.co.jhta.board.insertOne", dto);
	}

	@Override
	public ArticleDTO selectOne(int bno) {		
		return ss.selectOne("kr.co.jhta.board.selectOne", bno);
	}

	@Override
	public void updateOne(ArticleDTO dto) {		
		ss.update("kr.co.jhta.board.updateOne", dto);
	}

	@Override
	public void deleteOne(int bno) {
		ss.delete("kr.co.jhta.board.deleteOne", bno);
	}

	@Override
	public void raiseHits(int bno) {
		ss.update("kr.co.jhta.board.raiseHits", bno);
	}

	@Override
	public int getTotal(int category) {
		int temp = ss.selectOne("kr.co.jhta.board.totalCount", category);
		System.out.println(temp);
		return temp;
	}
	
	
}
