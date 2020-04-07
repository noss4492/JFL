package kr.co.jhta.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.dto.BorrowBookDTO;
import kr.co.jhta.dto.FavoriteBookDTO;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.LibraryBookDTO;
import kr.co.jhta.dto.PageStartEnd;
import kr.co.jhta.dto.RequestWishBookDTO;
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
	public List<String> selectAuthorByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectAuthorByIsbn");
	}

	@Override
	public List<String> selectTranslatorByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectTranslatorByIsbn");
	}

	@Override
	public void updateRecommendBookFlagOn(String generalBookId) {
		ss.update("kr.co.jhta.book.updateRecommendBookFlagOn");
	}

	@Override
	public void updateRecommendBookFlagOff(String generalBookId) {
		ss.update("kr.co.jhta.book.updateRecommendBookFlagOff");		
	}

	@Override
	public void insertUserFavoriteBook(FavoriteBookDTO fbdto) {
		ss.insert("kr.co.jhta.book.insertUserFavoriteBook");
	}

	@Override
	public void deleteUserFavoriteBook(String generalBookId) {
		ss.delete("kr.co.jhta.book.deleteUserFavoriteBook");
	}

	@Override
	public void insertWishBookList(RequestWishBookDTO rwbdto) {
		ss.insert("kr.co.jhta.book.insertWishBookList");
	}

	@Override
	public void updateWishBookReaction(RequestWishBookDTO rwbdto) {
		ss.update("kr.co.jhta.book.updateWishBookReaction");
	}

	@Override
	public void deleteWishBook(String requestWishBookId) {
		ss.delete("kr.co.jhta.book.deleteWishBook");
	}

	@Override
	public List<RequestWishBookDTO> selectWishBookPageByUser(long userId, int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("userId", userId);
		
		return ss.selectList("kr.co.jhta.book.selectWishBookPageByUser", map);
	}

	@Override
	public List<RequestWishBookDTO> selectWishBookPageByAdmin(PageStartEnd se) {
		return ss.selectList("kr.co.jhta.book.selectWishBookPageByAdmin", se);
	}

	@Override
	public void updateReturnToNonreturn() {
		ss.update("kr.co.jhta.book.updateReturnToNonreturn");
	}

	@Override
	public void updateReserveToBorrow() {
		ss.update("kr.co.jhta.book.updateReserveToBorrow");
	}

	@Override
	public void updateReturnBook(long borrowBookId) {
		ss.update("kr.co.jhta.book.updateReturnBook", borrowBookId);
	}

	@Override
	public void deleteReserveBook(long borrowBookId) {
		ss.delete("kr.co.jhta.book.deleteReserveBook", borrowBookId);
	}

	@Override
	public void insertBorrowBook(BorrowBookDTO bbdto) {
		ss.insert("kr.co.jhta.book.insertBorrowBook", bbdto);
	}

	@Override
	public List<LibraryBookDTO> selectLibraryBookByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectLibraryBookByIsbn", generalBookId);
	}

	@Override
	public int selectIsBorrowedByBookId(long borrowBookId) {
		return ss.selectOne("kr.co.jhta.selectIsBorrowedByBookId", borrowBookId);
	}

	@Override
	public void updateRaiseRentCnt(String generalBookId) {
		ss.update("kr.co.jhta.updateRaiseRentCnt", generalBookId);
	}

	@Override
	public void insertReserveBook(BorrowBookDTO bbdto) {
		ss.insert("kr.co.jhta.insertReserveBook", bbdto);
	}

	@Override
	public List<GeneralBookDTO> selectRentalBestRandom20() {
		return ss.selectList("kr.co.jhta.selectRentalBestRandom20");
	}

	@Override
	public List<GeneralBookDTO> selectNewestRandom20() {
		return ss.selectList("kr.co.jhta.selectNewestRandom20");
	}

	@Override
	public List<GeneralBookDTO> selectRecommendRandom20() {
		return ss.selectList("kr.co.jhta.selectRecommendRandom20");
	}

	@Override
	public GeneralBookDTO selectOneGeneralBook(String generalBookId) {
		return ss.selectOne("kr.co.jhta.selectOneGeneralBook", generalBookId);
	}

	@Override
	public void insertOneGeneralBook(GeneralBookDTO gbdto) {
		ss.insert("kr.co.jhta.insertOneGeneralBook", gbdto);
	}

	@Override
	public void updateOneGeneralBook(GeneralBookDTO gbdto) {
		ss.update("kr.co.jhta.updateOneGeneralBook", gbdto);
	}

	@Override
	public void deleteOneGeneralBook(long generalBookId) {
		ss.delete("kr.co.jhta.deleteOneGeneralBook", generalBookId);
		
	}

	@Override
	public void insertOneLibraryBookDTO(LibraryBookDTO lbdto) {
		ss.insert("kr.co.jhta.insertOneLibraryBookDTO", lbdto);
	}

	@Override
	public void updateOneLibraryBookDTO(LibraryBookDTO lbdto) {
		ss.update("kr.co.jhta.updateOneLibraryBookDTO", lbdto);
	}

	@Override
	public void deleteOneLibraryBookDTO(long libraryBookId) {
		ss.delete("kr.co.jhta.deleteOneLibraryBookDTO", libraryBookId);
		
	}

	@Override
	public int getTotalGeneralBook() {
		return ss.selectOne("kr.co.jhta.getTotalGeneralBook");
	}

	@Override
	public int getTotalLibraryBook() {
		return ss.selectOne("kr.co.jhta.getTotalLibraryBook");
	}

	@Override
	public GeneralBookDTO selectOneGeneralBookDetail(String generalBookId) {
		return ss.selectOne("kr.co.jhta.selectOneGeneralBookDetail");
	}

	@Override
	public LibraryBookDTO selectOneLibraryBookDetail(String libraryBookId) {
		return ss.selectOne("kr.co.jhta.selectOneLibraryBookDetail");
	}

}
