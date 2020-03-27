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
public class ArticleDTO {
	long articleId;
	long userId;
	String title;
	String content;
	int hits;
	String createdDate;
	char categoryStatus;
}
