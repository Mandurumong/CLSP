package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class AdminModifyService implements IAdminModifyService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void adminModify(String user_id, MemberDto memberDto) {
		
		memberRepository.updateData(user_id, memberDto);	
	}

}
