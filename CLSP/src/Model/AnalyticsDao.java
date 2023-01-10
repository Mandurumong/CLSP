package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

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
	
	public AnalyticsDto analytics() {
		
		AnalyticsDto analytics = new AnalyticsDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("analytics() 실행");
			conn = getConnection();
			
			//10대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세'");
			rs = pstmt.executeQuery();			
			rs.next();
			int patient2021_10 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_10m = rs.getInt(1);			
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '0-19세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_10f = rs.getInt(1);
			
			//20대			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_20 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_20m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '20-29세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_20f = rs.getInt(1);
			
			//30대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_30 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_30m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '30-39세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_30f = rs.getInt(1);
			
			//40대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_40 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_40m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '40-49세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_40f = rs.getInt(1);
			
			//50대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_50 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_50m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '50-59세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_50f = rs.getInt(1);
			
			//60대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_60 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_60m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '60-69세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_60f = rs.getInt(1);
			
			//70대
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_70 = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세' AND gender = 'male'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_70m = rs.getInt(1);
			
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021 AND age = '70-세' AND gender = 'female'");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021_70f = rs.getInt(1);
			
			//전체
			pstmt = conn.prepareStatement("SELECT SUM(patient) FROM ld_condition WHERE judge_year = 2021");
			rs = pstmt.executeQuery();
			rs.next();
			int patient2021 = rs.getInt(1);
			
			analytics = new AnalyticsDto(patient2021_10, patient2021_20, patient2021_30, patient2021_40, patient2021_50, patient2021_60, patient2021_70, patient2021_10m, patient2021_20m, patient2021_30m, patient2021_40m, patient2021_50m, patient2021_60m, patient2021_70m, patient2021_10f, patient2021_20f, patient2021_30f, patient2021_40f, patient2021_50f, patient2021_60f, patient2021_70f, patient2021);
			
		}catch(Exception e) {
			System.out.println("analytics() 에러 발생");
			e.printStackTrace();
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
				System.out.println("close 실패");
			}
		}
		return analytics;
	}
}
