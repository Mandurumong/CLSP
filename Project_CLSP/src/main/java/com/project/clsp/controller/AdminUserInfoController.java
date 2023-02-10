package com.project.clsp.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.model.MemberDto;
import com.project.clsp.model.PagingDto;
import com.project.clsp.service.IAdminUserInfoService;

@Controller
public class AdminUserInfoController {
	
	@Autowired
	IAdminUserInfoService adminUserInfoService;
	
	@RequestMapping(value="/memberList.do")
	public String memberList(
			@RequestParam(required = false, defaultValue="1")int page,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword,
			HttpServletRequest req, Model model) {
		
		System.out.println("type : " + type);
		System.out.println("keyword: " + keyword);
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		System.out.println(map);
		
		int cnt = adminUserInfoService.getMemberCount(map);
		System.out.println("cnt : " + cnt);
		
		PagingDto paging = new PagingDto(cnt, page, 10);
		
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		Enumeration<String> attributes = req.getSession().getAttributeNames();
		while(attributes.hasMoreElements()) {
			String attribute = (String) attributes.nextElement();
			System.err.println(attribute+" : "+req.getSession().getAttribute(attribute));
		}
		
		model.addAttribute("paging", paging);
		
		List<MemberDto> memberList = adminUserInfoService.memberList();
		model.addAttribute("memberList", memberList);
		
		return "admin_member";
	}
	
	@RequestMapping(value="/memberList")
	public String searchMember(
			@RequestParam(required = false, defaultValue="1")int page,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword,
			HttpServletRequest req, Model model) {
		
		System.out.println("type : " + type);
		System.out.println("keyword: " + keyword);
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		System.out.println(map);
		
		int cnt = adminUserInfoService.getMemberCount(map);
		System.out.println("cnt : " + cnt);
		
		PagingDto paging = new PagingDto(cnt, page, 10);
		
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		Enumeration<String> attributes = req.getSession().getAttributeNames();
		while(attributes.hasMoreElements()) {
			String attribute = (String) attributes.nextElement();
			System.err.println(attribute+" : "+req.getSession().getAttribute(attribute));
		}
		
		model.addAttribute("paging", paging);
		
		List<Map<String, Object>> memberList = adminUserInfoService.getMemberList(map);
		model.addAttribute("memberList", memberList);
		
		return "admin_member2";
		
	}

}
