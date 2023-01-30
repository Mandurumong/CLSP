<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.project.clsp.model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	int user_level = (Integer)session.getAttribute("user_level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>결과보기</title>
    <link rel="stylesheet" href="css/testResult.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style>
  .pie-chart1{
  display:inline-block;
  width: 200px;
  height: 200px;
  background: conic-gradient(
  #A5C2E3 0% ${test.eatingHabits * 100 / test.allScore}%, 
  #EA3323 ${(test.eatingHabits * 100 / test.allScore)}% ${(test.eatingHabits * 100 / test.allScore) + (test.lifeHabits * 100 / test.allScore)}%, 
  #F9DA78 ${(test.eatingHabits * 100 / test.allScore) + (test.lifeHabits * 100 / test.allScore) }% ${(test.eatingHabits * 100 / test.allScore) + (test.lifeHabits * 100 / test.allScore) + (test.exercise * 100 / test.allScore)}%, 
  #B1D095 ${(test.eatingHabits * 100 / test.allScore) + (test.lifeHabits * 100 / test.allScore) + (test.exercise * 100 / test.allScore)}% 100%);
  border-radius: 50%;
  }
</style>
</head>
<body>
<body>
  <body class="body-set">
    <div id="container">
        <header>
            <div class="header">
                <div id="logo">
                    <a href="/" class="logo">
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
                		<button name="logout"><a href='<c:url value="logout.do"/>'>로그아웃</a></button>
                		<button name="logout"><a href='<c:url value="/admin_page"/>'>관리자페이지</button>
                	</c:when>
                	<c:otherwise>
                		<button name="logout"><a href='<c:url value="logout.do" />'>로그아웃</a></button>
                  		<button name="mypage"><a href='<c:url value="/mypage_info" />'>마이페이지</a></button>
                	</c:otherwise>
                	</c:choose>    
                </div>

            </div>

            <nav>
                <ul class="menu">
                    <li>
                      <a href="/">홈</a></li>
                    <li>
                      <a href="analytics.do">현황 분석</a></li>
                    <li>
                      <a href="/selfTestM">자가 진단</a>
                    </li>
                    <li><a href="#">예방법</a>
                    <li><a href="/community_freeBoard">게시판</a>
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
                	     <p><span><%=user_id %></span> 님의 결과</p>
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
                		이며 당뇨 발병 확률은 <span>${test.allScore} %</span> 입니다.</p>	                	
                	</c:when>
                	
                	<c:otherwise>
                	
                		<p><span><%=user_id %></span> 님의 당뇨 위험도는 
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
                		이며 당뇨 발병 확률은 <span>${test.allScore} %</span> 입니다.</p>
                	</c:otherwise>
                </c:choose>
              </div>  <!-- user_result -->
            </div> <!-- top_user -->
            
            <c:choose>
            	<c:when test="${test.age == 70 }">
            		<h5 class="same_age">같은 ${test.age} 대 이상의 통계</h5>            
            	</c:when>
            	<c:otherwise>
            		<h5 class="same_age">같은 ${test.age} 대의 통계</h5> 
            	</c:otherwise>
            </c:choose>
            <div class="foto">
            	<h3>전체 비율</h3>
            	<c:choose>
            		<c:when test="${test.age == 10 }">
            			<canvas id="Chart10" width="800" height="330"></canvas>
						<canvas id="Chart_gender10" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 20 }">
            		    <canvas id="Chart20" width="800" height="330"></canvas>
                  		<canvas id="Chart_gender20" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 30 }">
            			<canvas id = "Chart30" width = "800" height="330"></canvas>
            			<canvas id = "Chart_gender30" width="800" height="350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 40 }">
            			<canvas id ="Chart40" width = "800" height="330"></canvas>
            			<canvas id = "Chart_gender40" width="800" height = "350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 50 }">
            		    <canvas id ="Chart50" width = "800" height="330"></canvas>
            			<canvas id = "Chart_gender50" width="800" height = "350"></canvas>
            		</c:when>
            		<c:when test="${test.age == 60 }">
            		    <canvas id ="Chart60" width = "800" height="330"></canvas>
            			<canvas id = "Chart_gender60" width="800" height = "350"></canvas>
            		</c:when>
            		<c:otherwise>
            		    <canvas id ="Chart70" width = "800" height="330"></canvas>
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
                  <li>식습관 <fmt:formatNumber value="${test.eatingHabits * 100 / test.allScore}" pattern="0.0"/>%</li>
                  <li>생활습관 <fmt:formatNumber value="${test.lifeHabits * 100 / test.allScore}" pattern="0.0"/>%</li>
                </ul> 
                <ul class="sec_cause">
                  <li>운동 <fmt:formatNumber value="${test.exercise * 100 / test.allScore}" pattern="0.0"/>%</li>
                  <li>기타 <fmt:formatNumber value="${test.etc * 100 / test.allScore}" pattern="0.0"/>%</li>
                </ul>
                             
                <c:choose>
                	<c:when test="${user_id == null }">
                		<p class="border_main"><span>사용자</span> 님의 주요 위험 요인은 
                		<c:choose>
                			<c:when test="${ test.eatingHabits >= test.lifeHabits && test.eatingHabits >= test.exercise && test.eatingHabits >= test.etc}">               			
                				<span>식습관</span>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.lifeHabits }">
                						<span1>, 생활습관</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.exercise }">
                						<span1>, 운동</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.etc }">
                						<span1>, 기타</span1> 
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:when test="${ test.lifeHabits > test.eatingHabits && test.lifeHabits >= test.exercise && test.lifeHabits >= test.etc}">
                				<span>생활습관</span>
                				<c:choose>
                					<c:when test="${test.lifeHabits == test.exercise }">
                						<span1>, 운동</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.lifeHabits == test.etc }">
                						<span1>, 기타</span1>
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:when test="${ test.exercise > test.eatingHabits && test.exercise > test.lifeHabits && test.exercise >= test.etc}">
                				<span>운동</span>
                				<c:choose>
                					<c:when test="${test.exercise == test.etc }">
                						<span1>, 기타</span1>
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:otherwise>
                				<span> 기타 </span>
                			</c:otherwise>
                		</c:choose>
                		입니다.</p>
                	</c:when>
                	
                	<c:otherwise>
                		<p class="border_main"><span><%=user_id %></span> 님의 주요 위험 요인은 
                		<c:choose>
                			<c:when test="${ test.eatingHabits >= test.lifeHabits && test.eatingHabits >= test.exercise && test.eatingHabits >= test.etc}">               			
                				<span>식습관</span>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.lifeHabits }">
                						<span1>, 생활습관</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.exercise }">
                						<span1>, 운동</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.eatingHabits == test.etc }">
                						<span1>, 기타</span1> 
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:when test="${ test.lifeHabits > test.eatingHabits && test.lifeHabits >= test.exercise && test.lifeHabits >= test.etc}">
                				<span>생활습관</span>
                				<c:choose>
                					<c:when test="${test.lifeHabits == test.exercise }">
                						<span1>, 운동</span1>
                					</c:when>
                				</c:choose>
                				<c:choose>
                					<c:when test="${test.lifeHabits == test.etc }">
                						<span1>, 기타</span1>
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:when test="${ test.exercise > test.eatingHabits && test.exercise > test.lifeHabits && test.exercise >= test.etc}">
                				<span>운동</span>
                				<c:choose>
                					<c:when test="${test.exercise == test.etc }">
                						<span1>, 기타</span1>
                					</c:when>
                				</c:choose>
                			</c:when>
                			<c:otherwise>
                				<span> 기타 </span>
                			</c:otherwise>
                		</c:choose>
                		입니다.</p>
                	</c:otherwise>
                </c:choose>             
                <div class="more_info"><a href="#prevention">제안 예방법 보기</a></div>
              </div>
            </div>
            
