package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IFindIdService;

@Controller
public class FindAccountController {

	@Autowired
	IFindIdService findAccount;
	
	@GetMapping("/findAccount")
	public String findAccount() {
		return "findAccount";
	}
	
	@PostMapping("/findId.do")
	public String findaccount(
			@RequestParam(value="user_email")String user_email,
			@RequestParam(value="user_pw")String user_pw, Model model) {
		
		MemberDto findId = new MemberDto();
		
		findId.setUser_email(user_email);
		findId.setUser_pw(user_pw);
		
		String user_id = findAccount.findId(findId);
		
		model.addAttribute("user_id", user_id);
		
		return "findAccountResult";
	}
	
	
}
