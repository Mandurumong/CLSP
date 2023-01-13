package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDao {

	private static TestDao instance = new TestDao();
	
	public TestDao() {}
		
		public static TestDao getInstance() {
			return instance;
		}
		
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection conn = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:/comp/env/jdbc/Oracle11g");
			conn = dataSource.getConnection();
			System.out.println("getConnection 성공");
		}
		catch(Exception e) {
			System.out.println("getConnection 예외 발생");
			e.printStackTrace();
		}
		return conn;
	}
	
	@SuppressWarnings("resource")
	public void eatingTest(TestDto test) {
		System.out.println("eatingTest 실행");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=?");
			
			pstmt.setString(1, test.getBreakfast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatBreakfast = rs.getInt(1);
				test.setEatBreakfast(eatBreakfast);
			}
			
			pstmt.setString(1, test.getDinnerTime());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatTime8 = rs.getInt(1);
				test.setEatTime8(eatTime8);
			}
			
			pstmt.setString(1, test.getMealOily());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatOily = rs.getInt(1);
				test.setEatOily(eatOily);
			}
			
			pstmt.setString(1, test.getMealRegular());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatRegular = rs.getInt(1);
				test.setEatRegular(eatRegular);
			}
			
			pstmt.setString(1, test.getMealSpeed());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatSpeed = rs.getInt(1);
				test.setEatSpeed(eatSpeed);
			}
			
			pstmt.setString(1, test.getMealSnack());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatSnack = rs.getInt(1);
				test.setEatSnack(eatSnack);
			}
			
			pstmt.setString(1, test.getAlcohol());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatAlcohol = rs.getInt(1);
				test.setEatAlcohol(eatAlcohol);
			}
			
			pstmt.setString(1, test.getMealdeli());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int eatDeliver = rs.getInt(1);
				test.setEatDeliver(eatDeliver);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("eatingTest 실행 예외");
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				System.out.println("eating Test close fail");
			}
		}
	}
	
	public void lifeTest(TestDto test) {
		System.out.println("lifeTest 실행");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=?");
			
			pstmt.setString(1, test.getAfter1());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int after1 = rs.getInt(1);
				test.setLifeAfter1(after1);
			}
			
			pstmt.setString(1, test.getSleepTime());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int sleeptime = rs.getInt(1);
				test.setLifeSleepTime(sleeptime);
			}
			
			pstmt.setString(1, test.getLight());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int lightOn = rs.getInt(1);
				test.setLifeLightOn(lightOn);
			}
			
			pstmt.setString(1, test.getBrush());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int brush = rs.getInt(1);
				test.setLifeBrush(brush);
			}
			
			pstmt.setString(1, test.getSmoke());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int smoke = rs.getInt(1);
				test.setLifeSmoke(smoke);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("lifeTest 실행 예외");
			
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				System.out.println("lifeTest close fail");
			}
		}
		
	}
	
	public void exerciseTest(TestDto test) {
		System.out.println("exercise 실행");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=?");
			
			pstmt.setString(1, test.getExerciseRegular());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int exerciseReg = rs.getInt(1);
				test.setExerciseHRegular(exerciseReg);
			}
			
			pstmt.setString(1, test.getExercise30());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int exercise30 = rs.getInt(1);
				test.setExerciseH30(exercise30);
			}
			
			pstmt.setString(1, test.getStrech());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int exerciseStrech = rs.getInt(1);
				test.setExerciseStrech(exerciseStrech);
			}
					
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("exercise 실행 예외");
			
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				System.out.println("exerciseTest close fail");
			}
		}
	}
	
	public void etcTest(TestDto test) {
		System.out.println("etc 실행");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=?");
			
			pstmt.setString(1, test.getInheritance());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int inheritance = rs.getInt(1);
				test.setEtcInheritance(inheritance);
			}
			
			pstmt.setString(1, test.getStress());
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				int stress = rs.getInt(1);
				test.setEtcStress(stress);
			}
			
			pstmt.setString(1, test.getInsulin());
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				int insulin = rs.getInt(1);
				test.setEtcInsulin(insulin);
			}
			
			pstmt.setString(1, test.getFat());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int fat = rs.getInt(1);
				test.setEtcFat(fat);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("etc 실행 예외");
			
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				System.out.println("etcTest close fail");
			}
		}
		
	}
}
