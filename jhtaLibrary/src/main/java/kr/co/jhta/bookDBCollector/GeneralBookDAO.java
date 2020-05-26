package kr.co.jhta.bookDBCollector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class GeneralBookDAO {
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;

	public GeneralBookDAO() {
		System.out.println("dao 호출함.");
		conn = MakeConnection.getInstance().getConnection();
		System.out.println(conn+" : 연결됨");
	}
	
	synchronized public void insertOneBook(GeneralBookDTO gbDTO) throws SQLIntegrityConstraintViolationException {
		sb.setLength(0);
		sb.append("INSERT INTO ADMIN.GENERAL_BOOK(GENERAL_BOOK_ID, GENRE, TITLE, DESCRIPTION, ");
		sb.append("DETAIL_URL, PUBLICATION_DATE, PUBLISHER, THUMBNAIL_URL, STATUS, RECOMMEND_STATUS) ");
		sb.append("VALUES (?, ?, ?, ?, ?, ");
		sb.append("TO_DATE(?, 'YYYY-MM-DD'), ?, ?, 0, 0) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			//pstmt.setString(1, Long.toString((long)gbDTO.getGeneralBookId()));
			pstmt.setString(1, gbDTO.getGeneralBookId());
			pstmt.setString(2, gbDTO.getGenre());
			pstmt.setString(3, gbDTO.getTitle());
			pstmt.setString(4, gbDTO.getDescription());
			pstmt.setString(5, gbDTO.getDetailUrl());
//			System.out.println("완성 "+"TO_DATE(\'"+gbDTO.getPublicationDate()+"\', 'YYYY-MM-DD')");
//			pstmt.setString(6, "(select (\'"+gbDTO.getPublicationDate()+"\', 'YYYY-MM-DD') from dual ) as");
			pstmt.setString(6, gbDTO.getPublicationDate());
			pstmt.setString(7, gbDTO.getPublisher());
			pstmt.setString(8, gbDTO.getThumbnailUrl());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// generalbook이 insertonebook된 후 바로 다음 두 sql문이 실행되어야함.
	synchronized public void insertAuthor(String bookId, ArrayList<String> authorList) {
//		System.out.println("저자가 "+authorList.size()+"명 ");
		for(int i = 0 ; i < authorList.size(); i++) {
			sb.setLength(0);
			sb.append("INSERT INTO ADMIN.AUTHOR(AUTHOR_ID, GENERAL_BOOK_ID, AUTHOR_NAME) ");
			sb.append("VALUES (AUTHOR_SEQ.NEXTVAL, ?, ? ) ");
		
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, bookId);
				pstmt.setString(2, authorList.get(i));
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	synchronized public void insertTranslator(String bookId, ArrayList<String> translatorList) {
		for(int i = 0 ; i < translatorList.size(); i++) {
			sb.setLength(0);
			sb.append("INSERT INTO ADMIN.translator(TRANSLATOR_ID, GENERAL_BOOK_ID, TRANSLATOR_NAME) ");
			sb.append("VALUES (TRANSLATOR_SEQ.NEXTVAL, ?, ? ) ");
		
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, bookId);
				pstmt.setString(2, translatorList.get(i));
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	synchronized public void insertBookKeyword(String bookId, ArrayList<String> tagList) {
		for(int i = 0 ; i < tagList.size(); i++) {
			sb.setLength(0);
			sb.append("INSERT INTO ADMIN.BOOK_KEYWORD(BOOK_KEYWORD_ID, GENERAL_BOOK_ID, KEYWORD) ");
			sb.append("VALUES (BOOK_KEYWORD_SEQ.NEXTVAL, ?, ? ) ");
			System.out.println("#"+tagList.get(i));
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, bookId);
				pstmt.setString(2, tagList.get(i));
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/*
	public GeneralBookDTO selectOne(long dno) {
		TRANSLATOR_SEQ vo = new TRANSLATOR_SEQ();
		sb.setLength(0);
		sb.append("SELECT DNO, NOTICE_NO, STATUS, VARIETY, COLOR, GENDER, N_STATUS, AGE, "				);
		sb.append("WEIGHT, RECEIVING_DATE, DISCOVER_SPOT, FEATURE, ANNOUNCE_LIMIT, CENTER_NAME_PHONE, "	);
		sb.append("PLACE_OF_PROTECTION, COMPETENT_AUTHORITY, CONTACT_CONTACTS, SPECIAL_NOTE, "			);
		sb.append("BIG_IMG_PATH, SML_IMG_PATH FROM ANIMAL WHERE DNO = ?"								);

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, dno);
			rs = pstmt.executeQuery();
			rs.next();
				vo = new AnimalVO(
						rs.getLong(1), 
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getInt(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13),
						rs.getString(14),
						rs.getString(15),
						rs.getString(16),
						rs.getString(17),
						rs.getString(18),
						rs.getString(19),
						rs.getString(20)
						);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	*/
	
	public void close() {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
