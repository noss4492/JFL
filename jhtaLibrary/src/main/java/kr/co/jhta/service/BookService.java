package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.dto.GeneralBookDTO;

public interface BookService {
	public List<GeneralBookDTO> readBookSearchPage(int startNo, int endNo, String gBookId, String author, String title );
	public void writeOneGBook(GeneralBookDTO dto);
	public void deleteOneGBook(GeneralBookDTO dto);
	public int getTotal();

}
