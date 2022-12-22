package Service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngine;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Rtest {
	public static void main(String[] args) {
//		try {
//		RConnection c = new RConnection();
//		REXP x = c.eval("1+2");
//		System.out.println(x.asInteger());
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("r 연동 실패");
//		}
		
		try {
			RConnection c = new RConnection();
			
			c.eval("library(DBI)");
			c.eval("library(RJDBC)");
			c.eval("library(rJava)");
			
			c.assign("driver", "oracle.jdbc.driver.OracleDriver");
			c.assign("jdbc", "C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar");
			
			c.eval("drv <- JDBC(driver, jdbc)");			
			c.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521:xe', 'iseb', 'ebis')");
			
//			c.eval("drv", JDBC('oracle.jdbc.driver.OracleDriver', 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar'));
//			c.assign("conn", "dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521:xe', 'iseb', 'ebis')");
//			c.assign("r", "dbGetQuery(conn, 'SELECT judge_year as 연도, sum(patient) as 환자수 from ld_condition group by judge_year order by judge_year asc')");
			
			c.assign("sql", "SELECT judge_year as 연도, sum(patient) as 환자수 from ld_condition group by judge_year order by judge_year asc");
			c.eval("r <- dbGetQuery(conn,  sql)");
			
			c.eval("library(ggplot2)");
//			c.eval("ggplot(data = 'r', aes(x=연도, y=환자수))+geom_bar(stat='identity', width=0.4, fill='yellow')+scale_y_continuous(labels = scales::comma)");
			
//			c.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver', 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar')");
//			c.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521:xe', 'iseb', 'ebis')");
//			c.eval("r <- dbGetQuery(conn, 'SELECT * FROM ld_condition')");
//			REXP x = c.eval("r");
//			System.out.println(x);
			
			System.out.println("r 연동 성공");
		}
		catch(Exception e) {
			
			e.printStackTrace();
			System.out.println("r 연동 실패");
		}
		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;		
//		
//		try {
//			String driverClassName = "oracle.jdbc.driver.OracleDriver";
//			String oracleUrl = "jdbc:oracle:thin:@Localhost:1521:xe";
//			String user = "iseb";
//			String password = "ebis";
//			
//			Class.forName(driverClassName);
//			
//			connection = DriverManager.getConnection(oracleUrl, user, password);
//			
//			System.out.println("DB 연결 성공");
//			System.out.println("** Driver:" + driverClassName+", Connection:"+connection);
//			
//			String sql = "SELECT * FROM ld_condition";
//			
//			pstmt = connection.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				
//			}
//			
//			try {
//				RConnection c = new RConnection();
//				
//				c.eval("");
//				
//			}catch(Exception e2) {
//				e2.printStackTrace();
//			}
//			
//			
//		}catch(ClassNotFoundException e) {
//			e.printStackTrace();
//			System.out.println("드라이버 로딩 실패");
//		}catch(SQLException e2) {
//			e2.printStackTrace();
//			System.out.println("sql 오류");
//		}
	}
}
