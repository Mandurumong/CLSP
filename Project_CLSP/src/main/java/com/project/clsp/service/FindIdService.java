package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class FindIdService implements IFindIdService{

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public String findId(MemberDto member) {
		return memberRepository.findId(member);
	}
}
