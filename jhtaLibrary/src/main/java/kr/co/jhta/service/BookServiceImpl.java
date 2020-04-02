package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.BookDAO;
import kr.co.jhta.dao.MemberDAO;
import kr.co.jhta.dto.GeneralBookDTO;
import lombok.Setter;

@Service
public class BookServiceImpl implements BookService{

	@Setter(onMethod=@__({@Autowired}))
	BookDAO dao;
	
	
	@Override
	public List<GeneralBookDTO> readBookSearchPage(int startNo, int endNo, String gBookId, String author,
			String title) {
		return dao.selectSearchPage(startNo, endNo, gBookId, author, title);
	}

	@Override
	public void writeOneGBook(GeneralBookDTO dto) {
		dao.insertOne(dto);
	}

	@Override
	public void deleteOneGBook(GeneralBookDTO dto) {
		dao.deleteOne(dto);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}
}
