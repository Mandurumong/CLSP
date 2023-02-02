package com.project.clsp.service;

import java.util.List;
import java.util.Map;

public interface IBoardService {
	
	int getBoardCount(Map<String, Object> map);
	List<Map<String, Object>> getBoards(Map<String, Object> map); 
	void updateHit(int fbNum, String hit);
	Map<String, Object> getBoardView(int fbNum);
	List<Map<String, Object>> getReplies(int fbNum);
	int currentBoardIdx();
	void insertReply(Map<String,Object>map);
	void insertReplyBoard(Map<String,Object>map);
	void replyDelete(int replyNum);
	int insertBoard(Map<String, Object> map);
	void updateBoard(Map<String, Object> map);
	
}
