<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.project.clsp.model.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="css/findAccountR.css">
</head>
<body>
    <div id="container">
        <div id="logo">
            <a href="/" class="logo">
            <img src="img/그림2.png" alt="logo">
            </a>
        </div>
        <div>
        <fieldset>
            <h1>아이디 찾기</h1>
            <hr>
            <div id="label">
			<c:choose>
				<c:when test="${user_id == null }">
    		        <p>존재하지 않는 계정 입니다.</p>
	        	    <button type="button" onClick="fn_reSearch()">다시 검색하기</button>
				</c:when>
				<c:otherwise>
            		<p>회원가입 하실 때 사용한 아이디는 ${user_id }입니다.</p>
				</c:otherwise>
			</c:choose>
            </div>
        <div id="l-link">
            <p>
                <a href="/login">로그인</a>
                <a href="/findPassword">비밀번호 찾기</a>
            </p>
        </div>
        </fieldset>
        </div>
    </div>
    <script src="js/findAccountResult.js"></script>
</body>
</html>