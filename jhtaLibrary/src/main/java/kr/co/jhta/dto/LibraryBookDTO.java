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
public class LibraryBookDTO {
	long libraryBookId;
	String generalBookId;
	String registrationDate;
	int rentalCnt;
	byte status;
}
