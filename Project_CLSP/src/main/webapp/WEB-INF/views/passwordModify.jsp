<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.project.clsp.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div id="container">
        <div id="logo">
            <a href="index.html" class="logo">
            <img src="" alt="logo">
            </a>
        </div>
    <form id="password_modify" action="modifyPassword.do" method="post">   
        <fieldset>
            <h1>비밀번호 재설정</h1>
            <hr>
            <div id = "pw_modify">
                <label for="pw1">새 비밀번호</label>
                <input type="password" name="user_pw" id="user_pw" placeholder="문자와 숫자, 특수 기호 2개 이상 포함" required autofocus>
                <label for="pw2">새 비밀번호 확인</label>
                <input type="password" name="user_pw2" id="user_pw2" required>
                <button type="button" onclick="fn_modify()">변경하기</button>
            </div>
        </fieldset>
    </form>


    <div id="l-link">
        <p><a href="/findAccount">아이디 찾기</a>
           <a href="/register.html">회원가입</a>
        </p>
    </div>
</div>
<script src="script/pw_modify.js"></script>
</body>
</html>