<!-- 이동을 위한 div -->
			
			<div id = "prevention"></div>
            
<!-- 제안 예방법 보기 --> 

            <div class="method_pr">
              <h5 class="same_age">제안 예방법</h5> 
              <c:choose>
              <c:when test="${test.allScore >= 15 &&(test.eatingHabits >= 15 || test.lifeHabits >= 15 || test.exercise >= 15 || test.etc >= 15)}">
              
              <c:choose>
				<c:when test="${test.eatingHabits >= 15}">
					<p>·식습관 개선하기</p>
					<div class ="Sprevention">
						<c:choose>
							<c:when test="${ test.breakfast == 'eatBreakfast_no'}">
							<div class="prevention-content">
                				<h5>아침 식사 하기</h5>
                				<p>최근 연구 결과에 따르면 아침 8시 30분 이전에 아침 식사를 하면 제 2형 당뇨병에 걸릴 위험이 낮아진다는 사실이 밝혀졌습니다.
                			     	아침을 먹게 되면 갑작스런 혈당 상승을 억제 할 수 있고 음식을 처리하는 능력이 아침에 더 효과적으로 작용하기 때문에 아침 식사를 하는것이 권장 됩니다.
                				</p>
                				<ul class="no_1">
                  					<li>추천식단</li>
                  					<li><img src="">이미지</li>
                				</ul>
                			</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${ test.dinnerTime == 'eatMealAfter8_yes'}">
							<div class="prevention-content">
								<h5>늦은 시간에 섭취하지 않기</h5>
								<p>자기 직전에 음식을 섭취하게 되면 자는 동안 소화를 시키느라 인체 활성화가 되어 수명이 방해받게 되는데<br>
							 	질 좋은 잠을 자지 못하게 되면 뇌도 휴식을 취하지 못하고<br>
								포도당이 계속 생성이 되어 혈당 올라가 혈당조절에 문제가 생기게 됩니다.<br>
								또한 야식은 비만을 유발 할 수 있어서 더욱 당뇨관리에 힘들어질 수 있습니다.<br>
								<br><br>
								따라서 야식을 줄이는 것이 중요합니다.</p>
								<hr>
							</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${ test.mealRegular.equals('eatRegular_no')}">
								<div class="prevention-content">
									<h5>규칙적인 식사 하기</h5>
									<p></p>
								</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${test.mealSpeed.equals('eatSpeedFast_yes')}">
							<div class="prevention-content">
								<h5>식사 속도 늦추기</h5>
								<p>식사를 빠른 속도로 하게되면</p>
							</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${test.mealSnack.equals('eatSnack_yes') }">
							<div class="prevention-content">
								<h5>식사 후 간식 먹지 않기</h5>
								<p>식사 후 당분이 많이 들어간 간식을 섭취하게 되면 </p>
							</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${test.alcohol.equals('drinkAlcohol_yes')}">
							<div class="prevention-content">
								<h5>적당한 술만 섭취</h5>
								<p>술은 열량도 높고 술의 주 성분인 알코올은 혈당을 조절하는 인슐린 분비 기관인 췌장을 공격해 당뇨의 위험성을 높입니다.<br>
								또한 알코올은 간에서 해독장용을 하면서 간의 포도당 신생 작용을 방해하여 이 과정에서 저혈당이 생길 위험도 있습니다.<br>
								같이 먹는 안주 또한 고열량일 가능성이 높아 인슐린을 분비하게 되는데 알코올로 인해 포도당의 양이 줄어들어 혈당 수치가 낮아 졌다가 <br>
								안주로 인해 다시 올라가게 된다면 혈당 조절 시스템에 문제가 생길 수 있습니다.<br>
								<br><br>
								따라서 술은 가급적 적에 마시고 안주는 기름기와 탄수화물 함량이 높은 것을 피하고 단백질 위주의 음식을 먹는 것이 권장됩니다.</p>
							</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${test.mealdeli.equals('deliver_yes')}">
							<div class="prevention-content">
								<h5>배달 음식 줄이기</h5>
								<p>배달 음식의 경우 혈당이 높은 음식들이 많습니다. 예를 들어 피자, 햄버거 와 같은 음식들이 그렇습니다.
								또한 배달 음식들은 이미 조리가 된 채로 오는 경우가 대부분이기 때문에 안의 내용물을 바꿀 수 없어 혈당지수를 낮추는 것이 어렵습니다.
								<br><br>따라서 배달음식을 줄이는 것이 권장됩니다.</p>
								<ul class="no_2">
                  					<li>상황 상 배달음식을 줄이기 힘드시다면<br> 아래 가게들을 참조해보세요.<br></li>
                  					<li>나트륨 줄이기 실천 음식점</li>
                  					<li><br><img src="img/배달.png"></li>
                				</ul>
							</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
              		</div>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              
              <c:choose>
				<c:when test="${test.lifeHabits >= 15}">
					<p>·생활습관 개선하기</p>
					<div class ="Sprevention">
					<c:choose>
						<c:when test="${ test.after1.equals('spleepAfter1_yes')}">
						<div class="prevention-content">
							<h5>늦은 잠은 당뇨를 유발</h5>
							<p>잠을 늦게 잘 수록 뇌가 깨어있는 시간이 증가하게 되고</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.sleepTime.equals('sleepLess6_yes')}">
						<div class="prevention-content">
							<h5>충분한 잠은 중요</h5>
							<p>충분한 잠을 취해야 몸이 건강</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.light.equals('lightOn_yes')}">
						<div class="prevention-content">
							<h5>불 끄고 자기</h5>
							<p>불을 키고 자게 되면 질 좋은 숙면을 취할 수 없다는 연구 결과가 나왔습니다.</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.brush.equals('brush3_no')}">
						<div class="prevention-content">
							<h5>양치질 3회 이상 권장</h5>
							<p>양치질을 하루에 3번 이상하는 것을 추천드립니다.</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.smoke.equals('smoke_yes')}">
						<div class="prevention-content">
							<h5>담배는 만병의 근원</h5>
							<p>담배를 끊읍시다</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose> 
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              
              <c:choose>
				<c:when test="${test.exercise >= 15}">
					<p>·운동습관 개선하기</p>
					<div class ="Sprevention">
					<c:choose>
						<c:when test="${test.exerciseRegular.equals('exerciseRegular_no')}">
						<div class="prevention-content">
							<h5>규칙적인 운동은 중요!</h5>
							<p></p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.exercise30.equals('exercise30_no')}">
						<div class="prevention-content">
							<h5>하루에 30분 이상의 운동</h5>
							<p></p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.strech.equals('stretching_no')}">
						<div class="prevention-content">
							<h5>오래 앉아 있을 땐 스트레칭을!</h5>
							<p></p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              
              <c:choose>
				<c:when test="${test.etc >= 15}">
					<p>·기타습관 개선하기</p>
					<div class ="Sprevention">
					<c:choose>
						<c:when test="${test.inheritance.equals('inheritance_yes')}">
						<div class="prevention-content">
							<h5>유전적 요인은 후천성 요인보다 낮습니다.</h5>
							<p>당뇨의 경우 생활 습관 등 후천적 요인이 70%, 유전적 소인이 30% 정도 차지한다고 전문가 들은 말하고 있습니다.
							부모님 중 한분이 당뇨일 경우 약 30%, 두 분 다 당뇨 일 경우 약 50%의 유전율을 나타낸다고 합니다.
							그렇다고 부모님이 당뇨가 있다고 다 걸리는 것은 아닙니다. 후천적 요인이 70%나 되는 만큼
							관리를 잘한다면 당뇨에 걸리지 않을 수 있습니다.
							<br><br>
							관리를 위해서 생활 습관과 식습관, 운동 등을 개선할 필요가 있습니다.
							</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>	
					<c:choose>
						<c:when test="${test.stress.equals('stress_yes')}">
						<div class="prevention-content">
							<h5>스트레스는 만병의 근원</h5>
							<p></p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ test.insulin.equals('insulinx_yes')}">
						<div class="prevention-content">
							<h5>인슐린 저항성</h5>
							<p>인슐린 저항성이 있는 경우, 높은 확률로 당뇨에 걸릴 수 있습니다.
							당뇨병이 인슐린이 제대로 조절이 되지 않아서 생기는 병으로 인슐린 저항성을 가지고 있을 시, 
							당뇨 생길 가능성이 높으니 병원에서 검사를 해보는 걸 추천합니다.</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${test.fat.equals('fat_yes')}">
						<div class="prevention-content">
							<h5>비만은 성인병을 유발</h5>
							<p>비만의 경우 여러 합병증을 유발 할 수 있습니다. <br>
							과체중 또는 비만의 경우 세포 안에 지방이 쌓이고,<br>
							 지방세포에서 염증성 물질들이 만들어지고 분비되며,<br>
							  유리지방산이 증가하면서 인슐린 저항성이 생기게 됩니다.<br>
							  이렇게 되면 인슐린 분비 능력이 떨어져 혈당 조절에 이상이 생기게 되어 <br>
							  당뇨병에 걸리게 됩니다.<br><br>
							  따라서 체중조절이 필요합니다.</p>
						</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<div>
						<p>더 많은 예방법을 원하신다면
						<a href="#">-> 예방법 보러가기</a></p>
					</div>			
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
              </c:choose>
              </c:when>
              
              <c:otherwise>
              <div>
              	<p>전체적으로 점수가 낮은편으로, 잘 하고 계십니다!<br>
              	추천해 드릴 예방법이 없습니다.<br>
              	계속 이렇게 관리 해주세요.<br>
              	그래도 예방법이 궁금하시다면 
              	<a href="#">-> 예방법 보러가기</a>
              	</p>
              </div>
              </c:otherwise>
              </c:choose>
            </div> 
            
			<div class="retry">
				<button type="button" onclick="location.href='selfTestM'">다시하기</button>
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
	<script src="js/chart10.js"></script>
	<script src="js/chart20.js"></script>
	<script src="js/chart30.js"></script>
	<script src="js/chart40.js"></script>
	<script src="js/chart50.js"></script>
	<script src="js/chart60.js"></script>
	<script src="js/chart70.js"></script>
	
    <script src="js/top.js"></script>
</body>
</html>