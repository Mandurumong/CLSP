<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="css/admin_page.css">
</head>
<body>
    <div id="header">
        <ul>
           <h2><a href="admin_page.jsp">관리자 페이지</a></h2> 
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='index.jsp'">홈페이지</button>
    </div>
    <div id="content">
            <h3>비밀번호 재확인</h3>
                  <div id="data">
                	<form name="pwReConfirm" id="pwReConfirm" action="adminInfo.do" method="POST">
	                <table>
    	            <tr>
        	            <th>아이디</th>
            	        <td><input type="text" id="user_id" placeholder=<%= user_id %> name = "user_id" readonly></td>
                	</tr>
  	                <tr>
   		                <th>비밀번호</th>
                    	<td><input type="password" id="user_pw" name="user_pw" autofocus placeholder="비밀번호를 입력해 주세요" required></td>
                	</tr>
            		</table>
            		<div id="button">
                		<button type="button" onClick="fn_check()">확인</button>
            		</div>
            	</form>
        	</div>
    </div>
    <script src="script/admin_page.js"></script>
</body>
</html>