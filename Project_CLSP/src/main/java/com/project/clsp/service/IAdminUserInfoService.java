package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import com.project.clsp.model.MemberDto;

public interface IAdminUserInfoService {

	public List<MemberDto> memberList();

	public int getMemberCount(Map<String, Object> map);
	
	public List<Map<String, Object>> getMemberList(Map<String, Object> map);
}
