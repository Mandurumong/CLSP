package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class AdminInfoService implements IAdminInfoService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public MemberDto amdinInfo(String user_id) {
		return memberRepository.getOneList(user_id);
	}
	@Override
	public String adminpage(String user_pw) {
		return memberRepository.checkPw(user_pw);
	}

}
