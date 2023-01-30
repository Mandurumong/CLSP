package com.project.clsp.model;

import lombok.Data;

@Data
public class TestDto {
	String age; // ���̴�
	
	String breakfast; //��ħ����
	String dinnerTime; // ���� 8�� ���� �Դ���
	String mealOily;//¥�� �⸧�� �Ļ�
	String mealRegular; // ��Ģ���� �Ļ�
	String mealSpeed; // �Ļ� �ӵ�
	String mealSnack; // �Ļ� �� ����
	String alcohol; // ��
	String mealdeli; //������� 
	
	String after1; //1�� ���� ��ħ
	String sleepTime; // �� �ڴ� �ð� 6�ð� ����
	String light; // ���Ѱ� �ڴ°�
	String brush; // ��ġ���� �Ϸ翡 3ȸ �̻� �ϴ°�
	String smoke; //��� �Ǵ°�
	
	String exerciseRegular; //��Ģ������ ��ϴ°�
	String exercise30; //�Ϸ翡 30�� �̻� ��ϴ°�
	String strech; //��Ʈ��Ī�� �ϴ°�
	
	String inheritance; //����
	String stress; //��Ʈ���� �޴°�
	String insulin; //�ν��� ���׼��� �ִ°�
	String fat; //��?
	
	int eatBreakfast; //����ڰ� ������ ��ħ ����
	int eatTime8; // �߽� ����
	int eatOily; //�⸧�� ���� ����
	int eatRegular; //��Ģ���� �Ļ� ����
	int eatSpeed; //���� �Ļ� ����
	int eatSnack; // ���� ����
	int eatAlcohol; // �� ����
	int eatDeliver; //������� ����
	
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
	
	int eatingHabits; //�Ľ��� ���� �ջ�
	int lifeHabits; //��Ȱ���� ���� �ջ�
	int exercise; //����� ���� �ջ�
	int etc; //��Ÿ ���� �ջ�
	
	int allScore; //��ü �ջ� ����

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