package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IMypageRepository;
import com.project.clsp.model.MemberDto;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	IMypageRepository myPageRepository;
	
	@Override
	public MemberDto getMember(String user_id) {
		return myPageRepository.getMyInfo(user_id);
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

}
