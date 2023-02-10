package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository implements IBoardRepository{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int getBoardCount(Map<String, Object> map) {
		
		return sqlSession.selectOne("board.getBoardCount", map);
	}

	@Override
	public List<Map<String, Object>> getBoards(Map<String, Object> map) {
		
		return sqlSession.selectList("board.getBoards", map);
	}

	@Override
	public void updateHit(Map<String, Object> map) {
		sqlSession.update("board.updateHit", map);	
	}

	@Override
	public Map<String, Object> getBoardView(int fbNum) {
		return sqlSession.selectMap("board.getBoardView", fbNum, "all");
	}

	@Override
	public List<Map<String, Object>> getReplies(int fbNum) {
		return sqlSession.selectList("board.getReplies", fbNum);
	}

	@Override
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("board.insertBoard", map);
	}

	@Override
	public int currentBoardIdx() {
		return sqlSession.selectOne("board.currentBoardIdx");
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		sqlSession.update("board.updateBoard", map);
		
	}

	@Override
	public void deleteBoard(int fbNum) {
		sqlSession.delete("board.deleteBoard", fbNum);
		
	}

	@Override
	public void insertReply(Map<String, Object> map) {
		sqlSession.insert("board.insertReply", map);
		
	}

	@Override
	public void insertReplyBoard(Map<String, Object> map) {
		sqlSession.insert("board.insertReplyBoard", map);
		
	}

	@Override
	public void updateReplySort(Map<String, Object> map) {
		sqlSession.update("board.updateReplySort", map);
		
	}

	@Override
	public void replyDelete(int replyNum) {
		sqlSession.delete("board.replyDelete", replyNum);
		
	}

}
