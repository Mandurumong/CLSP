package Model;

public class TestDto {
	String age; // 나이대
	String breakfast; //아침여부
	String dinnerTime; // 저녁 8시 이후 먹는지
	String nightMeal; // 야식 먹는지
	String mealRegular; // 규칙적인 식사
	String mealSpeed; // 식사 속도
	String mealSnack; // 식사 후 간식
	String alcohol; // 술
	String mealdeli; // 기름진 음식, 배달음식 
	
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
	
	int allScore;
	
	public TestDto() {}
	
	public TestDto(String age) {
		this.age = age;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}

	public String getDinnerTime() {
		return dinnerTime;
	}

	public void setDinnerTime(String dinnerTime) {
		this.dinnerTime = dinnerTime;
	}

	public String getNightMeal() {
		return nightMeal;
	}

	public void setNightMeal(String nightMeal) {
		this.nightMeal = nightMeal;
	}

	public String getMealRegular() {
		return mealRegular;
	}

	public void setMealRegular(String mealRegular) {
		this.mealRegular = mealRegular;
	}

	public String getMealSpeed() {
		return mealSpeed;
	}

	public void setMealSpeed(String mealSpeed) {
		this.mealSpeed = mealSpeed;
	}

	public String getMealSnack() {
		return mealSnack;
	}

	public void setMealSnack(String mealSnack) {
		this.mealSnack = mealSnack;
	}

	public String getAlcohol() {
		return alcohol;
	}

	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}

	public String getMealdeli() {
		return mealdeli;
	}

	public void setMealdeli(String mealdeli) {
		this.mealdeli = mealdeli;
	}

	public String getAfter1() {
		return after1;
	}

	public void setAfter1(String after1) {
		this.after1 = after1;
	}

	public String getSleepTime() {
		return sleepTime;
	}

	public void setSleepTime(String sleepTime) {
		this.sleepTime = sleepTime;
	}

	public String getLight() {
		return light;
	}

	public void setLight(String light) {
		this.light = light;
	}

	public String getBrush() {
		return brush;
	}

	public void setBrush(String brush) {
		this.brush = brush;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getExerciseRegular() {
		return exerciseRegular;
	}

	public void setExerciseRegular(String exerciseRegular) {
		this.exerciseRegular = exerciseRegular;
	}

	public String getExercise30() {
		return exercise30;
	}

	public void setExercise30(String exercise30) {
		this.exercise30 = exercise30;
	}

	public String getStrech() {
		return strech;
	}

	public void setStrech(String strech) {
		this.strech = strech;
	}

	public String getStress() {
		return stress;
	}

	public void setStress(String stress) {
		this.stress = stress;
	}

	public String getInsulin() {
		return insulin;
	}

	public void setInsulin(String insulin) {
		this.insulin = insulin;
	}

	public String getFat() {
		return fat;
	}

	public void setFat(String fat) {
		this.fat = fat;
	}
	
	public String getInheritance() {
		return inheritance;
	}

	public void setInheritance(String inheritance) {
		this.inheritance = inheritance;
	}

	
	//받아오는 값
	
	public int getEatBreakfast() {
		return eatBreakfast;
	}

	public void setEatBreakfast(int eatBreakfast) {
		this.eatBreakfast = eatBreakfast;
	}

	public int getEatTime8() {
		return eatTime8;
	}

	public void setEatTime8(int eatTime8) {
		this.eatTime8 = eatTime8;
	}

	public int getEatOily() {
		return eatOily;
	}

	public void setEatOily(int eatOily) {
		this.eatOily = eatOily;
	}

	public int getEatRegular() {
		return eatRegular;
	}

	public void setEatRegular(int eatRegular) {
		this.eatRegular = eatRegular;
	}

	public int getEatSpeed() {
		return eatSpeed;
	}

	public void setEatSpeed(int eatSpeed) {
		this.eatSpeed = eatSpeed;
	}

	public int getEatSnack() {
		return eatSnack;
	}

	public void setEatSnack(int eatSnack) {
		this.eatSnack = eatSnack;
	}

	public int getEatAlcohol() {
		return eatAlcohol;
	}

	public void setEatAlcohol(int eatAlcohol) {
		this.eatAlcohol = eatAlcohol;
	}

	public int getEatDeliver() {
		return eatDeliver;
	}

	public void setEatDeliver(int eatDeliver) {
		this.eatDeliver = eatDeliver;
	}
	
	public int getLifeAfter1() {
		return lifeAfter1;
	}

	public void setLifeAfter1(int lifeAfter1) {
		this.lifeAfter1 = lifeAfter1;
	}

	public int getLifeSleepTime() {
		return lifeSleepTime;
	}

	public void setLifeSleepTime(int lifeSleepTime) {
		this.lifeSleepTime = lifeSleepTime;
	}

	public int getLifeLightOn() {
		return lifeLightOn;
	}

	public void setLifeLightOn(int lifeLightOn) {
		this.lifeLightOn = lifeLightOn;
	}

	public int getLifeBrush() {
		return lifeBrush;
	}

	public void setLifeBrush(int lifeBrush) {
		this.lifeBrush = lifeBrush;
	}

	public int getLifeSmoke() {
		return lifeSmoke;
	}

	public void setLifeSmoke(int lifeSmoke) {
		this.lifeSmoke = lifeSmoke;
	}

	public int getExerciseHRegular() {
		return exerciseHRegular;
	}

	public void setExerciseHRegular(int exerciseHRegular) {
		this.exerciseHRegular = exerciseHRegular;
	}

	public int getExerciseH30() {
		return exerciseH30;
	}

	public void setExerciseH30(int exerciseH30) {
		this.exerciseH30 = exerciseH30;
	}

	public int getExerciseStrech() {
		return exerciseStrech;
	}

	public void setExerciseStrech(int exerciseStrech) {
		this.exerciseStrech = exerciseStrech;
	}

	public int getEtcInheritance() {
		return etcInheritance;
	}

	public void setEtcInheritance(int etcInheritance) {
		this.etcInheritance = etcInheritance;
	}

	public int getEtcStress() {
		return etcStress;
	}

	public void setEtcStress(int etcStress) {
		this.etcStress = etcStress;
	}

	public int getEtcInsulin() {
		return etcInsulin;
	}

	public void setEtcInsulin(int etcInsulin) {
		this.etcInsulin = etcInsulin;
	}

	public int getEtcFat() {
		return etcFat;
	}

	public void setEtcFat(int etcFat) {
		this.etcFat = etcFat;
	}

	public void setExercise(int exercise) {
		this.exercise = exercise;
	}

	public void setEatingHabits(int eatingHabits) {
		this.eatingHabits = eatingHabits;
	}

	public void setLifeHabits(int lifeHabits) {
		this.lifeHabits = lifeHabits;
	}

	public void setEtc(int etc) {
		this.etc = etc;
	}

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
