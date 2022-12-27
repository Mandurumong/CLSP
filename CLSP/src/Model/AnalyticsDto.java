package Model;

public class AnalyticsDto {
	
	private int judge_year;
	private String gender;
	private String age;
	private int patient;
	
	public AnalyticsDto() {}

	public AnalyticsDto(int year, String gender, String age, int patient) {
		this.judge_year = year;
		this.gender = gender;
		this.age = age;
		this.patient = patient;
	}

	public int getJudge_year() {
		return judge_year;
	}

	public void setJudge_year(int judge_year) {
		this.judge_year = judge_year;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getPatient() {
		return patient;
	}

	public void setPatient(int patient) {
		this.patient = patient;
	}
	
}
