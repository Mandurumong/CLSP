<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">

</head>

<body>

    <div id="container">
        <div id="logo">
            <a href="index.jsp" class="logo">
            <img src="" alt="logo">
            </a>
        </div>
    <form name="frmLogin" id="login" method="post" action="login.do">    
    <fieldset>
        <h1>로그인</h1>
        <ul>
            <li>
                <input type="text" name="user_id"  id="user_id" placeholder="아이디" required autofocus>        
            </li>
            <li>
                <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호" required>
            </li>
        </ul>
        <div id="button">
            <input type="button" value="로그인" onclick="login_validate()">
        </div>
    </fieldset>
    </form>


    <div id="l-link">
        <p><a href="findAccount.jsp">아이디 찾기</a>
           <a href="findPassword.jsp">비밀번호 찾기</a>
           <a href="register.jsp">회원가입</a>
        </p>
    </div>
</div>
<script src="script/login_validate.js"></script>


	
</body>
</html>