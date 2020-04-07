package kr.co.jhta.dto;

import java.sql.Date;

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
public class ReadingRoomDTO {
	long rentSeatId;
	long seatId;
	long userId;
	String startTime;
	String endTime;
	byte status;
	
	

}
