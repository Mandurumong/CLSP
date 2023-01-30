package com.project.clsp.service;

import com.project.clsp.model.MemberDto;

public interface ILoginService {

	public MemberDto login(String user_id, String user_pw);
}
