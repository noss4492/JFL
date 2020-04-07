package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.BookDAO;
import kr.co.jhta.dao.MemberDAO;
import kr.co.jhta.dto.BorrowBookDTO;
import kr.co.jhta.dto.FavoriteBookDTO;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.LibraryBookDTO;
import kr.co.jhta.dto.PageStartEnd;
import kr.co.jhta.dto.RequestWishBookDTO;
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
	public void writeOneGeneralBook(GeneralBookDTO gbdto) {
		dao.insertOneGeneralBook(gbdto);
	}

	@Override
	public void modifyOneGeneralBook(GeneralBookDTO gbdto) {
		dao.updateOneGeneralBook(gbdto);
	}

	@Override
	public void removeOneGeneralBook(long generalBookId) {
		dao.deleteOneGeneralBook(generalBookId);		
	}

	@Override
	public void writeOneLibraryBookDTO(LibraryBookDTO lbdto) {
		dao.insertOneLibraryBookDTO(lbdto);
	}

	@Override
	public void modifyOneLibraryBookDTO(LibraryBookDTO lbdto) {
		dao.updateOneLibraryBookDTO(lbdto);
	}

	@Override
	public void removeOneLibraryBookDTO(long libraryBookId) {
		dao.deleteOneLibraryBookDTO(libraryBookId);
	}

	@Override
	public int getTotalGeneralBook() {
		return dao.getTotalGeneralBook();
	}

	@Override
	public int getTotalLibraryBook() {
		return dao.getTotalLibraryBook();
	}

	@Override
	public GeneralBookDTO readOneGeneralBookDetail(String generalBookId) {
		return dao.selectOneGeneralBookDetail(generalBookId);
	}

	@Override
	public LibraryBookDTO readOneLibraryBookDetail(String libraryBookId) {
		return dao.selectOneLibraryBookDetail(libraryBookId);
	}

	@Override
	public List<String> readAuthorByIsbn(String generalBookId) {
		return dao.selectAuthorByIsbn(generalBookId);
	}

	@Override
	public List<String> readTranslatorByIsbn(String generalBookId) {
		return dao.selectTranslatorByIsbn(generalBookId);
	}

	@Override
	public void modifyRecommendBookFlagOn(String generalBookId) {
		dao.updateRecommendBookFlagOn(generalBookId);
	}

	@Override
	public void modifyRecommendBookFlagOff(String generalBookId) {
		dao.updateRecommendBookFlagOff(generalBookId);
	}

	@Override
	public void writeUserFavoriteBook(FavoriteBookDTO fbdto) {
		dao.insertUserFavoriteBook(fbdto);
	}

	@Override
	public void removeUserFavoriteBook(String generalBookId) {
		dao.deleteUserFavoriteBook(generalBookId);
	}

	@Override
	public void writeWishBookList(RequestWishBookDTO rwbdto) {
		dao.insertWishBookList(rwbdto);
	}

	@Override
	public void modifyWishBookReaction(RequestWishBookDTO rwbdto) {
		dao.updateWishBookReaction(rwbdto);
	}

	@Override
	public void removeWishBook(String requestWishBookId) {
		dao.deleteWishBook(requestWishBookId);
	}

	@Override
	public List<RequestWishBookDTO> readWishBookPageByUser(long userId, int startNo, int endNo) {
		return dao.selectWishBookPageByUser(userId, startNo, endNo);
	}

	@Override
	public List<RequestWishBookDTO> readWishBookPageByAdmin(PageStartEnd se) {
		return dao.selectWishBookPageByAdmin(se);
	}

	@Override
	public void modifyReturnToNonreturn() {
		dao.updateReturnToNonreturn();		
	}

	@Override
	public void modifyReserveToBorrow() {
		dao.updateReserveToBorrow();
	}

	@Override
	public void modifyReturnBook(long borrowBookId) {
		dao.updateReturnBook(borrowBookId);
	}

	@Override
	public void removeReserveBook(long borrowBookId) {
		dao.deleteReserveBook(borrowBookId);
	}

	@Override
	public void writeBorrowBook(BorrowBookDTO bbdto) {
		dao.insertBorrowBook(bbdto);
	}

	@Override
	public List<LibraryBookDTO> readLibraryBookByIsbn(String generalBookId) {
		return dao.selectLibraryBookByIsbn(generalBookId);
	}

	@Override
	public int readIsBorrowedByBookId(long borrowBookId) {
		return dao.selectIsBorrowedByBookId(borrowBookId);
	}

	@Override
	public void modifyRaiseRentCnt(String generalBookId) {
		dao.updateRaiseRentCnt(generalBookId);
	}

	@Override
	public void writeReserveBook(BorrowBookDTO bbdto) {
		dao.insertReserveBook(bbdto);
	}

	@Override
	public List<GeneralBookDTO> readRentalBestRandom20() {
		return dao.selectRentalBestRandom20();
	}

	@Override
	public List<GeneralBookDTO> readNewestRandom20() {
		return dao.selectNewestRandom20();
	}

	@Override
	public List<GeneralBookDTO> readRecommendRandom20() {
		return dao.selectRecommendRandom20();
	}
}
	
//	dao <-> service Naming rule : select/insert/delete <-> read/write/remove
	
//	@Override
//	public List<GeneralBookDTO> readBookSearchPage(int startNo, int endNo, String gBookId, String author,
//			String title) {
//		return dao.selectSearchPage(startNo, endNo, gBookId, author, title);
//	}
//
//	@Override
//	public void writeOneGBook(GeneralBookDTO dto) {
//		dao.insertOne(dto);
//	}
//
//	@Override
//	public void deleteOneGBook(GeneralBookDTO dto) {
//		dao.deleteOne(dto);
//	}
//
//	@Override
//	public int getTotal() {
//		return dao.getTotal();
//	}
//}
