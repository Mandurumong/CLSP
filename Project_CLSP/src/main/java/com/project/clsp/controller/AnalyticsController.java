package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.clsp.model.AnalyticsDto;
import com.project.clsp.service.IAnalyticsService;

@Controller
public class AnalyticsController {

	@Autowired
	IAnalyticsService analyticsService;
	
	@GetMapping("/analytics.do")
	public String analytics(Model model) {
		
		AnalyticsDto analytics = analyticsService.analytics();
		
		model.addAttribute("analytics", analytics);
		
		return "analytics";
	}
}
