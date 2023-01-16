<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");//로그인 여부 판단
	String user_pw = (String)session.getAttribute("user_pw");
	String user_email = (String)session.getAttribute("user_email");
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
           <h2><a href="admin_page.jsp">관리자 페이지</a></h2> 
            <li><a href="admin_modify.jsp">관리자 계정 관리 </a></li>
            <li><a href="">회원 관리</a></li>
            <li><a href="">게시글 관리</a>
                <ul class="submemu">
                    <li><a href="">- 게시판 관리</a></li>
                    <li><a href="">- 게시글 관리</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="content">
        <h3>관리자 계정 관리</h3>
        <div id="data">
        <form>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" id="uid" placeholder=<%= user_id %> name = "uid" readonly="readonly"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="pwd1" name="pwd1" autofocus placeholder="변경할 비밀번호 입력" required></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" id="email" name="email" placeholder=<%=user_email %>></td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td>관리자</td>
                </tr>
            </table>
            <div id="button">
                <button type="button">변경사항 저장</button>
            </div>
        </form>    
        </div>

    </div>
</body>
</html>