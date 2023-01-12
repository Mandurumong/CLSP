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
            <c:choose>
            	<c:when test="${test.age == 70 }">
            		<h5 class="same_age">같은 <%=testDto.getAge() %> 대 이상의 통계</h5>            
            	</c:when>
            	<c:otherwise>
            		<h5 class="same_age">같은 <%=testDto.getAge() %> 대의 통계</h5> 
            	</c:otherwise>
            </c:choose>
            <div class="foto">
            	<h3>전체 비율</h3>
            	<c:choose>
            		<c:when test="${test.age == 10 }">
            			<canvas id="Chart10" width="800" height="300"></canvas>
						<canvas id="Chart_gender10" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 20 }">
            		    <canvas id="Chart20" width="800" height="300"></canvas>
                  		<canvas id="Chart_gender20" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 30 }">
            			<canvas id = "Chart30" width = "800" height="300"></canvas>
            			<canvas id = "Chart_gender30" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 40 }">
            			<canvas id ="Chart40" width = "800" height="300"></canvas>
            			<canvas id = "Chart_gender40" width="800" height = "350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 50 }">
            		    <canvas id ="Chart50" width = "800" height="300"></canvas>
            			<canvas id = "Chart_gender50" width="800" height = "350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 60 }">
            		    <canvas id ="Chart60" width = "800" height="300"></canvas>
            			<canvas id = "Chart_gender60" width="800" height = "350"></canvas>
            		</c:when>
            		<c:otherwise>
            		    <canvas id ="Chart70" width = "800" height="300"></canvas>
            			<canvas id = "Chart_gender70" width="800" height = "350"></canvas>
            		</c:otherwise>
            	</c:choose>
              	<h4>자세한 사항은 현황분석을 확인해주세요</h4>
              <button type="button" onclick="location.href='analytics.do'">현황 분석 보기</button>
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
                			<c:when test="${ test.eatingHabits > test.lifeHabits && test.eatingHabits > test.exercise && test.eatingHabits > test.etc}">               			
                				<span>식습관</span>
                			</c:when>
                			<c:when test="${ test.lifeHabits > test.eatingHabits && test.lifeHabits > test.exercise && test.lifeHabits > test.etc}">
                				<span>생활습관</span>
                			</c:when>
                			<c:when test="${ test.exercise > test.eatingHabits && test.exercise > test.lifeHabits && test.lifeHabits > test.etc}">
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
                			<c:when test="${ test.eatingHabits > test.lifeHabits && test.eatingHabits > test.exercise && test.eatingHabits > test.etc}">               			
                				<span>식습관</span>
                			</c:when>
                			<c:when test="${ test.lifeHabits > test.eatingHabits && test.lifeHabits > test.exercise && test.lifeHabits > test.etc}">
                				<span>생활습관</span>
                			</c:when>
                			<c:when test="${ test.exercise > test.eatingHabits && test.exercise > test.lifeHabits && test.lifeHabits > test.etc}">
                				<span>운동</span>
                			</c:when>
                			<c:otherwise>
                				<span>기타</span>
                			</c:otherwise>
                		</c:choose>
                		입니다.</p>
                	</c:otherwise>
                </c:choose>
                
                <div class="more_info"><a href="#prevention">제안 예방법 보기</a></div>
              </div>
            </div>
			
			<div id = "prevention">
			</div>
            <div class="method_pr">
              <h5 class="same_age">제안 예방법</h5> 
              <c:choose>
				<c:when test="${test.eatingHabits >= 15}">
					<p>·식습관 개선하기</p>
					<div>
					<c:choose>
						<c:when test="${ test.breakfast == 'eatBreakfast_no'}">
						<div>
                		<h5>아침 식사 하기</h5>
                		<ul class="no_1">
                  			<li>추천식단</li>
                  			<li><img src="">이미지</li>
							<%=testDto.getLifeHabits() %>
							<%=testDto.getEtc() %>
                		</ul>
                		</div>
						</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ test.dinnerTime == 'eatMealAfter8_yes'}">
						<div>
							<h5>1. 야식 먹지 않기</h5>
							<h5>2. 저녁 일찍 먹기</h5>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ test.mealRegular == 'eatRegular_no' }">
							<div>
								<h5>규칙적인 식사 하기</h5>
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.mealSpeed == 'eatSpeedFast_yes' }">
						<div>
							<h5>식사 속도 늦추기</h5>
						</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${test.mealSnack =='eatSnack_yes' }">
						<div>
							<h5>식사 후 간식 먹지 않기</h5>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.alcohol == 'drinkAlcohol_yes' }">
						<div>
							<h5>술 줄이기</h5>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.mealdeli == 'deliver_yes'}">
						<div>
							<h5>배달 음식 줄이기</h5>
							<ul class="no_2">
                  				<li>상황 상 배달음식을 줄이기 힘드시다면<br> 아래 가게들을 참조해보세요.</li>
                  				<li>나트륨 줄이기 실천 음식점</li>
                  				<li><br><img src="img/배달.png"></li>
                			</ul>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
              		</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
              </c:choose>
              <c:choose>
				<c:when test="${test.lifeHabits >= 15}">
					<p>·생활습관 개선하기</p>
					<c:choose>
						<c:when test="${ test.after1 == spleepAfter1_yes}">
							<h5>일찍 자세요</h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.sleepTime ==  sleepLess6_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose> 
					<c:choose>
						<c:when test="${test.light ==  lightOn_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.brush == brush3_no }">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.smoke == smoke_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              <c:choose>
				<c:when test="${test.exercise >= 15}">
					<p>·운동습관 개선하기</p> 
					<c:choose>
						<c:when test="${test.exerciseRegular == exerciseRegular_no}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.exercise30 == exercise30_no }">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.strech == stretching_no}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              <c:choose>
				<c:when test="${test.etc >= 15}">
					<p>·기타습관 개선하기</p>
					<c:choose>
						<c:when test="${test.inheritance == inheritance_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose> 
					<c:choose>
						<c:when test="${test.stress == stress_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.insulin == insulinx_yes }">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.fat == fat_yes}">
							<h5></h5>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
              </c:choose>
            </div> 
            
			<div class="retry">
				<button type="button" onclick="location.href='test.jsp'">다시하기</button>
			</div>
			
            <div class="arrow_top">
            <c:choose>
            	<c:when test="${test.allScore < 20}">
            		<div id = "arrow1">
              			<img src="img/pngegg.png">            	
            		</div>
            	</c:when>
            	<c:when test="${40 > test.allScore}">
            		<div id = "arrow2">
              			<img src="img/pngegg.png">            	
            		</div>
            	</c:when>
            	<c:when test="${60 > test.allScore}">
            		<div id = "arrow3">
              			<img src="img/pngegg.png">            	
            		</div>
            	</c:when>
            	<c:when test="${80 > test.allScore}">
            		<div id = "arrow4">
              			<img src="img/pngegg.png">            	
            		</div>
            	</c:when>
            	<c:otherwise>
            		<div id = "arrow5">
              			<img src="img/pngegg.png">            	
            		</div>
            	</c:otherwise>
            </c:choose>
            </div>
            <div class="Tbtns">       
            	<div class="moveTopBtn"><button onclick="topFunction()" id="myBtn" title="Go to top"><img src="img/up-arrow.png" alt="맨 위로"></button></div>
        	</div> 
          </div>
          </div>
	<script src="script/chart10.js"></script>
	<script src="script/chart20.js"></script>
	<script src="script/chart30.js"></script>
	<script src="script/chart40.js"></script>
	<script src="script/chart50.js"></script>
	<script src="script/chart60.js"></script>
	<script src="script/chart70.js"></script>
	
    <script src="script/top.js"></script>
</body>
</html>