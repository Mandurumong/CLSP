package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import com.project.clsp.model.MemberDto;

public interface IMemberService {
	
	Map<String, Object> getMember(String id);
	
//	MemberDto getOneList(String user_id);

	List<Map<String, Object>> getMyBoards(Map<String, Object> map);
		
	List<Map<String, Object>> getMyReplies(Map<String, Object> map);
		
	int getBoardCount(String id);
		
	int getReplyCount(String id);

	void updateProfile(Map<String, Object> map);

	void withdrawal(String id);
}
