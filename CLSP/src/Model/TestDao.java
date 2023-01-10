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
	
	public void eatingTest(TestDto test) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT category, sum(score) FROM habits WHERE test_value=? Group By category");
			
			
			System.out.println("eatingTest 실행");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("eatingTest 실행 예외");
		}
	}
	
//	public void lifeTest(TestDto test) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=? AND category='lifeHabits'");
//			
//			System.out.println("lifeTest 실행");
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("lifeTest 실행 예외");
//		}
//		
//	}
//	
//	public void exerciseTest(TestDto test) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=? AND category='exercise'");
//			
//			System.out.println("exercise 실행");
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("exercise 실행 예외");
//		}
//	}
//	
//	public void etcTest(TestDto test) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement("SELECT score FROM habits WHERE test_value=? AND category='etc'");
//			
//			System.out.println("etc 실행");
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("etc 실행 예외");
//		}
//		
//	}
}
