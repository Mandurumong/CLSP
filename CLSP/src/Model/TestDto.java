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
	
	public TestDto() {}
	
	public TestDto(String age) {
		this.age = age;
	}

	public TestDto(String breakfast, String dinnerTime, String nightMeal, String mealRegular, String mealSpeed, String mealSnack, String alcohol, String mealdeli) {
		this.breakfast = breakfast;
		this.dinnerTime = dinnerTime;
		this.nightMeal = nightMeal;
		this.mealRegular = mealRegular;
		this.mealSpeed = mealSpeed;
		this.mealSnack = mealSnack;
		this.alcohol = alcohol;
		this.mealdeli = mealdeli;
	}
	
	public TestDto(String after1, String sleepTime, String light, String brush, String smoke) {
		this.after1 = after1;
		this.sleepTime = sleepTime;
		this.light = light;
		this.brush = brush;
		this.smoke = smoke;
	}
	
	public TestDto(String exR, String ex30, String strech) {
		this.exerciseRegular = exR;
		this.exercise30 = ex30;
		this.strech = strech;
	}
	
	public TestDto(String inheritance, String stress, String insulin, String fat) {
		this.inheritance = inheritance;
		this.stress = stress;
		this.insulin = insulin;
		this.fat = fat;
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

	public String getinheritance() {
		return inheritance;
	}

	public void setinheritance(String inheritance) {
		this.inheritance = inheritance;
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
	
}
