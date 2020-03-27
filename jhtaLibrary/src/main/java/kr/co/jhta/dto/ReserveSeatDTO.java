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
public class ReserveSeatDTO {
	long reserveSeatId;
	long readingRoomId;
	long userId;
	String reserveDate;
	String startTime;
	String endTime;
	String requestDate;
	byte status;
}
