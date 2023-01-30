package com.project.clsp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class AdminUserInfoService implements IAdminUserInfoService{

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public List<MemberDto> memberList() {

		return memberRepository.memberList();
	}
}
