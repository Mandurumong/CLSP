package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IFindPwService;

@Controller
public class FindPwController {

	@Autowired
	IFindPwService findPassword;
	
	@GetMapping("/findPassword")
	public String findPassword() {
		return "findPassword";
	}
	
	@PostMapping("findPw.do")
	public String findPw(
			@RequestParam(value="user_id", required=true)String user_id,
			@RequestParam(value="user_email")String user_email, Model model) {
		
		MemberDto findPw = new MemberDto();
		
		findPw.setUser_id(user_id);
		findPw.setUser_email(user_email);
		
		String user_pw = findPassword.findPw(findPw);
		
		model.addAttribute("user_pw", user_pw);
		
		return "findPasswordResult";
	}
}
