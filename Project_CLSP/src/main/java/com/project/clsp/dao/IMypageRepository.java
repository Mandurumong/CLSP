package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.project.clsp.model.MemberDto;

@Repository
public interface IMypageRepository {
	
	MemberDto getMyInfo(String id);
	
	List<Map<String, Object>> getMyBoards(Map<String, Object> map);
	
	List<Map<String, Object>> getMyReplies(Map<String, Object> map);
	
	int getBoardCount(String id);
	
	int getReplyCount(String id);
	
	void updateProfile(Map<String, Object> m);
}
