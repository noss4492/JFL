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
public class UserDTO {
	long userId;
	String username;
	String password;
	String email;
	String name;
	String nickname;
	byte gender;
	String birth;
	byte ageGroup;
	String registerDate;
	byte platformStatus;
	byte rightStatus;
	byte gradeStatus;
}
