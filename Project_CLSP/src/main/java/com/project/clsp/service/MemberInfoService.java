package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class MemberInfoService implements IMemberInfoService{
	
	@Autowired
	IMemberRepository memberRepositroy;
	
	@Override
	public MemberDto memberInfo(String user_id) {
		
		return memberRepositroy.getOneList(user_id);
	}

}
