<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	int user_level = (Integer)session.getAttribute("user_level");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>답글작성</title>
    <link rel="stylesheet" href="${path}/css/Write.css">

</head>
    <body class="body-set">
        <div id="container">
            <header>
            <div class="header">
                <div id="logo">
                    <a href="<c:url value='/'/>" class="logo">
                    <img src="img/그림2.png" alt="logo">
                    </a>
                </div>

				<div id="top-nav">
                	<c:choose>
                		<c:when test="${user_id == null }">
                  			<button name="login"><a href='<c:url value="/login" />'>로그인</a></button>
                  			<button name="register"><a href='<c:url value="/register" />'>회원가입</a></button>
                		</c:when>
                		<c:when test="${user_level == 1 }">
                			<button name="logout"><a href='<c:url value="/logout.do"/>'>로그아웃</a></button>
                			<button name="logout"><a href='<c:url value="/admin_page"/>'>관리자페이지</button>
                		</c:when>
                		<c:otherwise>
                			<button name="logout"><a href='<c:url value="/logout.do" />'>로그아웃</a></button>
                  			<button name="mypage"><a href='<c:url value="/confirm/view" />'>마이페이지</a></button>
                		</c:otherwise>
                	</c:choose>    
                </div>

            </div>

            <nav>
                <ul class="menu">
                    <li>
                      <a href="<c:url value='/index'/>">홈</a></li>
                    <li>
                      <a href="analytics.do">현황 분석</a></li>
                    <li>
                      <a href="/selfTestM">자가 진단</a>
                    </li>
                    <li><a href="${path}/api/prevent">예방법</a></li>
                    <li><a href="/board/list">게시판</a></li>
                  </ul>
            </nav>
       </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="/board/list">게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <div class="board_wrap">
                <div class="board_title">
                    
                    <p>답글을 등록해 주세요.</p>
                </div>
                <div class="board_write_wrap">
                    <div class="board_write">
                        <form action="/board/write" method="post" id="writeForm">
                        <input type="hidden" name = "user_id" value="${user_id }">
                        	<p>카테고리</p>
                        	<br>
                          <input id="title" type ="text" name = "category" value="${board.FB_CATEGORY}" readonly>
                       	 		<br><br>
                                <p>제목</p>
                                <input id="title" type ="text" name = "title" value="">
                                <input id="indent" type ="hidden" name = "indent" value="${board.FB_INDENT + 1 }">
                                <input id="group" type ="hidden" name = "group" value="${board.FB_GROUP }">
                                <input id="step" type ="hidden" name = "step" value="${board.FB_STEP + 1}">
                                <input id="p_fbnum" type ="hidden" name = "p_fbnum" value="${board.FB_NUM }">
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
	</body>
</html>
        
