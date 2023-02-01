<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="${path}/css/write.css">

</head>
<body>
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
		                  <button name="login"><a href='<c:url value="login.jsp" />'>로그인</a></button>
		                  <button name="register"><a href='<c:url value="register.jsp" />'>회원가입</a></button>
		                </c:when>
		                <c:otherwise>
		                	<button name="logout"><a href='<c:url value="logout.do" />'>로그아웃</a></button>
		                  	<button name="mypage"><a href='<c:url value="mypage_info.jsp" />'>마이페이지</a></button>
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
                        <li><a href="#">예방법</a>
                        <li><a href="#">커뮤니티</a>
                          <ul class="submenu">
                            <li><a href="community_freeBoard.jsp">자유게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="#">커뮤니티</a></li>
              <li><a href="community_freeBoard.jsp">자유게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <h1>
                <a href="community_freeBoard.jsp">자유게시판</a>
            </h1>
            <div class="board_wrap">
                <div class="board_title">
                    
                    <p></p>
                </div>
                <div class="board_write_wrap">
                    <div class="board_write">
                        <form action="/clsp/board/write" method="post" id="writeForm">
                        <input type="hidden" name = "user_id" value="${user_id }">
                        	<p>카테고리</p>
                        	<br>
                            <select class="category-control" name="category" id="category">
                                <option value="qna">질문</option>
                                <option value="tip">정보</option>
                                <option value="daily">일상</option>
                                <option value="diet">식단</option>
                                <option value="etc">기타</option>
                       	 	</select>
                       	 		<br><br>
                                <p>제목</p>
                                <input id="title" type = "text" name = "title">
                                <br><br>
								<p>본문</p>
                                <textarea style="resize: none;" id="content" name="content" title="내용을 입력해 주세요." 
                                rows="10" cols="60"></textarea>
                            <div class="sBtn">
                            <input id = "submit-bt" type="submit" value="등록">
                        </div>
                            </form>
                        </div>

                    </div>
                  
                </div>
            </div>
        </div>
        </div>
        </div>
        </body>
        </body>
        </html>
        

