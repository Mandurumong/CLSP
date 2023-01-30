package com.project.clsp.service;

import com.project.clsp.model.MemberDto;

public interface IAdminInfoService {

	public MemberDto amdinInfo(String user_id);
	
	public String adminpage(String user_pw);
}
