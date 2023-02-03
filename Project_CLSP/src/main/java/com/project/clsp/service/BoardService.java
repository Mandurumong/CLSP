package com.project.clsp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IBoardRepository;

@Service
public class BoardService implements IBoardService{
	
	@Autowired
	IBoardRepository boardRepository;

	@Override
	public int getBoardCount(Map<String, Object> map) {
		return boardRepository.getBoardCount(map);
	}

	@Override
	public List<Map<String, Object>> getBoards(Map<String, Object> map) {
		return boardRepository.getBoards(map);
	}

	@Override
	public void updateHit(int fbNum, String hit) {
		int count = Integer.parseInt(hit);
		Map<String, Object> map = new HashMap<>();
		map.put("fbNum", fbNum);
		map.put("count", count+1);
		
		System.out.println("hit map "+ map);
		
		boardRepository.updateHit(map);
		
	}

	@Override
	public Map<String, Object> getBoardView(int fbNum) {
		return boardRepository.getBoardView(fbNum);
	}

	@Override
	public List<Map<String, Object>> getReplies(int fbNum) {
		return boardRepository.getReplies(fbNum);
	}

	@Override
	public int currentBoardIdx() {
		return boardRepository.currentBoardIdx();
	}

	@Override
	public void insertReply(Map<String, Object> map) {
		boardRepository.insertReply(map);
	}

	@Override
	public void insertReplyBoard(Map<String, Object> map) {
		boardRepository.updateReplySort(map);
		boardRepository.insertReplyBoard(map);
	}

	@Override
	public void replyDelete(int replyNum) {
		boardRepository.replyDelete(replyNum);
	}

	@Override
	public int insertBoard(Map<String, Object> map) {
		return boardRepository.insertBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		boardRepository.updateBoard(map);
	}
	@Override
	public void deleteBoard(int fbNum) {
		boardRepository.deleteBoard(fbNum);
	}

}
