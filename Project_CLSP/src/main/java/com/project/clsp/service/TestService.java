package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.ITestRepository;
import com.project.clsp.model.TestDto;

@Service
public class TestService implements ITestService{

	@Autowired
	ITestRepository testRepository;
	
	@Override
	public void test(TestDto testDto) {
		
		testRepository.eatingTest(testDto);
		testRepository.lifeTest(testDto);
		testRepository.exerciseTest(testDto);
		testRepository.etcTest(testDto);
		
	}

}
