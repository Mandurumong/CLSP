package com.project.clsp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.clsp.model.AnalyticsDto;

@Repository
public class AnalycisRepository implements IAnalyticsRepository{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public AnalyticsDto analytics() {		
		AnalyticsDto analytics = new AnalyticsDto();	
		
		try {
			String sqlPatient2021 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021";
			analytics.setPatient2021(jdbcTemplate.queryForObject(sqlPatient2021, Integer.class));
			
			String sql = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세'";	
			analytics.setPatient2021_10(jdbcTemplate.queryForObject(sql, Integer.class));
			
			String sql1 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세' AND gender = 'male'";	
			analytics.setPatient2021_10_m(jdbcTemplate.queryForObject(sql1, Integer.class));
			
			String sql2 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세' AND gender = 'female'";
			analytics.setPatient2021_10_f(jdbcTemplate.queryForObject(sql2, Integer.class));
			
			String sql3 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세'";
			analytics.setPatient2021_20(jdbcTemplate.queryForObject(sql3, Integer.class));
			
			String sql4 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세' AND gender = 'male'";
			analytics.setPatient2021_20_m(jdbcTemplate.queryForObject(sql4, Integer.class));
			
			String sql5 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세' AND gender = 'female'";
			analytics.setPatient2021_20_f(jdbcTemplate.queryForObject(sql5, Integer.class));
			
			String sql6 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세'";
			analytics.setPatient2021_30(jdbcTemplate.queryForObject(sql6, Integer.class));
			
			String sql7 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세' AND gender = 'male'";
			analytics.setPatient2021_30_m(jdbcTemplate.queryForObject(sql7, Integer.class));
			
			String sql8 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세' AND gender = 'female'";
			analytics.setPatient2021_30_f(jdbcTemplate.queryForObject(sql8, Integer.class));
			
			String sql9 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세'";
			analytics.setPatient2021_40(jdbcTemplate.queryForObject(sql9, Integer.class));
			
			String sql10 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세' AND gender = 'male'";
			analytics.setPatient2021_40_m(jdbcTemplate.queryForObject(sql10, Integer.class));
			
			String sql11 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세' AND gender = 'female'";
			analytics.setPatient2021_40_f(jdbcTemplate.queryForObject(sql11, Integer.class));
			
			String sql12 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세'";
			analytics.setPatient2021_50(jdbcTemplate.queryForObject(sql12, Integer.class));
			
			String sql13 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세' AND gender = 'male'";
			analytics.setPatient2021_50_m(jdbcTemplate.queryForObject(sql13, Integer.class));
			
			String sql14 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세' AND gender = 'female'";
			analytics.setPatient2021_50_f(jdbcTemplate.queryForObject(sql14, Integer.class));
			
			String sql15 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세'";			
			analytics.setPatient2021_60(jdbcTemplate.queryForObject(sql15, Integer.class));
			
			String sql16 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세' AND gender = 'male'";
			analytics.setPatient2021_60_m(jdbcTemplate.queryForObject(sql16, Integer.class));
			
			String sql17 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세' AND gender = 'female'";
			analytics.setPatient2021_60_f(jdbcTemplate.queryForObject(sql17, Integer.class));
			
			String sql18 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세'";
			analytics.setPatient2021_70(jdbcTemplate.queryForObject(sql18, Integer.class));
			
			String sql19 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세' AND gender = 'male'";
			analytics.setPatient2021_70_m(jdbcTemplate.queryForObject(sql19, Integer.class));
			
			String sql20 = "SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세' AND gender = 'female'";
			analytics.setPatient2021_70_f(jdbcTemplate.queryForObject(sql20, Integer.class));
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("analytics 실행 예외");
		}
	return analytics;
}
}
