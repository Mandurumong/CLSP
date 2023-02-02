package com.project.clsp.service;

import java.util.List;
import java.util.Map;

public interface IMemberService {

	 List<Map<String, Object>> getMyBoards(Map<String, Object> map);
		
		List<Map<String, Object>> getMyReplies(Map<String, Object> map);
		
		int getBoardCount(String id);
		
		int getReplyCount(String id);
}
