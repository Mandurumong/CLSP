<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/resigter.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <div id="logo">
            <a href="/" class="logo">
            <img src="img/그림2.png" alt="logo">
            </a>
        </div>
    </header>
        <div id="container">
        <form id="signup" name="signup" method="post" action="insertMember.do">
        <input type="hidden" name="user_level" value="0">
            <fieldset>
                <h1>회원가입</h1>
                <hr>
                <ul>
                <li>
                <label for= "user_id">아이디</label>
                <input type= "text" name ="user_id" id="user_id" autofocus oninput = "checkId()" placeholder="4자~16자 사이 공백없이" required>
                
                <span class="id_ok">사용 가능한 아이디 입니다.</span>
                <span class="id_already">이미 사용하고 있는 아이디 입니다.</span>
                
                </li>
                <li>
                <label for="user_pw1">비밀번호</label>
                <input type="password" name ="user_pw" id="user_pw1" placeholder="문자와 숫자, 특수 기호 2개 이상 포함" required>
               </li>
               <li>
                <label for="user_pw2">비밀번호 확인</label>
                <input type="password" id="user_pw2" required>
                </li>
                <li>
                    <label for="user_email">이메일</label>
                    <input type="email" name="user_email" id="user_email" placeholder="예)healthy@life.com" >
                </li>
                </ul>
                <div id="buttons">
                    <input type="button" value="가입하기" onClick="fn_validate()">
                </div>
            </fieldset>
        </form>
        <p>이미 계정이 있으세요?<a href="/login">로그인</a>
        </div>
        
       <script src="js/validate.js"></script>
</body>
</html>