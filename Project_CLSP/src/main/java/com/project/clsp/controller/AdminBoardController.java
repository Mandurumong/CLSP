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

import com.project.clsp.model.PagingDto;
import com.project.clsp.service.IBoardService;

@Controller
public class AdminBoardController {
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping("/adminBoard")
	public String adminBoardList(
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required = false, defaultValue = "all")String category,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword,
			HttpServletRequest req, Model model) {
		
		// 검색을 위한 파라미터 맵
				Map<String, Object> map = new HashMap<>();
				map.put("category", category);
				map.put("type", type);
				map.put("keyword", keyword);
				
				int cnt = boardService.getBoardCount(map);
				
				PagingDto paging  = new PagingDto(cnt, page, 10);
				
				// 페이징도 되어야하므로 페이징 데이터도 담기
				map.put("start", paging.getStart());
				map.put("end", paging.getEnd());
				
				Enumeration<String> attributes = req.getSession().getAttributeNames();
				while (attributes.hasMoreElements()) {
				    String attribute = (String) attributes.nextElement();
				    System.err.println(attribute+" : "+req.getSession().getAttribute(attribute));
				}
				
				List<Map<String, Object>> list = boardService.getBoards(map);
				
				model.addAttribute("paging", paging);
				model.addAttribute("boardList", list);
		
		return "admin_board";
	}

}
