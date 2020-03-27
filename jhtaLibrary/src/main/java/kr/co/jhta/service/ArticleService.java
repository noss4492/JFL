package kr.co.jhta.service;

import java.util.List;
import kr.co.jhta.dto.ArticleDTO;

public interface ArticleService {
	public List<ArticleDTO> readAll(int startNo, int endNo);
	public void writeOne(ArticleDTO dto);
	public ArticleDTO readOne(int bno);
	public void changeOne(ArticleDTO dto);
	public void removeOne(int bno);
	public int getTotal();
}
