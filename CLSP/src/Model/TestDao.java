package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	public void selfTest() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
		}
	}
}
