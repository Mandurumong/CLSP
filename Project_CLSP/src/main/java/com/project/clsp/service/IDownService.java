package com.project.clsp.service;


import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.project.clsp.model.MemberDto;

public interface IDownService {
	
	public void excelMDown(MemberDto memberDto, HttpServletResponse response) throws Exception;

	public void excelBDown(Map<String, Object> map, HttpServletResponse response);
}
