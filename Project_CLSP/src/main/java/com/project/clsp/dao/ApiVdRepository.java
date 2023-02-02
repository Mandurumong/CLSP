package com.project.clsp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ApiVdRepository implements IApiVdRepository{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int getVdsCount() {
		return sqlSession.selectOne("api.getVdsCount");
	}

	@Override
	public List<Map<String, Object>> getVds(Map<String, Object> map) {
		return sqlSession.selectList("api.getVds", map);
	}

	@Override
	public void insertVd(Map<String, Object> dto) {
		sqlSession.insert("api.insertVd", dto);
	}

	@Override
	public Map<String, Object> getVdDetail(int num) {
		return sqlSession.selectOne("api.getVdDetail", num);
	}

}
