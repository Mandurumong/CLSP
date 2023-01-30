package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IRegisterService;

@Controller
public class RegisterController {
	
	@Autowired
	IRegisterService registerService;
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	//아이디 중복 체크
	@PostMapping(value="/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) {
		
		int cnt = registerService.idCheck(user_id);
		return cnt;
	}
	//회원가입
	@PostMapping(value="/insertMember.do")
	public String insertMember(MemberDto member) {
		
		try {
			registerService.insertMember(member);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}

		return "index"; 
	}

}
