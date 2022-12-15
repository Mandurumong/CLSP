<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="css/findPassword.css">
</head>
<body>
    <div id="container">
        <div id="logo">
            <a href="index.jsp" class="logo">
            <img src="" alt="logo">
            </a>
        </div>
    <form id="findPw" name = "findPw" method = "post" action="findPw.do">    
    <fieldset>
        <h1>비밀번호 찾기</h1>
        <hr>
        <div id="label">
        <ul>
            <li>
                <label for="user_email">이메일</label>
                <input type="email" id="user_email" required autofocus>        
            </li>
            <li>
                <label for="user_id">아이디</label>
                <input type="text" id="user_id" required>
            </li>
        </ul>
        </div>
        <div id="button">
            <button type="button" onClick="fn_findPw()">확인</button>
        </div>
    </fieldset>
    </form>
    <div id="l-link">
        <p><a href="login.jsp">로그인</a>
           <a href="findAccount.jsp">아이디 찾기</a>
        </p>
    </div>
</div>
<script src="script/find_pw.js"></script>
</body>
</html>