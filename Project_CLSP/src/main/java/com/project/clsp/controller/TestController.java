package com.project.clsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.clsp.dao.ITestRepository;
import com.project.clsp.model.TestDto;

@Controller
public class TestController {
	
	@Autowired
	ITestRepository testRepository;

	@GetMapping("/selfTestM")
	public String selfTestM() {
		return "selfTestM";
	}
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@PostMapping("/test.do")
	public String testResult(TestDto test, Model model) {
		
		testRepository.eatingTest(test);
		testRepository.lifeTest(test);
		testRepository.exerciseTest(test);
		testRepository.etcTest(test);
		
		model.addAttribute("test", test);
		
		return "testResult";
	}
}
