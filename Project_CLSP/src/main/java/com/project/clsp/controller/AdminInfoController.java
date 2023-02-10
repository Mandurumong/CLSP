package com.project.clsp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IAdminInfoService;

@Controller
public class AdminInfoController {

	@Autowired
	IAdminInfoService adminInfoService;
	
	@GetMapping(value="/admin_page")
	public String adminPage() {
		return "admin_page";
	}
	
	@PostMapping(value="adminInfo.do")
	public String adminInfo(
			@RequestParam(value="user_pw", required=true)String user_pw, Model model, HttpSession session) {
		
		MemberDto memberDto = new MemberDto();
		
		String user_id = (String)session.getAttribute("user_id");
		
		String checkid = adminInfoService.adminpage(user_pw);
		
		if(user_id.equals(checkid)){
		
			memberDto.setUser_id(user_id);
			model.addAttribute("user_id", user_id);
			memberDto = adminInfoService.amdinInfo(user_id);
		
			model.addAttribute("adminInfo", memberDto);
			session.setAttribute("adminInfo", memberDto);
		
			return "admin_info";
		}
		else {
			return "admin_page";
		}
	}
}
