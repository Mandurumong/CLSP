<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");//로그인 여부 판단
	String user_pw = (String)session.getAttribute("user_pw");
	String user_email = (String)session.getAttribute("user_email");
	MemberDto memberDto = (MemberDto)session.getAttribute("memberList");
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
            <li><a href="admin_member.jsp">회원 관리</a></li>
            <li><a href="">게시글 관리</a>
                <ul class="submemu">
                    <li><a href="">- 게시판 관리</a></li>
                    <li><a href="">- 게시글 관리</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='index.jsp'">홈페이지</button>
    </div>
    <div id="content">
        <h3>관리자 계정 관리</h3>
        <div id="data">
        <form id="admin_modify" name="admin_modify" action="adminModify.do" method="POST">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" id="user_id" placeholder=<%= user_id %> name = "user_id" readonly="readonly">
                    <input type="hidden" id="user_id" name = "user_id" value=<%=user_id %>>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="user_pw" name="user_pw" autofocus placeholder=<%=memberDto.getUser_pw() %> value=<%=memberDto.getUser_pw() %> required></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" id="user_email" name="user_email" placeholder=<%=memberDto.getUser_email() %> value=<%=memberDto.getUser_email() %>></td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td>관리자</td>
                </tr>
            </table>
            <div id="button">
                <button type="button" onClick="fn_validate()">변경사항 저장</button>
                <button type="button" onClick="location.href='adminInfo.do'">취소</button>
            </div>
        </form>    
        </div>

    </div>
    <script src="script/admin_modify.js"></script>
</body>
</html>