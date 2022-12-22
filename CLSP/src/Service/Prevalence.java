package Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;




public class Prevalence {

	public Prevalence() {}
	
public static void main(String[]args)throws IOException, ParseException{
	
	StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15064610/v1/uddi:02fd0457-42eb-4fdb-b85e-9922c12db10e?page=1&perPage=19&serviceKey=MJMs8JIaAkNEX%2F2vUCExGeTSECeIqaqKHHH1ydOK9qNp3lPHBLLv3obmnk5HZBdAjZ1F%2BXezmhDL0%2BX43yP%2BSw%3D%3D");
	
	URL url = new URL(urlBuilder.toString());
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	conn.setRequestMethod("GET");
	conn.setRequestProperty("Content-type", "application/json");
	
	System.out.println("Response code : "+ conn.getResponseCode());
	
	BufferedReader rd;
	
	if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
		rd = new BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
		
	}else {
		rd = new BufferedReader(new java.io.InputStreamReader(conn.getErrorStream()));
	}
	
	StringBuilder sb = new StringBuilder();
	String line;
	
	while((line = rd.readLine()) != null) {
		sb.append(line);
	}
	rd.close();
	conn.disconnect();
	String result = sb.toString();
	System.out.println(result); //데이터 들어간거 확인용
		
	Connection connection = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	try {
		String driverClassName = "oracle.jdbc.driver.OracleDriver";
		String oracleUrl = "jdbc:oracle:thin:@Localhost:1521:xe";
		String user = "iseb";
		String password = "ebis";
		
		JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
	    //JSON object로 만들기
	    JSONArray pvArray = (JSONArray) jsonObj.get("data");
	    //배열 추출
	
		Class.forName(driverClassName);
		
		connection = DriverManager.getConnection(oracleUrl, user, password);
		
		System.out.println("DB연결 성공");
		System.out.println("** Driver:" + driverClassName+", Connection:"+conn);
		
		String sql = "INSERT INTO Prevalence VALUES(?, ?, ?, ?, ?)";
		
		pstmt = connection.prepareStatement(sql);
		
		for(int i=0; i<pvArray.size(); i++) {
	    	
	    	System.out.println("-----data"+i+"-----");
	    	
	    	JSONObject object = (JSONObject) pvArray.get(i);
	    	
	    	String siGungu = (String)object.get("시군구");
	    	String siDo = (String)object.get("시도");
	    	String index_Value = (String)object.get("지표값(퍼센트)");//float
	    	String index_name = (String)object.get("지표명");
	    	String index_Year = object.get("지표연도").toString();//int
	    	
	    	System.out.println("시군구 : " + siGungu);
	    	System.out.println("시도 : " + siDo);
	    	System.out.println("지표값 : " + index_Value);//
	    	System.out.println("지표명 : " + index_name);
	    	System.out.println("지표연도 : " + index_Year);//
	    	
	    	pstmt.setString(1, siGungu);
	    	pstmt.setString(2, siDo);
	    	pstmt.setString(3, index_Value);
	    	pstmt.setString(4, index_name);
	    	pstmt.setString(5, index_Year);
	    	
	    	int r = pstmt.executeUpdate();
	    	
	    	System.out.println("sql 실행:"+r+"개의 row 삽입");
		}
	}catch(ClassNotFoundException e) {
		System.out.println("드라이버 로딩 실패");
		e.printStackTrace();
	}catch(SQLException e2) {
		System.out.println("sql 오류");
		e2.printStackTrace();
	}
	}
}