<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>예방법</title>
    <link rel="stylesheet" href="${path}/css/videoList.css"/>
	
</head>
<body>
<!-- <script src="script/reply.js?1234"></script> -->
    <body class="body-set">
        <div id="container">
            <header>
                <div class="header">
                    <div id="logo">
                        <a href="index.jsp" class="logo">
                        <img src="#" alt="logo">
                        </a>
                    </div>
    
                    <div id="top-nav">
		                <c:choose>
		                <c:when test="${user_id == null }">
		                  <button name="login"><a href='<c:url value="login" />'>로그인</a></button>
		                  <button name="register"><a href='<c:url value="register.jsp" />'>회원가입</a></button>
		                </c:when>
		                <c:otherwise>
		                	
		                	<button name="logout"><a href='<c:url value="logout" />'>로그아웃</a></button>
		                  	<button name="mypage"><a href='<c:url value="/confirm/view" />'>마이페이지</a></button>
		                </c:otherwise>
		                </c:choose>  
                    </div>
    
                </div>
    
                <nav>
                    <ul class="menu">
                        <li>
                          <a href="index.jsp">홈</a></li>
                        <li>
                          <a href="analytics.jsp">현황 분석</a></li>
                        <li>
                          <a href="selfTestM.jsp">자가 진단</a>
                        </li>
                        <li><a href="${path}/api/prevent">예방법</a>
                        <li><a href="#">커뮤니티</a>
                          <ul class="submenu">
                            <li><a href="community_notice.jsp">공지사항</a></li>
                            <li><a href="community_freeBoard.jsp">자유게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>
            
            
            <div class="videoArea">
                <h3 class="subTit_bl"><span>추천 운동 영상</span></h3>
                <div class="videoSemiList">
                  <c:forEach var="v" items="${list}">
                    <div class="mycell">
                        <div class="card">
                            <div class="videoLink">
                                <video src="${v.FILEURL}${v.FILENM}" width="300" height="170" ></video>
                            </div>
                            <div class="videoSemiListTitle">
                                <a href="/clsp/api/video?num=${v.ROW_NUM}">
                                	<h2 class="h2Title"> ${v.TNM}</h2>
                                </a>
                                
                            </div>
                        </div>
                    </div>
                      </c:forEach>
                    </div>
            </div>