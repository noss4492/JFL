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
public class ReserveBookDTO {
	long reserveBookId;
	long libraryBookId;
	long userId;
	String applyDate;
	String startDate;
	String endDate;
	byte status;
}
