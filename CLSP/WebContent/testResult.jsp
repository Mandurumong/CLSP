<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>결과보기</title>
    <link rel="stylesheet" href="css/testResult.css">
</head>
<body>
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
                    <li><a href="community_freeBoard.jsp">게시판</a>
                    </li>
                  </ul>
            </nav>
       </header>

           <div id="result_top_level" class="mb-auto wd-960">
            <div class="top_user">
              <p><span>'사용자'</span>님의 결과</p>
              <div class="graph">
                <ul>
                  <li>양호</li>
                  <li>관심</li>
                  <li>주의</li>
                  <li>경고</li>
                  <li>위험</li>
                </ul>
              </div>
              <div class="user_result">
                <p><span>사용자</span> 님의 당뇨 위험도는 <span>LV.2 관심 단계</span>이며 당뇨 발병 확률은 35% 입니다.</p>
              </div>  <!-- user_result -->
            </div> <!-- top_user -->
            <h5 class="same_age">같은 나이 대의 통계</h5>
            <div class="foto">
              <p>
                
              </p>
            </div>

            <!-- 그래프 -->
            <div class="pie_wrap">
              <div class="pie-chart1">
              </div>
              <div class="pie_right">
                <p style="font-weight: 700; font-size:20px;">주요 위험 요인</p>
                <ul class="cause">
                  <li><div></div>식습관</li>
                  <li><div></div>생활 습관</li>
                  <li><div></div>운동</li>
                  <li><div></div>기타</li>
                </ul>
                <ul class="first_cause">
                  <li>식습관 60%</li>
                  <li>생활습관20%</li>
                </ul> 
                <ul class="sec_cause">
                  <li>운동 10%</li>
                  <li>기타 10%</li>
                </ul>
                <p class="border_main"><span>사용자</span> 님의 주요 위험 요인은 <span>식습관</span>입니다.</p>
                <div class="more_info"><a href="#">제안 예방법 보기</a></div>
              </div>
            </div>

            <div class="method_pr">
              <h5 class="same_age">제안 예방법</h5> 
              <p>식습관 개선하기</p>
              <div>
                <h5>1. 골고루 먹기</h5>
                <ul class="no_1">
                  <li>추천식단</li>
                  <li><img src="">이미지</li>
                </ul>
              </div>
              <div>
                <h5>2. 배달음식 줄이기</h5>
                <ul class="no_2">
                  <li>상황 상 배달음식을 줄이기 힘드시다면<br> 아래 가게들을 참조해보세요.</li>
                  <li>나트륨 줄이기 실천 음식점</li>
                  <li><br><img src="img/배달.png"></li>
                </ul>
              </div>
              <p class="al_center"><button type="button" onClick="location.href='test.jsp'" value="다시 하기"></button></p>
            </div>


            <div class="arrow_top">
              <img src="img/pngegg.png">
            </div>
          </div>
</body>
</html>