<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.project.clsp.model.*"%>
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
           <h2><a href="/admin_page">관리자 페이지</a></h2> 
            <li><a href="/admin_modify">관리자 계정 관리 </a></li>
            <li><a href="memberList.do">회원 관리</a></li>
            <li><a href="">게시글 관리</a></li>
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='/'">홈페이지</button>
    </div>
    <div id="content">
        <h3>관리자 계정 관리</h3>
        <div id="data">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><%=user_id %></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>${adminInfo.user_pw}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${adminInfo.user_email}</td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${adminInfo.user_level == 1}">관리자</c:when>
                    		<c:otherwise>일반 회원</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
            </table>
            <div id="button">
                <button type="button" onClick="location.href='/admin_modify'">수정하기</button>
            </div>  
        </div>

    </div>
</body>
</html>