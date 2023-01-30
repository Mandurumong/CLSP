package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.clsp.service.IMemberInfoService;

@Controller
public class MemberInfoController {
	
	@Autowired
	IMemberInfoService memberInfoService;
	
	@RequestMapping("memberInfo.do")
	public String memberInfo(String user_id, Model model) {
		
		model.addAttribute("dto", memberInfoService.memberInfo(user_id));
		
		return "member_info";
	}
	
	@RequestMapping("member_delete")
	public String member_delete() {
		return "member_delete";
	}
	
	

}
