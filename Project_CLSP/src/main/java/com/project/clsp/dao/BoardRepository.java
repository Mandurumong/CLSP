package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository {
	
	int getBoardCount(Map<String, Object> map);
	
	List<Map<String, Object>> getBoards(Map<String, Object> map);

	void updateHit(Map<String, Object> map);

	Map<String, Object> getBoardView(int fbNum);
	
	List<Map<String, Object>> getReplies(int fbNum);

	int insertBoard(Map<String, Object> map);
	
	int currentBoardIdx();

	void updateBoard(Map<String, Object> map);

	void deleteBoard(int fbNum);

	void insertReply(Map<String, Object> map);

	void insertReplyBoard(Map<String, Object> map);
	
	void updateReplySort(Map<String, Object> map);

	void replyDelete(int replyNum);
}
