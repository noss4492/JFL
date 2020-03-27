package kr.co.jhta.service;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import kr.co.jhta.dao.ArticleDAO;
import kr.co.jhta.dto.ArticleDTO;
import lombok.Setter;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Setter(onMethod=@__({@Autowired}))
	ArticleDAO dao;
	
	@Override
	public List<ArticleDTO> readAll(int startNo, int endNo) {		
		return dao.selectAll(startNo, endNo);
	}

	@Override
	public void writeOne(ArticleDTO dto) {
		dao.insertOne(dto);
	}

	@Override
	@Transactional	
	public ArticleDTO readOne(int bno) {
		dao.raiseHits(bno);
		return dao.selectOne(bno);
	}

	@Override
	public void changeOne(ArticleDTO dto) {
		dao.updateOne(dto);
	}

	@Override
	public void removeOne(int bno) {
		dao.deleteOne(bno);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

}
