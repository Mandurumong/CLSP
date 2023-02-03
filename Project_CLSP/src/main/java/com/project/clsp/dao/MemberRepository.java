package com.project.clsp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import com.project.clsp.model.MemberDto;

@Repository
public class MemberRepository implements IMemberRepository{
	
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
	//회원가입
	@Override
	public void insertMember(MemberDto member) {
		try {
		String sql = "insert into Member values(?, ?, ?, to_char(sysdate), ?)";
		jdbcTemplate.update(sql, member.getUser_id(),
								 member.getUser_pw(),
								 member.getUser_email(),
								 member.getUser_level());
		}catch(Exception e) {
			System.out.println("insert 실행 예외");
			e.printStackTrace();
		}
	}

	//아이디찾기
	@Override
	public String findId(MemberDto member) {
		
		String user_id = sqlSession.selectOne("member.findId", member);
		
		return user_id;
	}

	//비번찾기
	@Override
	public String findPw(MemberDto member) {
		
		String user_pw = sqlSession.selectOne("member.findPw", member);
		
		return user_pw;
	}

	//로그인
	@Override
	public MemberDto login(String user_id, String user_pw) {
		
		MemberDto login = null;
		
		try {
		String sql = "SELECT user_id, user_pw, user_email, reg_date, user_level FROM Member WHERE user_id = ?";
			
		MemberDto memberDto = jdbcTemplate.queryForObject(sql, new MemberMapper(), user_id);
		
		if(memberDto.getUser_pw().equals(user_pw)) {
			
			login = new MemberDto(user_id, user_pw, memberDto.getUser_email(), memberDto.getReg_date(), memberDto.getUser_level());
			
		}
		else {
			return null;
		}
		}
		catch(Exception e) {
			System.out.println("login error");
			e.printStackTrace();
		}
		
		return login;
	}
	
	//정보 수정
	@Override
	public void updateData(String user_id, MemberDto memberDto) {
		String sql = "UPDATE member SET user_pw=?, user_email=? WHERE user_id=?";
		
		jdbcTemplate.update(sql, memberDto.getUser_pw(), memberDto.getUser_email(), user_id);
		
	}

	//회원 목록
	@Override
	public List<MemberDto> memberList() {
		String sql = "SELECT * FROM member ORDER BY reg_date DESC";
		List<MemberDto> memberList = jdbcTemplate.query(sql, new MemberMapper());
		
		return memberList;
	}

	//한명 리스트 가져오기
	@Override
	public MemberDto getOneList(String user_id) {
		String sql = "SELECT * FROM member WHERE user_id=?";
		
		System.out.println(user_id);
		
		return jdbcTemplate.queryForObject(sql, new MemberMapper(), user_id);
	}
	//비번 체크
	@Override
	public String checkPw(String user_pw) {
		String checkPw = null;
		try {
		String sql = "SELECT user_id FROM member WHERE user_pw=? ";
		
		checkPw = jdbcTemplate.queryForObject(sql, String.class, user_pw);
		return checkPw;
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return checkPw;
	}
	
	//회원 삭제
	@Override
	public void deleteMember(String user_id) {
		sqlSession.delete("member.deleteMember", user_id);
		
	}
	
	//아이디 중복검사
	@Override
	public int idCheck(String user_id) {
		
		String sql = "SELECT COUNT(user_id) FROM member WHERE user_id=?";

		int cnt = jdbcTemplate.queryForObject(sql, Integer.class, user_id);
		
		return cnt;
	}
}
