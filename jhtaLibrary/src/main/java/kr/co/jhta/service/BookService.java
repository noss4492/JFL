package kr.co.jhta.service;

import java.util.HashMap;
import java.util.List;

import kr.co.jhta.dto.BorrowBookDTO;
import kr.co.jhta.dto.FavoriteBookDTO;
import kr.co.jhta.dto.GeneralBookDTO;
import kr.co.jhta.dto.LibraryBookDTO;
import kr.co.jhta.dto.PageStartEnd;
import kr.co.jhta.dto.RequestWishBookDTO;

public interface BookService {
	public List<HashMap<String, Object>> readBookSearchPage(int startNo, int endNo, String gBookId, String author, String title );
	public void writeOneGeneralBook(GeneralBookDTO gbdto);
	public void modifyOneGeneralBook(GeneralBookDTO gbdto);
	public void removeOneGeneralBook(long generalBookId);
	public void writeOneLibraryBookDTO(LibraryBookDTO lbdto);
	public void modifyOneLibraryBookDTO(LibraryBookDTO lbdto);
	public void removeOneLibraryBookDTO(long libraryBookId);
	public int getTotalGeneralBook();
	public int getTotalLibraryBook();
	public GeneralBookDTO readOneGeneralBookDetail(String generalBookId);
	public LibraryBookDTO readOneLibraryBookDetail(String libraryBookId);
	public List<String> readAuthorByIsbn(String generalBookId);
	public List<String> readTranslatorByIsbn(String generalBookId);
	public void modifyRecommendBookFlagOn(String generalBookId);
	public void modifyRecommendBookFlagOff(String generalBookId);
	public void writeUserFavoriteBook(FavoriteBookDTO fbdto);
	public void removeUserFavoriteBook(String generalBookId);
	public void writeWishBookList(RequestWishBookDTO rwbdto);
	public void modifyWishBookReaction(RequestWishBookDTO rwbdto);
	public void removeWishBook(String requestWishBookId);
	public List<RequestWishBookDTO> readWishBookPageByUser(long userId, int startNo, int endNo);
	public List<RequestWishBookDTO> readWishBookPageByAdmin(PageStartEnd se);
	public void modifyReturnToNonreturn();
	public void modifyReserveToBorrow();
	
	public void modifyIsReturnedBook(long libraryBookId);
	public void modifyIsBorrowedBook(long libraryBookId);
	public void modifyBorrowReturnBook(long borrowBookId);
	public void removeBorrowReserveBook(long borrowBookId);
	public void writeBorrowBorrowBook(BorrowBookDTO bbdto);
	
	public List<LibraryBookDTO> readLibraryBookByIsbn(String generalBookId);
	public int readIsBorrowedByBookId(long borrowBookId);
	public void modifyRaiseRentCnt(String generalBookId);
	public void writeReserveBook(BorrowBookDTO bbdto);
	public List<GeneralBookDTO> readRentalBestRandom20();
	public List<GeneralBookDTO> readNewestRandom20();
	public List<GeneralBookDTO> readRecommendRandom20();
	
	public List<BorrowBookDTO> readBorrowBookAll(PageStartEnd se);
	public BorrowBookDTO readBorrowBookByLid(long libraryBookId);
}
