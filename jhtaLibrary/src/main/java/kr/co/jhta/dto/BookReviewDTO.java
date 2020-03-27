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
public class BookReviewDTO {
	long bookReviewId;
	long libraryBookId;
	long userId;
	String title;
	String content;
	String createdDate;
	float rate;
	int likeCnt;
}
