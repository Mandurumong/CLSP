<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Model.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="dao" class="Model.MemberDao"/>
    <jsp:useBean id="dto" class="Model.MemberDto"/>
    <jsp:setProperty property="*" name="dto"/>
    
<%
  	String user_pw = dao.findPw(dto);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="css/findAccountR.css">
</head>
<body>
    <div id="container">
        <div id="logo">
            <a href="index.jsp" class="logo">
            <img src="" alt="logo">
            </a>
        </div>
        <div>
        <fieldset>
            <h1>비밀번호 찾기</h1>
            <hr>
            <div id="label">
            <%if(user_pw == null){ %>
            <p>존재하지 않는 계정 입니다.</p>
            <button type="button" onClick="#">다시 검색하기</button>
            <%}else{ %>
            <p>회원가입 하실 때 사용한 비밀번호는 <%=user_pw %>입니다.</p>
            <%} %>
            </div>
        </div>
        <div id="l-link">
            <p>
                <a href="login.jsp">로그인</a>
                <a href="findAccount.jsp">아이디 찾기</a>
            </p>
        </div>
        </fieldset>
    </div>
    <script src="script/findAccountResult.js"></script>
</body>
</html>