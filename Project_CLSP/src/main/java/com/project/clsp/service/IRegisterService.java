package com.project.clsp.service;

import com.project.clsp.model.MemberDto;

public interface IRegisterService {

	public void insertMember(MemberDto member);
	
	public int idCheck(String user_id);
}
