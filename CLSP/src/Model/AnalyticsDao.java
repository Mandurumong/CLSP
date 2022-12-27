package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AnalyticsDao {

	private static AnalyticsDao instance = new AnalyticsDao();
	
	public AnalyticsDao() {}
	
	public static AnalyticsDao getInstance() {
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
	
	public void analytics10() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("analytics10() 실행");
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세'");
			rs = pstmt.executeQuery();
			
//			ResultSetMetaData rsmd = rs.getMetaData();
//			String name = rsmd.getColumnName(1);
//			String type = rsmd.getColumnTypeName(1);		
//			System.out.println(name);
//			System.out.println(type);
			
			rs.next();
			int patient2021_10 = rs.getInt(1);
			System.out.println(patient2021_10);
			
		}catch(Exception e) {
			System.out.println("analytics10() 에러 발생");
			e.printStackTrace();
		}
	}
	
	public void analytics20() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("analytics20() 실행");
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세'");
			rs = pstmt.executeQuery();
			
			rs.next();
			int patient2021_20 = rs.getInt(1);
			System.out.println(patient2021_20);

		}catch(Exception e) {
			System.out.println("analytics20() 에러 발생");
			e.printStackTrace();
		}
		
		
	}
}
