package com.project.clsp.dao;

import com.project.clsp.model.TestDto;

public interface ITestRepository {

	public TestDto eatingTest(TestDto test);
	
	public TestDto lifeTest(TestDto test);
	
	public TestDto exerciseTest(TestDto test);
	
	public TestDto etcTest(TestDto test);
	
}
