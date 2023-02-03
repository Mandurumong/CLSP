package com.project.clsp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.project.clsp.model.MemberDto;

@Repository
public class MypageRepository implements IMypageRepository{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Inject
	SqlSession sqlSession;
	
	private class MemberMapper implements RowMapper<MemberDto>{

		@Override
		public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			MemberDto memberDto = new MemberDto();
			
			memberDto.setUser_id(rs.getString("user_id"));
			memberDto.setUser_pw(rs.getString("user_pw"));
			memberDto.setUser_email(rs.getString("user_email"));
			memberDto.setReg_date(rs.getString("reg_date"));
			memberDto.setUser_level(rs.getInt("user_level"));
			
			return memberDto;
		}
		
	}
	
	@Override
	public MemberDto getMyInfo(String id) {
		String sql = "select * from member where user_id = ?";
		MemberDto member = jdbcTemplate.queryForObject(sql, new MemberMapper(), id);
		
		return member;
	}
	
	@Override
	public List<Map<String, Object>> getMyBoards(Map<String, Object> map) {
		
		return sqlSession.selectList("mypage.getMyBoards", map);
	}

	@Override
	public List<Map<String, Object>> getMyReplies(Map<String, Object> map) {

		return sqlSession.selectList("mypage.getMyReplies", map);
	}

	@Override
	public int getBoardCount(String id) {

		return sqlSession.selectOne("mypage.getBoardCount", id);
	}

	@Override
	public int getReplyCount(String id) {

		return sqlSession.selectOne("mypage.getReplyCount", id);
	}

	@Override
	public void updateProfile(Map<String, Object> m) {
		sqlSession.update("mypage.updateProfile", m);
	}
	

}
