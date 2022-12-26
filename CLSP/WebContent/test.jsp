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
                      <a href="analytics.jsp">현황 분석</a></li>
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
       
       	<div class="title-wrap">
          <h2 class="title">자가 진단 테스트</h2>
      	</div>
       
       	<div id="q1">
        	<div class="question-wrap">
          		<h2>나이 대를 선택해주세요</h2>
          	</div>
          	<div class="answer-wrap">
          		<div class="answer">
          			<form name="form1" action="test1.jsp" method="post" id="form1">
          				10대<input type="radio" name="age" id="age_10" value="a10" required>
          				20대<input type="radio" name="age" id="age_20" value="a20" required>
          				30대<input type="radio" name="age" id="age_30" value="a30" required>
          				40대<input type="radio" name="age" id="age_40" value="a40" required>
          				50대<input type="radio" name="age" id="age_50" value="a50" required>
          				60대<input type="radio" name="age" id="age_60" value="a60" required>
          				70대 이상<input type="radio" name="age" id="age_70" value="a70" required>         
          			</form>
          		</div>
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
        		<h2>Q1. 아침을 먹나요?</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form2" action="#" method="post" id="form2">
        				매일 먹는다<input type="radio" name="breakfast" id="bfevery" value="everyday" required>
        				일주일에 3번 이상 <input type="radio" name="breakfast" id="bfsometime" value="sometime" required>
        				일주일에 2번 이하 <input type="radio" name="breakfast" id="bfno" value="nope" required>
        			</form>
        		</div>
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
        		<h2>Q2. 저녁을 8시 이후에 먹나요</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form3" action="#" method="post" id="form3">
        				네<input type="radio" name="dinner" id="dinneraf8" value="after8" required>
        				아니요<input type="radio" name="dinner" id="dinnerbef8" value="before8" required>
        			</form>
        		</div>
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
        		<h2>Q3. 야식을 즐겨먹는 편인가요?(일주일에 3번 이상)</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form4" action="#" method="post" id="form4">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q4. 5번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form5" action="#" method="post" id="form5">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q5. 6번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form6" action="#" method="post" id="form6">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q6. 7번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form7" action="#" method="post" id="form7">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q7. 8번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q8. 9번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q9. 10번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q10. 11번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q11. 12번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q12. 13번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q13. 14번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q14. 15번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q15. 16번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q16. 17번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q17. 18번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q18. 19번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q19. 20번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
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
        		<h2>Q20. 21번째 질문</h2>
        	</div>
        	<div class="answer-wrap">
        		<div class="answer">
        			<form name="form8" action="#" method="post" id="form8">
        				네<input type="radio" name="nightmeal" id="nmyes" value="nmyes" required>
        				아니요<input type="radio" name="nightmeal" id="nmno" value="nmno" required>
        			</form>
        		</div>
        	</div>
        	<div class="page">
				<p>21/21</p>
			</div>
        	<div class="bottom">
        		<div class="controller-wrap">
        			<button class="prev-btn" v-on:click="prev21">이전</button>
        			<button class="next-btn" v-on:click="next21">결과보기</button>
        		</div>
        	</div>
        </div>
       </div><%--#test --%>
      </div> 
       <script src="script/test.js"></script>    
</body>
</html>