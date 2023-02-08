package com.project.clsp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.clsp.model.PagingDto;
import com.project.clsp.service.IMemberService;

@Controller
public class MyPageController {
	
	@Autowired
	IMemberService memberService;
	
	@PostMapping(value="/confirm")
	public String mypageConfirm(Model model, HttpServletRequest req, RedirectAttributes attributes, @RequestParam(value="user_pw")String pw){
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		System.out.println(id);
		
		Map<String, Object> member = memberService.getMember(id);
		System.out.println(member);
		
		if(pw.equals(member.get("user_pw").toString())) {
			return "/mypage/modify";
		}else {
			attributes.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/confirm/view";
		}
	}
	
	@GetMapping(value="/confirm/view")
	public String mypageConfirmView(Model model, HttpServletRequest req, @RequestParam Map<String, Object> map) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		
		return "/mypage/mypage_info";
	}
	
	@GetMapping(value="/mypage")
	public String mypage(Model model, HttpServletRequest req,@RequestParam(required=false, defaultValue ="1") int rpage, @RequestParam(required=false, defaultValue ="1") int page ) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		int bCount = memberService.getBoardCount(id);
		int cnt = memberService.getReplyCount(id);
		Map<String, Object> map = new HashMap<>();
		PagingDto paging = new PagingDto(bCount, page, 10);
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		map.put("id", id);
		model.addAttribute("board",  memberService.getMyBoards(map));
		model.addAttribute("bPaging",  paging);
		
		PagingDto rp = new PagingDto(cnt, rpage, 10);
		map.put("rstart", rp.getStart());
		map.put("rend", rp.getEnd());
		model.addAttribute("reply",  memberService.getMyReplies(map));
		model.addAttribute("rPaging",  rp);
		
		return "/mypage/userQna";
	}
	
	@GetMapping(value="/mypage/modify")
	public String modifyView(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		model.addAttribute("member",  memberService.getMember(id));
		return "/mypage/modify";
	}
	
	@PostMapping(value="/mypage/modify")
	public String modify(Model model, HttpServletRequest req, @RequestParam Map<String,Object>map, RedirectAttributes attributes) {
		System.out.println("modify map" + map);
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		map.put("id", id);
	
		Map<String, Object> member =  memberService.getMember(id);
		System.out.println("confirm map" + map);
		
		if(!map.get("npw").toString().equals(map.get("npwc").toString())) {
			attributes.addFlashAttribute("msg", "새 비밀번호 확인이 일치하지 않습니다.");
			
		}else if(map.get("pw").toString().equals(member.get("user_pw").toString())){
			
			memberService.updateProfile(map);
			
			attributes.addFlashAttribute("msg", "수정되었습니다");
		} else {
			attributes.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다");
		} 
		
		return "redirect:/mypage/modify";
	}
	
	@GetMapping(value="/mypage/withdrawal")
	public String withdrwal(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		memberService.withdrawal(id);
		
		System.out.println("회원탈퇴");
		
		session.removeAttribute("user_id");
		return "logout";
	}
}
