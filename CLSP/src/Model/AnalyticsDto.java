package Model;

public class AnalyticsDto {
	
	//2021년 나이 대 별 환자 수
	private int patient2021_10;
	private int patient2021_20;
	private int patient2021_30;
	private int patient2021_40;
	private int patient2021_50;
	private int patient2021_60;
	private int patient2021_70;
	
	//2021년 나이 대 별 남성 환자 수 
	private int patient2021_10_m;
	private int patient2021_20_m;
	private int patient2021_30_m;
	private int patient2021_40_m;
	private int patient2021_50_m;
	private int patient2021_60_m;
	private int patient2021_70_m;
	
	//2021년 나이 대 별 여성 환자 수 
	private int patient2021_10_f;
	private int patient2021_20_f;
	private int patient2021_30_f;
	private int patient2021_40_f;
	private int patient2021_50_f;
	private int patient2021_60_f;
	private int patient2021_70_f;
	
	//2021년 전체 환자 수 
	private int patient2021;
	
	public AnalyticsDto() {}

	public AnalyticsDto(int p10, int p20, int p30, int p40, int p50, int p60, int p70, int p10m, int p20m, int p30m, int p40m, int p50m, int p60m, int p70m, int p10f, int p20f, int p30f, int p40f, int p50f, int p60f, int p70f, int p) {
		
		this.patient2021 = p;
		this.patient2021_10 = p10;
		this.patient2021_10_f = p10f;
		this.patient2021_10_m = p10m;
		this.patient2021_20 = p20;
		this.patient2021_20_f = p20f;
		this.patient2021_20_m = p20m;
		this.patient2021_30 = p30;
		this.patient2021_30_f = p30f;
		this.patient2021_30_m = p30m;
		this.patient2021_40 = p40;
		this.patient2021_40_f = p40f;
		this.patient2021_40_m = p40m;
		this.patient2021_50 = p50;
		this.patient2021_50_f = p50f;
		this.patient2021_50_m = p50m;
		this.patient2021_60 = p60;
		this.patient2021_60_f = p60f;
		this.patient2021_60_m = p60m;
		this.patient2021_70 = p70;
		this.patient2021_70_f = p70f;
		this.patient2021_70_m = p70m;
		
	}

	public int getPatient2021_10() {
		return patient2021_10;
	}

	public void setPatient2021_10(int patient2021_10) {
		this.patient2021_10 = patient2021_10;
	}

	public int getPatient2021_20() {
		return patient2021_20;
	}

	public void setPatient2021_20(int patient2021_20) {
		this.patient2021_20 = patient2021_20;
	}

	public int getPatient2021_30() {
		return patient2021_30;
	}

	public void setPatient2021_30(int patient2021_30) {
		this.patient2021_30 = patient2021_30;
	}

	public int getPatient2021_40() {
		return patient2021_40;
	}

	public void setPatient2021_40(int patient2021_40) {
		this.patient2021_40 = patient2021_40;
	}

	public int getPatient2021_50() {
		return patient2021_50;
	}

	public void setPatient2021_50(int patient2021_50) {
		this.patient2021_50 = patient2021_50;
	}

	public int getPatient2021_60() {
		return patient2021_60;
	}

	public void setPatient2021_60(int patient2021_60) {
		this.patient2021_60 = patient2021_60;
	}

	public int getPatient2021_70() {
		return patient2021_70;
	}

	public void setPatient2021_70(int patient2021_70) {
		this.patient2021_70 = patient2021_70;
	}

	public int getPatient2021_10_m() {
		return patient2021_10_m;
	}

	public void setPatient2021_10_m(int patient2021_10_m) {
		this.patient2021_10_m = patient2021_10_m;
	}

	public int getPatient2021_20_m() {
		return patient2021_20_m;
	}

	public void setPatient2021_20_m(int patient2021_20_m) {
		this.patient2021_20_m = patient2021_20_m;
	}

	public int getPatient2021_30_m() {
		return patient2021_30_m;
	}

	public void setPatient2021_30_m(int patient2021_30_m) {
		this.patient2021_30_m = patient2021_30_m;
	}

	public int getPatient2021_40_m() {
		return patient2021_40_m;
	}

	public void setPatient2021_40_m(int patient2021_40_m) {
		this.patient2021_40_m = patient2021_40_m;
	}

	public int getPatient2021_50_m() {
		return patient2021_50_m;
	}

	public void setPatient2021_50_m(int patient2021_50_m) {
		this.patient2021_50_m = patient2021_50_m;
	}

	public int getPatient2021_60_m() {
		return patient2021_60_m;
	}

	public void setPatient2021_60_m(int patient2021_60_m) {
		this.patient2021_60_m = patient2021_60_m;
	}

	public int getPatient2021_70_m() {
		return patient2021_70_m;
	}

	public void setPatient2021_70_m(int patient2021_70_m) {
		this.patient2021_70_m = patient2021_70_m;
	}

	public int getPatient2021_10_f() {
		return patient2021_10_f;
	}

	public void setPatient2021_10_f(int patient2021_10_f) {
		this.patient2021_10_f = patient2021_10_f;
	}

	public int getPatient2021_20_f() {
		return patient2021_20_f;
	}

	public void setPatient2021_20_f(int patient2021_20_f) {
		this.patient2021_20_f = patient2021_20_f;
	}

	public int getPatient2021_30_f() {
		return patient2021_30_f;
	}

	public void setPatient2021_30_f(int patient2021_30_f) {
		this.patient2021_30_f = patient2021_30_f;
	}

	public int getPatient2021_40_f() {
		return patient2021_40_f;
	}

	public void setPatient2021_40_f(int patient2021_40_f) {
		this.patient2021_40_f = patient2021_40_f;
	}

	public int getPatient2021_50_f() {
		return patient2021_50_f;
	}

	public void setPatient2021_50_f(int patient2021_50_f) {
		this.patient2021_50_f = patient2021_50_f;
	}

	public int getPatient2021_60_f() {
		return patient2021_60_f;
	}

	public void setPatient2021_60_f(int patient2021_60_f) {
		this.patient2021_60_f = patient2021_60_f;
	}

	public int getPatient2021_70_f() {
		return patient2021_70_f;
	}

	public void setPatient2021_70_f(int patient2021_70_f) {
		this.patient2021_70_f = patient2021_70_f;
	}

	public int getPatient2021() {
		return patient2021;
	}

	public void setPatient2021(int patient2021) {
		this.patient2021 = patient2021;
	}
}