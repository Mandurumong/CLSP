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
    <link rel="stylesheet" href="css/admin_member.css">
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
        <h3>회원 관리</h3>
        <div id="search">
        	<select>
        		<option>아이디</option>
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
            	<tr>
                	<th>아이디</th>
                	<th>이메일</th>
                	<th>가입일</th>
                	<th>등급</th>
                	<th>관리</th>
            	</tr>
            	<c:forEach var="memberDto" items="${memberList}">
            	<tr>
	            	<td><c:out value="${memberDto.user_id}"/></td>
	            	<td><c:out value="${memberDto.user_email}"/></td>
	            	<td><c:out value="${memberDto.reg_date}"/></td>
	            	<td>
	            	<c:choose>
	            		<c:when test="${memberDto.user_level == 0 }">일반회원</c:when>
	            		<c:otherwise>관리자</c:otherwise>
	            	</c:choose>
	            	</td>
	            	<td>
	            		<a href="deleteMember.do?user_id=${memberDto.user_id }"><button type="button" id="trash"><img src="img/trashcan.png" alt="삭제"></button></a>
	            		<a href="memberInfo.do?user_id=${memberDto.user_id }"><button type="button"><img src="img/gear.png" alt="설정"></button></a>
	            	</td>
            	</tr>
            	</c:forEach>
            </table>
            <div id="button">                
            </div>  
        </div>
    </div>
</body>
<script src="js/admin_member.js"></script>
</html>