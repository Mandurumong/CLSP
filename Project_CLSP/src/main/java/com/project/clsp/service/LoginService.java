package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class LoginService implements ILoginService{
	
	@Autowired
	IMemberRepository memberRepository;

	@Override
	public MemberDto login(String user_id, String user_pw) {
		
		return memberRepository.login(user_id, user_pw);
	}

}
