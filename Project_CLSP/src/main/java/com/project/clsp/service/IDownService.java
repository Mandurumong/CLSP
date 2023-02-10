package com.project.clsp.service;

import javax.servlet.http.HttpServletResponse;

import com.project.clsp.model.MemberDto;

public interface IDownService {
	
	public void excelMDown(MemberDto memberDto, HttpServletResponse response) throws Exception;

	public void excelBDown();
}
