package com.project.clsp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IAdminUserInfoService;

@Controller
public class AdminUserInfoController {
	
	@Autowired
	IAdminUserInfoService adminUserInfoService;
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		
		List<MemberDto> memberList = adminUserInfoService.memberList();
		model.addAttribute("memberList", memberList);
		
		return "admin_member";
	}

}
