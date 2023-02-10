package com.project.clsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardController {
	
	@RequestMapping("/adminBoard")
	public String adminBoardList() {
		return "admin_board";
	}

}
