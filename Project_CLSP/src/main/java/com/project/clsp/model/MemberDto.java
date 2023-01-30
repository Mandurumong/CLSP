package com.project.clsp.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

@Getter
@Setter
public class MemberDto {
	private String user_id;
	private String user_pw;
	private String user_email;
	private String reg_date;
	private int user_level;
	
	public MemberDto() {}
	
	public MemberDto(String user_id, String user_pw, String user_email, int user_level) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_level = user_level;
	}
	
	public MemberDto(String user_id, String user_pw, int user_level) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_level = user_level;
	}
	
	public MemberDto(String user_id, String user_pw, String user_email, String reg_date, int user_level) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.reg_date = reg_date;
		this.user_level = user_level;
	}
}
