package kr.co.jhta.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GeneralBookDTO {
	String generalBookId;
	String genre;
	String title;
	String description;
	String detailUrl;
	String publicationDate;
	String publisher;
	String thumbnailUrl;
	byte status;
	byte recommendStatus;
	String authorName;// 가상의 컬럼임. 자주 쓰여서 그냥 추가해놓은 것일뿐임.
}
