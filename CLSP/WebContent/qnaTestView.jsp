<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="/css/qnaTestView.css">

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
                          <a href="analytics.do">현황 분석</a></li>
                        <li>
                          <a href="selfTestM.jsp">자가 진단</a>
                        </li>
                        <li><a href="#">예방법</a>
                        <li><a href="#">커뮤니티</a>
                          <ul class="submenu">
                            <li><a href="community_notice.jsp">공지사항</a></li>
                            <li><a href="community_freeBoard.jsp">문의게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="#">커뮤니티</a></li>
              <li><a href="community_notice.jsp">공지사항</a></li>
              <li><a href="community_freeBoard.jsp">문의게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <h1>
                <a href="community_freeBoard.jsp">문의게시판</a>
            </h1>
           
                <div class="cmn-content" class="cmn-search">
                <div class="common01">
                    <div class>
                        <div class="detail-view">
                            <p class="title">검사 결과 문의</p>
                            <div class="post-info">
                                <ul>
                                    <li class="category">

                                        <p>
                                            <strong>카테고리</strong>
                                            진단
                                        </p>
                                    </li>    
                                    <li class="date">
                                        <p>
                                            <strong>등록일</strong>
                                            2022-11-26
                                        </p>
                                    </li>    
                                    <li class="count">
                                        <p>
                                            <strong>조회수</strong>
                                            1
                                        </p>
                                    </li>
                                    <li>
                                        <p>
                                            <strong>작성자</strong>
                                            사용자2
                                        </p>

                                    </li>
                                </ul>
                            </div>
                            <div class="post-content">
                                <div class="fr-view">
                                    <p>검사 결과 정확도를 알고 싶어요! </p>
                                    <p><br></p>
                                    <p>빠른 답변 부탁드립니다.</p>     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="b-btn01 type01">
                        <div class="button-group a-r">
                            <a class="button medium border v1" href="community_freeBoard.jsp"> <strong>목록</strong> </a>
                        </div>
                    </div>

                </div>
                </div>    
                   
             
            </div>
        </div>



           </div>

    
</body>
</html>