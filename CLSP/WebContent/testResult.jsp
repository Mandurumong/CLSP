<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	TestDto testDto = (TestDto)request.getAttribute("test");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>결과보기</title>
    <link rel="stylesheet" href="css/testResult.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body>
<body>
  <body class="body-set">
    <div id="container">
        <header>
            <div class="header">
                <div id="logo">
                    <a href="index.jsp" class="logo">
                    <img src="img/그림1.png" alt="logo">
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
           <div id="result_top_level" class="mb-auto wd-960">
            <div class="top_user">
            	<c:choose>
                	<c:when test="${user_id == null }">
                  	     <p><span>사용자</span> 님의 결과</p>
                	</c:when>
                	<c:otherwise>
                	     <p><span><%= user_id %></span> 님의 결과</p>
                	</c:otherwise>
            	</c:choose>  
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
              	<c:choose>
              		<c:when test="${user_id == null }">
                		<p><span>사용자</span> 님의 당뇨 위험도는
                		 
                		<c:choose>
                		<c:when test="${20> test.allScore}">
                			<span>LV.1 양호 단계</span>
                		</c:when>
                		<c:when test="${40 > test.allScore}">
                			<span>LV.2 관심 단계</span>
                		</c:when>
                		<c:when test="${60 > test.allScore}">
                			<span>LV.3 주의 단계</span>
                		</c:when>
                		<c:when test="${80 > test.allScore}">
                			<span>LV.4 경고 단계</span>
                		</c:when>
                		<c:otherwise>
                			<span>LV.5 위험 단계</span>
                		</c:otherwise>
                		</c:choose>
                		이며 당뇨 발병 확률은 <span><%= testDto.getAllScore()%> %</span> 입니다.</p>	                	
                	</c:when>
                	
                	<c:otherwise>
                	
                		<p><span><%= user_id %></span> 님의 당뇨 위험도는 
                		<c:choose>
                		<c:when test="${test.allScore < 20}">
                			<span>LV.1 양호 단계</span>
                		</c:when>
                		<c:when test="${40 > test.allScore}">
                			<span>LV.2 관심 단계</span>
                		</c:when>
                		<c:when test="${60 > test.allScore}">
                			<span>LV.3 주의 단계</span>
                		</c:when>
                		<c:when test="${80 > test.allScore}">
                			<span>LV.4 경고 단계</span>
                		</c:when>
                		<c:otherwise>
                			<span>LV.5 위험 단계</span>
                		</c:otherwise>               		
                		</c:choose>               		              		
                		이며 당뇨 발병 확률은 <span><%= testDto.getAllScore()%> %</span> 입니다.</p>
                	</c:otherwise>
                </c:choose>
              </div>  <!-- user_result -->
            </div> <!-- top_user -->
            <h5 class="same_age">같은 <%=testDto.getAge() %> 대의 통계</h5>
            <div class="foto">
            	<h3>전체 비율</h3>
            	<c:choose>
            		<c:when test="${test.age == 10 }">
            			<canvas id="Chart10" width="1200" height="600"></canvas>
						<canvas id="Chart_gender10" width="1200" height="600"></canvas>
            		</c:when>
            		<c:when test="${test.age == 20 }">
            		    <canvas id="Chart20" width="1200" height="600"></canvas>
                  		<canvas id="Chart_gender20" width="1200" height="600"></canvas>
            		</c:when>
            		<c:otherwise>
            		
            		</c:otherwise>
            	</c:choose>
              <p>
					자세한 사항은 현황분석을 확인해주세요
              </p>
              <div class="more_info"><a href="analytics.do">현황 분석 보기</a></div>
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
                  <li>식습관 <%= (testDto.getEatingHabits()*100/testDto.getAllScore()) %>%</li>
                  <li>생활습관 <%= (testDto.getLifeHabits()*100/testDto.getAllScore()) %> %</li>
                </ul> 
                <ul class="sec_cause">
                  <li>운동 <%= (testDto.getExercise()*100/testDto.getAllScore())%>%</li>
                  <li>기타 <%= (testDto.getEtc()*100/testDto.getAllScore())%>%</li>
                </ul>
                
                <c:choose>
                	<c:when test="${user_id == null }">
                		<p class="border_main"><span>사용자</span> 님의 주요 위험 요인은 
                		<c:choose>
                			<c:when test="">               			
                				<span>식습관</span>
                			</c:when>
                			<c:when test="">
                				<span>생활습관</span>
                			</c:when>
                			<c:when test="">
                				<span>운동</span>
                			</c:when>
                			<c:otherwise>
                				<span>기타</span>
                			</c:otherwise>
                		</c:choose>
                		입니다.</p>
                	</c:when>
                	<c:otherwise>
                		<p class="border_main"><span><%=user_id %></span> 님의 주요 위험 요인은 
                		<c:choose>
                			<c:when test="">               			
                				<span>식습관</span>
                			</c:when>
                			<c:when test="">
                				<span>생활습관</span>
                			</c:when>
                			<c:when test="">
                				<span>운동</span>
                			</c:when>
                			<c:otherwise>
                				<span>기타</span>
                			</c:otherwise>
                		</c:choose>
                		입니다.</p>
                	</c:otherwise>
                </c:choose>
                
                <c:choose>
                	<c:when test="${test.eatingHabits == null}">
                	 	<p>null</p>
                	</c:when>
                	<c:when test="${test.eatingHabits == 15}">
                		<p>15</p>
                	</c:when>
                	<c:otherwise>
                	 	<p>값이 들어왔다,,,</p>
                	</c:otherwise>
                </c:choose>
                
                <div class="more_info"><a href="#prevention">제안 예방법 보기</a></div>
              </div>
            </div>
			
			<div id = "prevention">
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
<script src="script/chart10.js"></script>
<script src="script/chart20.js"></script>
</body>
</html>