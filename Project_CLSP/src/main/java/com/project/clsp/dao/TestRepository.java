package com.project.clsp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.clsp.model.TestDto;

@Repository
public class TestRepository implements ITestRepository{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public TestDto eatingTest(TestDto test) {
		try {
			String sql = "SELECT score FROM habits WHERE test_value=?";
			
			test.setEatBreakfast(jdbcTemplate.queryForObject(sql, Integer.class, test.getBreakfast()));
			test.setEatTime8(jdbcTemplate.queryForObject(sql, Integer.class, test.getDinnerTime()));
			test.setEatOily(jdbcTemplate.queryForObject(sql, Integer.class, test.getMealOily()));
			test.setEatRegular(jdbcTemplate.queryForObject(sql, Integer.class, test.getMealRegular()));
			test.setEatSpeed(jdbcTemplate.queryForObject(sql, Integer.class, test.getMealSpeed()));
			test.setEatSnack(jdbcTemplate.queryForObject(sql, Integer.class, test.getMealSnack()));
			test.setEatAlcohol(jdbcTemplate.queryForObject(sql, Integer.class, test.getAlcohol()));
			test.setEatDeliver(jdbcTemplate.queryForObject(sql, Integer.class, test.getMealdeli()));
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("eatingTest 실행예외");
		}
		return test;
	}
	@Override
	public TestDto lifeTest(TestDto test) {
		try {
		String sql = "SELECT score FROM habits WHERE test_value=?";
		
		test.setLifeAfter1(jdbcTemplate.queryForObject(sql, Integer.class, test.getAfter1()));
		test.setLifeSleepTime(jdbcTemplate.queryForObject(sql, Integer.class, test.getSleepTime()));
		test.setLifeLightOn(jdbcTemplate.queryForObject(sql, Integer.class, test.getLight()));
		test.setLifeBrush(jdbcTemplate.queryForObject(sql, Integer.class, test.getBrush()));
		test.setLifeSmoke(jdbcTemplate.queryForObject(sql, Integer.class, test.getSmoke()));
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("lifeTest 실행 예외");
		}
		return test;
	}
	@Override
	public TestDto exerciseTest(TestDto test) {
		try {
			String sql = "SELECT score FROM habits WHERE test_value=?";
			
			test.setExerciseHRegular(jdbcTemplate.queryForObject(sql, Integer.class, test.getExerciseRegular()));
			test.setExerciseH30(jdbcTemplate.queryForObject(sql, Integer.class, test.getExercise30()));
			test.setExerciseStrech(jdbcTemplate.queryForObject(sql, Integer.class, test.getStrech()));
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("exerciseTest 실행 예외");
		}
		return test;
	}
	@Override
	public TestDto etcTest(TestDto test) {
		try {
			String sql = "SELECT score FROM habits WHERE test_value=?";
			
			test.setEtcInheritance(jdbcTemplate.queryForObject(sql, Integer.class, test.getInheritance()));
			test.setEtcStress(jdbcTemplate.queryForObject(sql, Integer.class, test.getStress()));
			test.setEtcInsulin(jdbcTemplate.queryForObject(sql, Integer.class, test.getInsulin()));
			test.setEtcFat(jdbcTemplate.queryForObject(sql, Integer.class, test.getFat()));
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("etcTest 실행예외");
		}
		return test;
	}
}
