package com.project.clsp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IDownService;

@Controller
public class DownloadController {
	
	@Autowired
	IDownService downService;
	
	@RequestMapping(value="/MemberDown.do")
	public void memberDownload(@ModelAttribute MemberDto member, HttpServletResponse response, HttpServletRequest request) throws Exception {
		downService.excelMDown(member, response);
		
	}
	
	@RequestMapping(value="/BoardDown.do")
	public void boardDownload() {

	}

}
