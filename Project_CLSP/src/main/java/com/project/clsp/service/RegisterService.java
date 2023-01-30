package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class RegisterService implements IRegisterService{

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void insertMember(MemberDto member) {
	
		memberRepository.insertMember(member);
	}
	
	@Override
	public int idCheck(String user_id) {
		int cnt = memberRepository.idCheck(user_id);
		return cnt;
	}
}
