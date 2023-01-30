package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.service.IMemberDeleteService;

@Controller
public class DeleteMemberController {
	
	@Autowired
	IMemberDeleteService deleteMember;
	
	@RequestMapping("deleteMember.do")
	public String memberDelete(@RequestParam String user_id) {
		System.out.println("deleteMember.do ½ÇÇà");
		deleteMember.deleteMember(user_id);
		return "memberList";
	}

}
