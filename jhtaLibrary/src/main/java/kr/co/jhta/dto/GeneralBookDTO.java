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
}
