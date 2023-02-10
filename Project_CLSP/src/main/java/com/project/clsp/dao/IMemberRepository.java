package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import com.project.clsp.model.MemberDto;

public interface IMemberRepository {

	public void insertMember(MemberDto member);
	
	public String findId(MemberDto member);
	
	public String findPw(MemberDto member);
	
	public MemberDto login(String user_id, String user_pw);
	
	public void updateData(String user_id, MemberDto memberDto);
	
	public List<MemberDto> memberList();
	
	public MemberDto getOneList(String user_id);
	
	public String checkPw(String user_pw); 
	
	public void deleteMember(String user_id);
	
	public int idCheck(String user_id);
	
	public int getMemberCount(Map<String, Object> map);
	
	public List<Map<String, Object>> getMemberList(Map<String, Object> map);
}
