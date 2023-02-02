package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.Member2Repository;

@Service
public class MemberService implements IMemberService{
	
	@Autowired(required = false)
	Member2Repository memberRepository;

	@Override
	public List<Map<String, Object>> getMyBoards(Map<String, Object> user_id) {
		return memberRepository.getMyBoards(user_id) ;
	}

	@Override
	public List<Map<String, Object>> getMyReplies(Map<String, Object> user_id) {
		return memberRepository.getMyReplies(user_id) ;
	}

	@Override
	public int getBoardCount(String user_id) {
		return memberRepository.getBoardCount(user_id);
	}

	@Override
	public int getReplyCount(String user_id) {
		return memberRepository.getReplyCount(user_id);
	}

}
