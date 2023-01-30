package com.project.clsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IAnalyticsRepository;
import com.project.clsp.model.AnalyticsDto;

@Service
public class AnalyticsService implements IAnalyticsService{

	@Autowired
	IAnalyticsRepository analyticsRepository;
	
	
	public AnalyticsDto analytics() {
		
		return analyticsRepository.analytics();
	};
}
