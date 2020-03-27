package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.dto.ArticleDTO;

public interface ArticleDAO {

	public List<ArticleDTO> selectAll(int startNo, int endNo);
	public void insertOne(ArticleDTO dto);
	public ArticleDTO selectOne(int bno);
	public void updateOne(ArticleDTO dto);
	public void deleteOne(int bno);
	public void raiseHits(int bno);
	public int getTotal();
}
