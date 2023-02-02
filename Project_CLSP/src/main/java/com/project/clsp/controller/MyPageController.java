package com.project.clsp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.clsp.service.IMemberInfoService;
import com.project.clsp.service.IMemberService;

@Controller
public class MyPageController {
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IMemberInfoService memberInfoService;
	
	@PostMapping(value="/confirm")
	public String mypageConfirm(Model model, HttpServletRequest req, RedirectAttributes attributes, @RequestParam Map<String, Object> map) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		Map<String, Object> member = (Map<String, Object>) memberInfoService.memberInfo(id);
		System.out.println("confirm map" + map);
		
		if(map.get("pw").toString().equals(member.get("user_pw").toString())) {
			return "mypage.modify";
		}else {
			attributes.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "confirm/view";
		}
	}
	
	@RequestMapping(value="/confirm/view", method=RequestMethod.GET )
	public String mypageConfirmView(Model model, HttpServletRequest req, @RequestParam Map<String, Object> map) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		System.out.println("confirm map" + map);
		
		
		return "/mypage/mypage_info";
	}
}
