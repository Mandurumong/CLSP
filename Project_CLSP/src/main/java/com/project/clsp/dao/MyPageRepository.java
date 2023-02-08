package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageRepository{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Inject
	SqlSession sqlSession;

//	public Map<String, Object> getMember(String user_id) {
//		System.out.println("getMember repository");
//
//		return sqlSession.selectMap("mypage.getMember", "all", user_id);
//	}
	
	public Map<String, Object> getMember(String user_id){
		System.out.println("getMember repository");
		
		String sql = "select * from member where user_id = ?";
		
		return jdbcTemplate.queryForMap(sql, user_id);
	}
	
	public List<Map<String, Object>> getMyBoards(Map<String, Object> map) {
		return sqlSession.selectList("mypage.getMyBoards", map);
	}

	
	public int getBoardCount(String id) {
		return sqlSession.selectOne("mypage.getBoardCount", id);
	}
	
	
	public List<Map<String, Object>> getMyReplies(Map<String, Object> map) {
		return sqlSession.selectList("mypage.getMyReplies", map);
	}
	
	
	public int getReplyCount(String id) {
		return sqlSession.selectOne("mypage.getReplyCount", id);
	}
	
	
	public void withdrawal(String id) {
		sqlSession.delete("mypage.withdrawal", id);
		
	}

	
	public void updateProfile(Map<String, Object> map) {
		sqlSession.update("mypage.updateProfile", map);
		
	}

}
