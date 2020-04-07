package kr.co.jhta.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.jhta.dto.BorrowBookDTO;
import kr.co.jhta.dto.FavoriteBookDTO;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.LibraryBookDTO;
import kr.co.jhta.dto.PageStartEnd;
import kr.co.jhta.dto.RequestWishBookDTO;

public interface BookDAO {
	// public List<GeneralBookDTO> selectPageAll(int startNo, int endNo);
	// 검색 조건 : 고유번호(ISBN/DRM/E-ISBN), 저자명(AUTHOR), 책이름(TITLE) 
	public List<HashMap<String, Object>> selectSearchPage(int startNo, int endNo, String bookId, String author, String title);
	//	HashMap<String, Object> map 사실 전달되는건 hash인데 mapper로 전달될때만 map으로 전달되면 되니까 이렇게 만드는게 사용하기 더 편하지 않을까?
	/* int startNo, int endNo, String gBookId, String author, String title); */
	public GeneralBookDTO selectOneGeneralBook(String generalBookId);
	public List<String> selectAuthorByIsbn(String generalBookId);
	public List<String> selectTranslatorByIsbn(String generalBookId);
	public void updateRecommendBookFlagOn(String generalBookId);
	public void updateRecommendBookFlagOff(String generalBookId);
	public void insertUserFavoriteBook(FavoriteBookDTO fbdto);
	public void deleteUserFavoriteBook(String generalBookId);
	public void insertWishBookList(RequestWishBookDTO rwbdto);
	public void updateWishBookReaction(RequestWishBookDTO rwbdto);
	public void deleteWishBook(String requestWishBookId);
	public List<RequestWishBookDTO> selectWishBookPageByUser(long userId, int startNo, int endNo);
	public List<RequestWishBookDTO> selectWishBookPageByAdmin(PageStartEnd se);
	public void updateReturnToNonreturn();
	public void updateReserveToBorrow();
	public List<LibraryBookDTO> selectLibraryBookByIsbn(String generalBookId);
	public int selectIsBorrowedByBookId(long borrowBookId);
	public void updateRaiseRentCnt(String generalBookId);
	public void insertReserveBook(BorrowBookDTO bbdto);
	public List<GeneralBookDTO> selectRentalBestRandom20();
	public List<GeneralBookDTO> selectNewestRandom20();
	public List<GeneralBookDTO> selectRecommendRandom20();
	
	public void updateIsReturnedBook(long libraryBookId);
	public void updateIsBorrowedBook(long libraryBookId);
	public void updateBorrowReturnBook(long borrowBookId);
	public void deleteBorrowReserveBook(long borrowBookId);
	public void insertBorrowBorrowBook(BorrowBookDTO bbdto);
	
	public void insertOneGeneralBook(GeneralBookDTO gbdto);
	public void updateOneGeneralBook(GeneralBookDTO gbdto);
	public void deleteOneGeneralBook(long generalBookId);
	public void insertOneLibraryBookDTO(LibraryBookDTO lbdto);
	public void updateOneLibraryBookDTO(LibraryBookDTO lbdto);
	public void deleteOneLibraryBookDTO(long libraryBookId);
	public int getTotalGeneralBook();
	public int getTotalLibraryBook();
	
	public GeneralBookDTO selectOneGeneralBookDetail(String generalBookId);
	public LibraryBookDTO selectOneLibraryBookDetail(String libraryBookId);
	
	public List<BorrowBookDTO> selectBorrowBookAll(PageStartEnd se);
	public BorrowBookDTO selectBorrowBookByLid(long libraryBookId);
		/*
	selectAuthorByIsbn
	selectTranslatorByIsbn
	updateRecommendBookFlagOn
	updateRecommendBookOff
	insertUserFavoriteBook
	deleteUserFavoriteBook
	insertWishBookList
	updateWishBookReaction
	deleteWishBook
	selectWishBookPageByUser
	selectWishBookPageByAdmin
	updateReturnToNonreturn
	updateReserveToBorrow
	updateReturnBook
	deleteReserveBook
	insertBorrowBook
	selectLibraryBookByIsbn
	selectIsBorrowedByBookId
	updateRaiseRentCnt
	insertReserveBook
	selectRentalBestRandom20
	selectNewestRandom20
	selectRecommendRandom20
	어드민 책 등록/수정/삭제 빠져있고
	*/
}
