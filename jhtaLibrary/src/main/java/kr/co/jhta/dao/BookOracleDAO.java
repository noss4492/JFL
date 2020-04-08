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
	public List<HashMap<String, Object>> selectSearchPage(int startNo, int endNo, String generalBookId, String authorName, String title) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("generalBookId", generalBookId);
		map.put("authorName",authorName);
		map.put("title", title);
		// int startNo, int endNo, String gBookId, String author, String title -> 한개만 받을 수 있으므로 Hashmap으로 사용함.
		return ss.selectList("kr.co.jhta.book.selectSimepleSearchPage", map);
	}

	@Override
	public List<String> selectAuthorByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectAuthorByIsbn", generalBookId);
	}

	@Override
	public List<String> selectTranslatorByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectTranslatorByIsbn", generalBookId);
	}

	@Override
	public void updateRecommendBookFlagOn(String generalBookId) {
		ss.update("kr.co.jhta.book.updateRecommendBookFlagOn", generalBookId);
	}

	@Override
	public void updateRecommendBookFlagOff(String generalBookId) {
		ss.update("kr.co.jhta.book.updateRecommendBookFlagOff", generalBookId);		
	}

	@Override
	public void insertUserFavoriteBook(FavoriteBookDTO fbdto) {
		ss.insert("kr.co.jhta.book.insertUserFavoriteBook", fbdto);
	}

	@Override
	public void deleteUserFavoriteBook(String generalBookId) {
		ss.delete("kr.co.jhta.book.deleteUserFavoriteBook", generalBookId);
	}

	@Override
	public void insertWishBookList(RequestWishBookDTO rwbdto) {
		ss.insert("kr.co.jhta.book.insertWishBookList", rwbdto);
	}

	@Override
	public void updateWishBookReaction(RequestWishBookDTO rwbdto) {
		ss.update("kr.co.jhta.book.updateWishBookReaction", rwbdto);
	}

	@Override
	public void deleteWishBook(String requestWishBookId) {
		ss.delete("kr.co.jhta.book.deleteWishBook", requestWishBookId);
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
	public List<LibraryBookDTO> selectLibraryBookByIsbn(String generalBookId) {
		return ss.selectList("kr.co.jhta.book.selectLibraryBookByIsbn", generalBookId);
	}

	@Override
	public int selectIsBorrowedByBookId(long borrowBookId) {
		return ss.selectOne("kr.co.jhta.book.selectIsBorrowedByBookId", borrowBookId);
	}

	@Override
	public void updateRaiseRentCnt(String generalBookId) {
		ss.update("kr.co.jhta.book.updateRaiseRentCnt", generalBookId);
	}

	@Override
	public void insertReserveBook(BorrowBookDTO bbdto) {
		ss.insert("kr.co.jhta.book.insertReserveBook", bbdto);
	}

	@Override
	public List<GeneralBookDTO> selectRentalBestRandom20() {
		return ss.selectList("kr.co.jhta.book.selectRentalBestRandom20");
	}

	@Override
	public List<GeneralBookDTO> selectNewestRandom20() {
		return ss.selectList("kr.co.jhta.book.selectNewestRandom20");
	}

	@Override
	public List<GeneralBookDTO> selectRecommendRandom20() {
		return ss.selectList("kr.co.jhta.book.selectRecommendRandom20");
	}

	@Override
	public GeneralBookDTO selectOneGeneralBook(String generalBookId) {
		return ss.selectOne("kr.co.jhta.book.selectOneGeneralBook", generalBookId);
	}

	@Override
	public void insertOneGeneralBook(GeneralBookDTO gbdto) {
		ss.insert("kr.co.jhta.book.insertOneGeneralBook", gbdto);
	}

	@Override
	public void updateOneGeneralBook(GeneralBookDTO gbdto) {
		ss.update("kr.co.jhta.book.updateOneGeneralBook", gbdto);
	}

	@Override
	public void deleteOneGeneralBook(long generalBookId) {
		ss.delete("kr.co.jhta.book.deleteOneGeneralBook", generalBookId);
		
	}

	@Override
	public void insertOneLibraryBookDTO(LibraryBookDTO lbdto) {
		ss.insert("kr.co.jhta.book.insertOneLibraryBookDTO", lbdto);
	}

	@Override
	public void updateOneLibraryBookDTO(LibraryBookDTO lbdto) {
		ss.update("kr.co.jhta.book.updateOneLibraryBookDTO", lbdto);
	}

	@Override
	public void deleteOneLibraryBookDTO(long libraryBookId) {
		ss.delete("kr.co.jhta.book.deleteOneLibraryBookDTO", libraryBookId);
		
	}

	@Override
	public int getTotalGeneralBook() {
		return ss.selectOne("kr.co.jhta.book.getTotalGeneralBook");
	}

	@Override
	public int getTotalLibraryBook() {
		return ss.selectOne("kr.co.jhta.book.getTotalLibraryBook");
	}

	@Override
	public GeneralBookDTO selectOneGeneralBookDetail(String generalBookId) {
		return ss.selectOne("kr.co.jhta.book.selectOneGeneralBookDetail", generalBookId);
	}

	@Override
	public LibraryBookDTO selectOneLibraryBookDetail(String libraryBookId) {
		return ss.selectOne("kr.co.jhta.book.selectOneLibraryBookDetail", libraryBookId);
	}

	@Override
	public List<BorrowBookDTO> selectBorrowBookAll(PageStartEnd se) {
		return ss.selectList("kr.co.jhta.book.selectBorrowBookAll", se);
	}

	@Override
	public BorrowBookDTO selectBorrowBookByLid(long libraryBookId) {
		return ss.selectOne("kr.co.jhta.book.selectBorrowBookByLid", libraryBookId);
	}

	@Override
	public void updateIsReturnedBook(long libraryBookId) {
		ss.update("kr.co.jhta.book.updateIsReturnedBook", libraryBookId);
	}

	@Override
	public void updateIsBorrowedBook(long libraryBookId) {
		ss.update("kr.co.jhta.book.updateIsBorrowedBook", libraryBookId);
	}

	@Override
	public void updateBorrowReturnBook(long borrowBookId) {
		ss.update("kr.co.jhta.book.updateBorrowReturnBook", borrowBookId);
	}

	@Override
	public void deleteBorrowReserveBook(long borrowBookId) {
		ss.delete("kr.co.jhta.book.deleteBorrowReserveBook", borrowBookId);
	}

	@Override
	public void insertBorrowBorrowBook(BorrowBookDTO bbdto) {
		ss.insert("kr.co.jhta.book.insertBorrowBorrowBook", bbdto);
	}
}
