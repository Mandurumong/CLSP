package com.project.clsp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.ILoginService;

@Controller
public class LoginController {
	
	@Autowired
	ILoginService loginService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value="/login.do")
	public String login(
			@RequestParam(value="user_id", required=true)String user_id, 
			@RequestParam(value="user_pw", required=true)String user_pw, HttpSession session, RedirectAttributes attributes) {
		
		MemberDto ls = loginService.login(user_id, user_pw);
		
		if(ls == null) {
			attributes.addFlashAttribute("msg", "일치하는 회원이 없습니다.");
			return "redirect:/login";
		}
		else {
			session.setAttribute("user_id", ls.getUser_id());
			session.setAttribute("user_pw", ls.getUser_pw());
			session.setAttribute("user_email", ls.getUser_email());
			session.setAttribute("user_level", ls.getUser_level());
			
			return "index";			
		}	
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {		
		session.removeAttribute("user_id");
		return "logout";
	}
}
