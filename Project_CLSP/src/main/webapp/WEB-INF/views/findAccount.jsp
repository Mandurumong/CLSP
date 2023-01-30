<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="css/findAccount.css">
</head>
<body>
    <div id="container">
        <div id="logo">
            <a href="/" class="logo">
            <img src="img/그림2.png" alt="logo">
            </a>
        </div>
        
    <form id="findId" name = "findId" method = "post" action="findId.do">    
    <fieldset>
        <h1>아이디 찾기</h1>
        <hr>
        <div id="label">
        <ul>
            <li>
                <label for="mail">이메일</label>
                <input type="email" name ="user_email" id="user_email" required autofocus>        
            </li>
            <li>
                <label for="userPw">비밀번호</label>
                <input type="password" name = "user_pw" id="user_pw" required>
            </li>
        </ul>
        </div>
        <div id="button">
            <button type="button" onClick="fn_findId()">확인</button>
        </div>
    </fieldset>
    </form>

    <div id="l-link">
        <p>
        	<a href="/login">로그인</a>
            <a href="/findPassword">비밀번호 찾기</a>
        </p>
    </div>
</div>
<script src="js/find_id.js"></script>
</body>
</html>