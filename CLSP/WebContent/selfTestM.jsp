<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>성인병 위험도 측정과 예방법 제안 : 자가 진단 메인</title>
    <link rel="stylesheet" href="css/selfTestM.css">
</head>
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
                    <li><a href="community_freeBoard.jsp">게시판</a>
                    </li>
                  </ul>
            </nav>
       </header>
       <div id="main">
        <div id="banner">
            <h2>자가 진단 테스트</h2>
        </div>
        <div id="content">
            <section id="selfTest_info">
            	<h3>01</h3>
                <h2>자가 진단 테스트란?</h2>
                <p><b>자가 진단 테스트</b>는 식습관, 생활 습관, 운동, 유전 등 과 같은<br> 여러가지의 성인병에 걸릴 확률을 높혀주는 요인들을 분석하여<br> 사용자가 성인병에 걸릴 위험도와 확률에 대해 진단을 해보는 테스트 입니다.</p>
            </section>
            
            <section id="whatIsRisk">
            	<h3>02</h3>
                <h2>위험도 분석이란?</h2>
                <div class="top_user">
                	<div class="graph">
                		<ul>
                  			<li>양호</li>
                  			<li>관심</li>
                  			<li>주의</li>
                  			<li>경고</li>
                  			<li>위험</li>
                		</ul>
 	             	</div>
                </div>
                <p>단위를 양호, 관심, 주의, 경고, 위험<br>
                5가지로 나누어 사용자가 입력한 데이터에 따라 분석하여<br>
                            위험도를 구분합니다.<br><br>
                0-19% 양호 단계 <br>
                20-39% 관심 단계<br>
                40-59% 주의 단계<br>
                60-79% 경고 단계<br>
                80-100% 위험 단계
                </p>
            </section>
            
            <section id="move">
            	<h3>03</h3>
                <h2>나의 당뇨 위험도 측정하고 맞춤 예방법 추천 받기</h2>
                <button type="button" id="go" name="goTest"><a href="test.jsp"><span>진단 시작하기</span></a></button>
            </section>
        </div>
    </div>
    </div>
</body>
</html>