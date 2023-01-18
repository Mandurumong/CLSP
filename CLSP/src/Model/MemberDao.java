package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

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
			pstmt = conn.prepareStatement("insert into Member values(?, ?, ?, ?, to_char(sysdate))");
				
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getUser_email());
			pstmt.setInt(4, member.getLevel());
				
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
	//아이디 중복 체크
	public int selectAllId(String id) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT user_id FROM Member Where user_id=?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
				System.out.println("result 값 :"+result);
			}else {
				result = 0;
				System.out.println("result 값 : "+result);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectAllId 오류 발생");
		}
		return result;
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
		//데이터 전송 확인용
		System.out.println(member.getUser_email());
		System.out.println(member.getUser_id());
		System.out.println(user_pw);
		
		return user_pw;
	}
	
	//비밀번호 변경
	public void passwordModify(String user_pw, String ch_pw) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE MEMBER SET user_pw=?");
			pstmt.setString(1, ch_pw);
			
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("password_modify 오류 발생");
			e.printStackTrace();
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}

	}
		
	//로그인
	public MemberDto login(String user_id, String user_pw) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberDto login = null;
			
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM Member WHERE user_id = ?");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("user_pw").equals(user_pw)) {
					String user_email = rs.getString("user_email");
					int user_level = rs.getInt("user_level");
					
					login = new MemberDto(user_id, user_pw, user_email, user_level);
				}
				else {
					return null;
				}
			}else {
				return null;
			}
		}catch(Exception e) {
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
		return login;
	}
	//정보 수정
	public void updateData(String user_id, MemberDto memberDto) {
		System.out.println("updateData() 실행");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE member SET user_pw=?, user_email=? WHERE user_id=?");
			pstmt.setString(1, memberDto.getUser_pw());
			System.out.println(memberDto.getUser_pw());
			pstmt.setString(2, memberDto.getUser_email());
			System.out.println(memberDto.getUser_email());
			pstmt.setString(3, user_id);
			System.out.println(user_id);
			;
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("update 예외 발생");
			e.printStackTrace();
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	//전체 회원 정보 가져오기
	public ArrayList<MemberDto> getList(){
		
		ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM member ORDER BY REG_DATE DESC");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String user_id = rs.getString("user_id");
				String user_pw = rs.getString("user_pw");
				String user_email = rs.getString("user_email");
				Date reg_date = rs.getDate("reg_date");
				int user_level = rs.getInt("user_level");
				
				memberList.add(new MemberDto(user_id, user_pw, user_email, reg_date, user_level));
			}
		}
		catch(SQLException e) {
			System.out.println("getList() 예외 발생");
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return memberList;
	}
	//한 회원 정보
	public MemberDto getOneList(String user_id){
		System.out.println("getOneList() 실행");
		
		MemberDto memberDto = new MemberDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM member WHERE user_id=?");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String user_pw = rs.getString("user_pw");
				String user_email = rs.getString("user_email");
				
				memberDto.setUser_pw(user_pw);
				memberDto.setUser_email(user_email);

			}
		}
		catch(SQLException e) {
			System.out.println("getOneList() 예외 발생");
			e.printStackTrace();
		}
		return memberDto;
	}
}
