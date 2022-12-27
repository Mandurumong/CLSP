<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
                    <img src="#" alt="logo">
                    </a>
                </div>

                <div id="top-nav">
                    <button name="login"><a href="login.jsp">로그인</a></button>
                    <button name="register"><a href="register.jsp">회원가입</a></button>
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
       
       <div id="test">
        <form name="form1" action="#" method="post" id="form1">
       	<div class="title-wrap">
          <h2 class="title">자가 진단 테스트</h2>
      	</div>
       
       	<div id="q1">
        	<div class="question-wrap">
          		<h2>나이 대를 선택해주세요</h2>
          	</div>
          	<div class="answer-wrap">
          		<div class="answer">
          				10대<input type="radio" name="age" id="age_10" value="a10" required>
          				20대<input type="radio" name="age" id="age_20" value="a20" required>
          				30대<input type="radio" name="age" id="age_30" value="a30" required>
          				40대<input type="radio" name="age" id="age_40" value="a40" required>
          				50대<input type="radio" name="age" id="age_50" value="a50" required>
          				60대<input type="radio" name="age" id="age_60" value="a60" required>
          				70대 이상<input type="radio" name="age" id="age_70" value="a70" required>         
          		</div>
			</div>
			<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="meal-breakfast" id="mbfyes" value="mbfyes" required>
        				아니요<input type="radio" name="meal-breakfast" id="mbfno" value="mbfno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="meal-8" id="maf8" value="maf8" required>
        				아니요<input type="radio" name="meal-8" id="mbef8" value="mbef8" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="meal-oily" id="moyes" value="moyes" required>
        				아니요<input type="radio" name="meal-oily" id="mono" value="mono" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="meal-regular" id="mryes" value="mryes" required>
        				아니요<input type="radio" name="meal-regular" id="mrno" value="mrno" required>
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
        				네<input type="radio" name="meal-speed" id="mfyes" value="mfyes" required>
        				아니요<input type="radio" name="meal-speed" id="mfno" value="mfno" required>
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
        				네<input type="radio" name="meal-snack" id="msyes" value="msyes" required>
        				아니요<input type="radio" name="meal-snack" id="msno" value="msno" required>
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
        				네<input type="radio" name="meal-alcohol" id="mayes" value="mayes" required>
        				아니요<input type="radio" name="meal-alcohol" id="mano" value="mano" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        		<h2>Q8. 배달 음식을 자주 먹나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        				네<input type="radio" name="meal-deli" id="mdyes" value="mdyes" required>
        				아니요<input type="radio" name="meal-deli" id="mdno" value="mdno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="life-after1" id="layes" value="layes" required>
        				아니요<input type="radio" name="life-after1" id="lano" value="lano" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="life-sleept" id="lsyes" value="lsyes" required>
        				아니요<input type="radio" name="life-sleept" id="lsno" value="lsno" required>
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
        				네<input type="radio" name="life-night" id="lnyes" value="lnyes" required>
        				아니요<input type="radio" name="life-night" id="lnno" value="lnno" required>
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
        				네<input type="radio" name="life-brush" id="lbyes" value="lbyes" required>
        				아니요<input type="radio" name="life-brush" id="lbno" value="lbno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="life-smoke" id="lskyes" value="lskyes" required>
        				아니요<input type="radio" name="life-smoke" id="lskno" value="lskno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="exercise-regular" id="exryes" value="exryes" required>
        				아니요<input type="radio" name="exercise-regular" id="exrno" value="exrno" required>
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
        				네<input type="radio" name="exercise-30" id="ex30yes" value="ex30yes" required>
        				아니요<input type="radio" name="exercise-30" id="ex30no" value="ex30no" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="exercise-st" id="exsyes" value="exsyes" required>
        				아니요<input type="radio" name="exercise-st" id="exsno" value="exsno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
        				네<input type="radio" name="etc-blood" id="ebyes" value="ebyes" required>
        				아니요<input type="radio" name="etc-blood" id="ebno" value="ebno" required>
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
        				네<input type="radio" name="etc-stress" id="esyes" value="esyes" required>
        				아니요<input type="radio" name="etc-stress" id="esno" value="esno" required>
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
        				네<input type="radio" name="etc-insulin" id="eiyes" value="eiyes" required>
        				아니요<input type="radio" name="etc-insulin" id="eino" value="eino" required>
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
        				네<input type="radio" name="etc-fat" id="efyes" value="efyes" required>
        				아니요<input type="radio" name="etc-fat" id="efno" value="efno" required>
        		</div>
        	</div>
        	<div class="test-image">
        		<img src="#">
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
       </div><%--#test --%>
      </div> 
       <script src="script/test.js"></script>    
</body>
</html>