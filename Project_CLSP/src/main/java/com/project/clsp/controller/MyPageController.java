package com.project.clsp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.clsp.model.MemberDto;
import com.project.clsp.service.IMemberInfoService;
import com.project.clsp.service.IMemberService;

@Controller
public class MyPageController {
	
	@Autowired
	IMemberService memberService;
	
	@PostMapping(value="/confirm")
	public String mypageConfirm(Model model, HttpServletRequest req, RedirectAttributes attributes, @RequestParam(value="pw")String pw){
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		System.out.println(id);
		
		System.out.println(memberService.getMember(id));
		
		MemberDto member = memberService.getMember(id);
		System.out.println(member);
		
		if(pw.equals(member.getUser_pw())) {
			return "/mypage/modify";
		}else {
			attributes.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/confirm/view";
		}
	}
	
	@GetMapping(value="/confirm/view")
	public String mypageConfirmView(Model model, HttpServletRequest req, @RequestParam Map<String, Object> map) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		
		return "/mypage/mypage_info";
	}
}
