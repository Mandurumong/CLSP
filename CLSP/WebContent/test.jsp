<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	int user_level = (Integer)session.getAttribute("user_level");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>성인병 위험도 측정과 예방법 제안 : 자기진단</title>
    <link rel="stylesheet" href="css/test.css">
       <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
       <script src="script/jquery-3.6.3.min.js"></script>
</head>
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
                	<c:when test="${user_level == 1 }">
                	<button name="logout"><a href='<c:url value="logout.do"/>'>로그아웃</a></button>
                	<button name="logout"><a href='<c:url value=""/>'>관리자페이지</button>
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
       
       <div id="test">
        <form name="form1" action="test.do" method="post" id="form1">
       	<div class="title-wrap">
          <h2 class="title">자가 진단 테스트</h2>
      	</div>
       
       	<div id="q1">
        	<div class="question-wrap">
          		<h2>나이 대를 선택해주세요</h2>
          	</div>
          	<div class="answer-wrap">
          		<div class="answer">
          				10대<input type="radio" name="age" value="10" required>
          				20대<input type="radio" name="age" value="20" required>
          				30대<input type="radio" name="age" value="30" required>
          				40대<input type="radio" name="age" value="40" required>
          				50대<input type="radio" name="age" value="50" required>
          				60대<input type="radio" name="age" value="60" required>
          				70대 이상<input type="radio" name="age" value="70" required>         
          		</div>
			</div>
			<div class="test-image">
        		<img src="img/age.jpg">
        	</div>
			<div class="page">
				<p>1/21</p>
			</div>
			<div class="bottom">
				<div class="controller-wrap">
					<button class="prev-btn" v-on:click="prev1">이전</button>
					<button class="next-btn" v-on:click="next1">다음</button>
				</div>
			</div>			
        </div>
        
        <div id="q2">
        	<div class="question-wrap">
        		<h2>Q1. 아침을 먹나요?<br>(일주일에 4번 이상)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-breakfast" value="eatBreakfast_yes" required>
        				아니요<input type="radio" name="meal-breakfast" value="eatBreakfast_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/breakfast.jpg">
        	</div>
        	<div class="page">
				<p>2/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
					<button class="prev-btn" v-on:click="prev2">이전</button>
					<button class="next-btn" v-on:click="next2">다음</button>
				</div>
        	</div>       
        </div>
        
        <div id="q3">
        	<div class="question-wrap">
        		<h2>Q2. 8시 이후에 음식을 먹나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-8" value="eatMealAfter8_yes" required>
        				아니요<input type="radio" name="meal-8"  value="eatMealAfter8_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/latenightsnack.jpg">
        	</div>
        	<div class="page">
				<p>3/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev3">이전</button>
        			<button class="next-btn" v-on:click="next3">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q4">
        <div class="question-wrap">
        		<h2>Q3. 짜고 기름진 음식을 주로 먹나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-oily" value="eatOily_yes" required>
        				아니요<input type="radio" name="meal-oily" value="eatOily_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/oilyfood.jpg">
        	</div>
        	<div class="page">
				<p>4/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev4">이전</button>
        			<button class="next-btn" v-on:click="next4">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q5">
        <div class="question-wrap">
        		<h2>Q4. 식사를 규칙적으로 하는 편인가요?<br>(매 비슷한 시간에 식사를 한다)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-regular" value="eatRegular_yes" required>
        				아니요<input type="radio" name="meal-regular" value="eatRegular_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>5/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev5">이전</button>
        			<button class="next-btn" v-on:click="next5">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q6">
        <div class="question-wrap">
        		<h2>Q5. 식사 시간이 짧은 편인가요?<br>(10분 이내)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-speed" value="eatSpeedFast_yes" required>
        				아니요<input type="radio" name="meal-speed" value="eatSpeedFast_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>6/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev6">이전</button>
        			<button class="next-btn" v-on:click="next6">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q7">
        <div class="question-wrap">
        		<h2>Q6. 식사 후 디저트를 드시나요?<br>(단 음료, 과자 등)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-snack" value="eatSnack_yes" required>
        				아니요<input type="radio" name="meal-snack" value="eatSnack_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>7/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev7">이전</button>
        			<button class="next-btn" v-on:click="next7">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q8">
        <div class="question-wrap">
        		<h2>Q7. 술을 자주 마시나요?<br>(일주일에 3회 이상)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-alcohol" value="drinkAlcohol_yes" required>
        				아니요<input type="radio" name="meal-alcohol" value="drinkAlcohol_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/drink.jpg">
        	</div>
        	<div class="page">
				<p>8/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev8">이전</button>
        			<button class="next-btn" v-on:click="next8">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q9">
        <div class="question-wrap">
        		<h2>Q8. 배달 음식을 자주 시켜 먹거나 외식을 자주 하나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-deli" value="deliver_yes" required>
        				아니요<input type="radio" name="meal-deli" value="deliver_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/deliver.jpg">
        	</div>
        	<div class="page">
				<p>9/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev9">이전</button>
        			<button class="next-btn" v-on:click="next9">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q10">
        <div class="question-wrap">
        		<h2>Q9. 새벽 1시 이후에 주무시나요?<br>(일주일에 3회 이상)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="life-after1" value="sleepAfter1_yes" required>
        				아니요<input type="radio" name="life-after1" value="sleepAfter_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/sleepafter1.jpg">
        	</div>
        	<div class="page">
				<p>10/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev10">이전</button>
        			<button class="next-btn" v-on:click="next10">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q11">
        <div class="question-wrap">
        		<h2>Q10. 잠을 6시간 이하로 주무시나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="life-sleept" value="sleepLess6_yes" required>
        				아니요<input type="radio" name="life-sleept" value="sleepLess6_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>11/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev11">이전</button>
        			<button class="next-btn" v-on:click="next11">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q12">
        <div class="question-wrap">
        		<h2>Q11. 밤에 불을 켜고 주무시나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="life-night" value="lightOn_yes" required>
        				아니요<input type="radio" name="life-night" value="lightOn_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>12/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev12">이전</button>
        			<button class="next-btn" v-on:click="next12">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q13">
        <div class="question-wrap">
        		<h2>Q12. 하루에 3회 이상으로 양치를 하시나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="life-brush" value="brush3_yes" required>
        				아니요<input type="radio" name="life-brush" value="brush3_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/brush.jpg">
        	</div>
        	<div class="page">
				<p>13/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev13">이전</button>
        			<button class="next-btn" v-on:click="next13">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q14">
        <div class="question-wrap">
        		<h2>Q13. 담배를 피우시나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="life-smoke" value="smoke_yes" required>
        				아니요<input type="radio" name="life-smoke" value="smoke_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/smoke.jpg">
        	</div>
        	<div class="page">
				<p>14/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev14">이전</button>
        			<button class="next-btn" v-on:click="next14">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q15">
        <div class="question-wrap">
        		<h2>Q14. 규칙적으로 운동을 하시나요?<br>(일주일 5회 이상)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="exercise-regular" value="exerciseRegular_yes" required>
        				아니요<input type="radio" name="exercise-regular" value="exerciseRegular_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>15/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev15">이전</button>
        			<button class="next-btn" v-on:click="next15">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q16">
        <div class="question-wrap">
        		<h2>Q15. 하루에 30분 이상 운동을 하나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="exercise-30" value="exercise30_yes" required>
        				아니요<input type="radio" name="exercise-30" value="exercise30_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/exercising.jpg">
        	</div>
        	<div class="page">
				<p>16/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev16">이전</button>
        			<button class="next-btn" v-on:click="next16">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q17">
        <div class="question-wrap">
        		<h2>Q16. 오래 앉아 있을 때 스트레칭을 하시나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="exercise-st" value="stretching_yes" required>
        				아니요<input type="radio" name="exercise-st" value="stretching_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/streching.jpg">
        	</div>
        	<div class="page">
				<p>17/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev17">이전</button>
        			<button class="next-btn" v-on:click="next17">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q18">
        <div class="question-wrap">
        		<h2>Q17. 가족중에 당뇨병을 가진 사람이 있나요?<br>(2형 당뇨)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="etc-inheritance" value="inheritance_yes" required>
        				아니요<input type="radio" name="etc-inheritance" value="inheritance_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>18/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev18">이전</button>
        			<button class="next-btn" v-on:click="next18">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q19">
        <div class="question-wrap">
        		<h2>Q18. 스트레스 받는 일이 많으신가요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="etc-stress" value="stress_yes" required>
        				아니요<input type="radio" name="etc-stress" value="stress_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>19/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev19">이전</button>
        			<button class="next-btn" v-on:click="next19">다음</button>
        		</div>
        	</div>
        </div>
        
        <div id="q20">
        <div class="question-wrap">
        		<h2>Q19. 인슐린 저항성이 있으신가요?<br>(다낭성 증후군, 흑생가지세포종 등)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="etc-insulin" value="insulinx_yes" required>
        				아니요<input type="radio" name="etc-insulin" value="insulinx_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
        	</div>
        	<div class="page">
				<p>20/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev20">이전</button>
        			<button class="next-btn" v-on:click="next20">다음</button>
        		</div>
        	</div>
        </div>
        <div id="q21">
        <div class="question-wrap">
        		<h2>Q20. 비만 이신가요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="etc-fat" value="fat_yes" required>
        				아니요<input type="radio" name="etc-fat" value="fat_no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="img/fat.jpg">
        	</div>
        	<div class="page">
				<p>21/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev21">이전</button>
        			<button class="next-btn" Onclick="fn_test()">결과보기</button>
        		</div>
        	</div>
        </div>
        </form>
       </div>
      </div> 
       <script src="script/test.js"></script>    
</body>
</html>