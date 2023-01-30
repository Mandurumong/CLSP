package com.project.clsp.model;

import lombok.Data;

@Data
public class TestDto {
	String age; // 나이대
	
	String breakfast; //아침여부
	String dinnerTime; // 저녁 8시 이후 먹는지
	String mealOily;//짜고 기름진 식사
	String mealRegular; // 규칙적인 식사
	String mealSpeed; // 식사 속도
	String mealSnack; // 식사 후 간식
	String alcohol; // 술
	String mealdeli; //배달음식 
	
	String after1; //1시 이후 취침
	String sleepTime; // 잠 자는 시간 6시간 이하
	String light; // 불켜고 자는가
	String brush; // 양치질을 하루에 3회 이상 하는가
	String smoke; //담배 피는가
	
	String exerciseRegular; //규칙적으로 운동하는가
	String exercise30; //하루에 30분 이상 운동하는가
	String strech; //스트레칭을 하는가
	
	String inheritance; //유전
	String stress; //스트레스 받는가
	String insulin; //인슐린 저항성이 있는가
	String fat; //비만?
	
	int eatBreakfast; //사용자가 선택한 아침 점수
	int eatTime8; // 야식 점수
	int eatOily; //기름진 음식 점수
	int eatRegular; //규칙적인 식사 점수
	int eatSpeed; //빠른 식사 점수
	int eatSnack; // 간식 점수
	int eatAlcohol; // 술 점수
	int eatDeliver; //배달음식 점수
	
	int lifeAfter1;
	int lifeSleepTime;
	int lifeLightOn;
	int lifeBrush;
	int lifeSmoke;
	
	int exerciseHRegular;
	int exerciseH30;
	int exerciseStrech;
	
	int etcInheritance;
	int etcStress;
	int etcInsulin;
	int etcFat;
	
	int eatingHabits; //식습관 점수 합산
	int lifeHabits; //생활습관 점수 합산
	int exercise; //운동습관 점수 합산
	int etc; //기타 점수 합산
	
	int allScore; //전체 합산 점수

	public int getEatingHabits() {
		eatingHabits = eatBreakfast + eatTime8 + eatOily + eatRegular + eatSpeed + eatSnack + eatAlcohol + eatDeliver; 
		return eatingHabits;
	}

	public int getLifeHabits() {
		lifeHabits = lifeAfter1 + lifeSleepTime + lifeLightOn + lifeBrush + lifeSmoke;
		return lifeHabits;
	}

	public int getExercise() {
		exercise = exerciseHRegular + exerciseH30 + exerciseStrech;
		return exercise;
	}

	public int getEtc() {
		etc = etcFat + etcInheritance + etcInsulin + etcStress;
		return etc;
	}

	public int getAllScore() {
		allScore = getEatingHabits() + getLifeHabits() + getExercise() + getEtc();
		return allScore;
	}
}