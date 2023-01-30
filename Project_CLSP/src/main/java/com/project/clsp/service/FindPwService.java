package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class FindPwService implements IFindPwService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public String findPw(MemberDto member) {
		
		return memberRepository.findPw(member);
	
}
}
