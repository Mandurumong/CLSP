package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface Member2Repository {
	
	List<Map<String, Object>> getMyBoards(Map<String, Object> map);
	
	List<Map<String, Object>> getMyReplies(Map<String, Object> map);
	
	int getBoardCount(String id);
	
	int getReplyCount(String id);
	
	void updateProfile(Map<String, Object> m);
}
