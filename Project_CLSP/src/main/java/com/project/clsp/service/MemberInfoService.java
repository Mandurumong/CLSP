package com.project.clsp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class MemberInfoService implements IMemberInfoService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public MemberDto memberInfo(String user_id) {		
		return memberRepository.getOneList(user_id);
	}
}
