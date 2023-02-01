package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

public interface IApiVdRepository {
	
	int getVdsCount();
	List<Map<String,Object>> getVds(Map<String, Object>map);
	void insertVd(Map<String,Object> dto);
	Map<String,Object> getVdDetail(int num);

}
