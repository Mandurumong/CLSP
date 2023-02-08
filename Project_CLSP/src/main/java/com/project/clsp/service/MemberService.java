package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.dao.MemberRepository;
import com.project.clsp.dao.MyPageRepository;
import com.project.clsp.model.MemberDto;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MyPageRepository myPageRepository;
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public Map<String, Object> getMember(String id) {
		System.out.println("getMember Service");
		return myPageRepository.getMember(id);
	}

	@Override
	public List<Map<String, Object>> getMyBoards(Map<String, Object> user_id) {
		return myPageRepository.getMyBoards(user_id) ;
	}

	@Override
	public List<Map<String, Object>> getMyReplies(Map<String, Object> user_id) {
		return myPageRepository.getMyReplies(user_id) ;
	}

	@Override
	public int getBoardCount(String user_id) {
		return myPageRepository.getBoardCount(user_id);
	}

	@Override
	public int getReplyCount(String user_id) {
		return myPageRepository.getReplyCount(user_id);
	}
	
	@Override
	public void updateProfile(Map<String, Object> m) {
		myPageRepository.updateProfile(m);
	}
	
	@Override
	public void withdrawal(String id) {
		myPageRepository.withdrawal(id);
		
	}

}
