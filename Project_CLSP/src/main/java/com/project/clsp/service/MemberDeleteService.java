package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;

@Service
public class MemberDeleteService implements IMemberDeleteService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void deleteMember(String user_id) {
		memberRepository.deleteMember(user_id);		
	}

}
