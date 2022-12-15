package Model;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	
	public MemberDao() {}

	public static MemberDao getInstance() {
		return instance;
	}
	//DB연결
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
					System.out.println("getConnection 예외발생");
					e.printStackTrace();
				}
				return conn;
			}
		//회원가입
		public void insertMember(MemberDto member) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("insert into Member values(?, ?, ?, to_char(sysdate))");
				
				pstmt.setString(1, member.getUser_id());
				pstmt.setString(2, member.getUser_pw());
				pstmt.setString(3, member.getUser_email());
				
				pstmt.executeUpdate();
			}
			catch(SQLException e) {
				System.out.println("insert()예외 발생");
				e.printStackTrace();
			}
			finally {
				try {
					pstmt.close();
					conn.close();
				}
				catch(Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		//아이디 찾기
		public String findId(MemberDto member) {
			String user_id = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("SELECT user_id FROM Member WHERE user_email=? AND user_pw=?");
				pstmt.setString(1, member.getUser_email());
				pstmt.setString(2, member.getUser_pw());
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					user_id = rs.getString("user_id");
					}
				}
			catch(Exception e) {
				System.out.println("findId()예외 발생");
					e.printStackTrace();
				}
			finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}
				catch(Exception e2) {
					e2.printStackTrace();
				}
			}
			return user_id;
		}
		
		//비밀번호 찾기
		public String findPw(MemberDto member) {
			String user_pw = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("SELECT user_pw FROM Member WHERE user_email=? AND user_id=?");
				pstmt.setString(1, member.getUser_email());
				pstmt.setString(2, member.getUser_id());
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					user_pw = rs.getString("user_pw");
				}
				
			}catch(Exception e) {
					System.out.println("findPw() 예외 발생");
					e.printStackTrace();
				}
			finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}
				catch(Exception e2) {
					e2.printStackTrace();
				}
			}
			return user_pw;
		}
		
		//로그인
		public String login(String user_id, String user_pw) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			System.out.println(user_id);
			System.out.println(user_pw);
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("SELECT user_pw, user_id FROM Member WHERE user_id = ? AND user_pw = ?");
				pstmt.setString(1, user_id);
				pstmt.setString(2, user_pw);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					rs.getString("user_pw").equals(user_pw);
					rs.getString("user_id").equals(user_id);
					return "login";
			}
				else {
					return "false";
				}
				}
				
			catch(Exception e) {
				System.out.println("login()예외 발생");
					e.printStackTrace();
				}
			finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}
				catch(Exception e2) {
					e2.printStackTrace();
				}
			
			}
			return "fail";
		}
}
