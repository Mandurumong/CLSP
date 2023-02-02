package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IApiVdRepository;

@Service
public class ApiVdService implements IApiVdService{
	
	@Autowired(required = true)
	IApiVdRepository apiVdRepository;

	@Override
	public int getVdsCount() {
		return apiVdRepository.getVdsCount();
	}

	@Override
	public List<Map<String, Object>> getVds(Map<String, Object> map) {
		return apiVdRepository.getVds(map);
	}

	@Override
	public void insertVd(Map<String, Object> vo) {
		apiVdRepository.insertVd(vo);
	}

	@Override
	public Map<String, Object> getVdDetail(int num) {
		return apiVdRepository.getVdDetail(num);
	}


}
