<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");//로그인 여부 판단
	MemberDto memberDto = (MemberDto)request.getAttribute("memberList");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="css/admin_member.css">
</head>
<body>
    <div id="header">
        <ul>
           <h2><a href="admin_page.jsp">관리자 페이지</a></h2> 
            <li><a href="admin_modify.jsp">관리자 계정 관리 </a></li>
            <li><a href="admin_member.jsp">회원 관리</a></li>
            <li><a href="">게시글 관리</a>
                <ul class="submemu">
                    <li><a href="">- 게시판 관리</a></li>
                    <li><a href="">- 게시글 관리</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='index.jsp'">홈페이지</button>
    </div>
    <div id="content">
        <h3>회원 관리</h3>
        <div id="search">
        	<select>
        		<option>이름</option>
        		<option>이메일</option>
        	</select>
        	<input type="text">
        	<button type="button">검색</button>
        </div>
    	<div id="top-button">
    		<button type="button">전체 다운로드</button>
    	</div>
        <div id="data">
            <table>
                <th>아이디</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>관리</th>
            </table>
            <div id="button">
                
            </div>  
        </div>

    </div>
</body>
</html>