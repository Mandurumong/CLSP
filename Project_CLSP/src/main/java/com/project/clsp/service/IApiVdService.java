package com.project.clsp.service;

import java.util.List;
import java.util.Map;

public interface IApiVdService {
	
	int getVdsCount();
	List<Map<String,Object>> getVds(Map<String, Object>map);
	void insertVd(Map<String,Object> vo);
	Map<String,Object> getVdDetail(int num);
	String callApi(String serviceKey);

}
