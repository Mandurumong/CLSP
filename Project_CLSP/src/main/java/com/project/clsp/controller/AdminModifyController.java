package com.project.clsp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IAdminModifyService;

@Controller
public class AdminModifyController {

	@Autowired
	IAdminModifyService adminModifyService;
	
	@GetMapping(value="/admin_modify")
	public String adminModifyPage() {
		return "admin_modify";
	}
	
	@PostMapping(value="adminModify.do")
	public String adminModify(
			@RequestParam(value="user_pw")String user_pw,
			@RequestParam(value="user_email")String user_email,
			HttpSession session, Model model) {
				
		String user_id = (String)session.getAttribute("user_id");
		
		MemberDto updMember = new MemberDto();
		
		updMember.setUser_id(user_id);
		updMember.setUser_pw(user_pw);
		updMember.setUser_email(user_email);
		
		model.addAttribute("adminInfo", updMember);
		
		adminModifyService.adminModify(user_id, updMember);
		
		return "admin_info";
	}
}
