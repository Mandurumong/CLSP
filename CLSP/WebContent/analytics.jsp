<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>성인병 위험도 측정과 예방법 제안 : 현황 분석</title>
    <link rel="stylesheet" href="css/analytics.css">
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
       <div id="main">
            <div id="banner">
                <h2>현황 분석</h2>
            </div>
            <div class="tabs">
            
              <input type="radio" name="tabmemu" id = "tab1" checked>
              <label for="tab1">질병에 대해서</label>
              <input type="radio" name="tabmemu" id ="tab2">
              <label for="tab2">10대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab3">
              <label for="tab3">20대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab4">
              <label for="tab4">30대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab5">
              <label for="tab5">40대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab6">
              <label for="tab6">50대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab7">
              <label for="tab7">60대 현황 분석</label>
              <input type="radio" name="tabmemu" id ="tab8">
              <label for="tab8">70대 이상 현황 분석</label>
                  
              <div class="tab-content" id="tab1">
                 <h2>당뇨병</h2>
                 
                 <div id = "index_LSD">
                 	<button type="button"><a href="#definition">당뇨병의 정의</a></button>
                 	<button type="button"><a href="#type">당뇨병의 유형</a></button>
                 	<button type="button"><a href="#increase">당뇨병의 유병률 현황</a></button>
                 	<button type="button"><a href="#cause">유병률 현황의 원인</a></button>
                 </div>
                 
                 <article id="definition">
                 <h4>01</h4>
                 <h3>당뇨병의 정의</h3>
                 <p>당뇨병은 소변으로 포도당이 배출된다고 하여 이름이 붙여진 병입니다.<br>
                 	탄수화물을 섭취하게 되면 위장관에서 소화효소에 의해 기본 구성성분인<br>
                 	 포도당으로 변한 다음 혈액으로 흡수됩니다.<br>
                 	여기에는 췌장에서 분비되는 '인슐린' 이라는 호르몬이 중요한 작용을 합니다.<br>
                 	이 때 인슐린이 모자르거나 제대로 일을 못 하는 상태가 되면 혈당이 상승하며,<br>
                 	 이로 인해 혈당이 지속적으로 높은 상태가 됩니다.<br>
                 	그렇게 되면 체내에 흡수된 포도당은 세포 속으로 들어가지 못하고<br>
                 	 혈액 속에서 쌓여 결국 소변으로 넘쳐 나오게 됩니다.<br>
                 	이러한 상태를 당요병이라고 합니다.</p>
                 </article>
                 
                 <article id="type">
                 <h4>02</h4>
                 <h3>당뇨병 유형</h3>
                 <img src="img/당뇨1,2형.png"> 
				 <p>1. 제 1형 당뇨병</p>
				 <p>제 1형 당뇨병은 췌창의 베타세포가 파괴되어 인슐린이 분비되지 않는 병입니다.<br>
				 	대부분 자기면역기전에 의해 발생하므로 베타세포를 포함하는<br>
				 	 췌도세포에 대한 특이 자가항체 검사가 양성으로 나오거나,<br>
				 	인슐린 분비 정도를 측정하면 진단이 가능합니다.<br>
				 	우리나라 당뇨병의 2% 미만을 차지합니다.<br>
				 	주로 사춘기나 유년기에 발생하며, 30세 전에 진단되는 경우가 많지만 성인에서도 나타날 수 있습니다.<br>
				 	제 1형 당뇨병은 인슐린이 전혀 분비되지 않기 때문에 외부에서 인슐린을 주입하는 치료가 필수적입니다.<br>
				 	인슐린 치료를 받지 않으면 고혈당이 악화되어 당뇨병 케톤산증을 동반한 급성 합병증이 나타날 수 있습니다.<br>
				 	고혈당으로 인한 급성 합병증은 초기에 적절히 치료하지 않으면 삼아까지 이어질 수 있습니다. <br>
				 	케톤산증의 병력이나 고혈당과 함께 혈액이나 소변에서 케톤이 검출되면<br>
				 	 제 1형 당뇨병을 의심하는 단서가 될 수 있습니다.
				 </p>
				 <p>2. 제 2형 당뇨병</p>
				 <p>제 2형 당뇨병은 몸의 인슐린 저항성이 커지면서 인슐린의 작용이 원활하지 않고<br>
				 	 상대적으로 인슐린 분비의 장애가 생겨 혈당이 올라가는 병입니다.<br>
				 	한국인 당뇨병의 대부분이 제 2형 당뇨병입니다.<br>
				 	 보통 40세 이상에서 발생하지만 그보다 젊은 연령에서도 생길 수 있으며,<br>
				 	 최근에는 30세 이하의 젊은 제 2형 당뇨병 환자가 늘고 있습니다.<br>
				 	제 2형 당뇨병 환자는 유전적 성향이 강하고, 제 1형 당뇨병과 달리 가족력이 흔합니다.<br>
				 	주요 발생 기전인 인슐린 저항성 증가와 상대적 인슐린 결핍에는 유전적 요인과<br>
				 	정신적 요인, 잘못된 생활습관에서 기인한 비만 등 환경적 요인이 복합적으로 작용합니다.
				 </p>
				 </article>
				 
				 <article class="increase">
                 <h4>03</h4>
                 <h3>당뇨병 유병률 현황</h3>
                 <p>r 데이터 가져오기</p>
                 </article>
                 
                 <article class="cause">
                 <h4>04</h4>
                 <h3>원인</h3>
                 </article>
                 
              </div>
              <div class="tab-content" id="tab2">
                  <h2>당뇨병 유병자 10대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
              </div>
                <div class="tab-content" id="tab3">
                  <h2>당뇨병 유병자 20대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
                <div class="tab-content" id="tab4">
                  <h2>당뇨병 유병자 30대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
                <div class="tab-content" id="tab5">
                   <h2>당뇨병 유병자 40대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
                <div class="tab-content" id="tab6">
                  <h2>당뇨병 유병자 50대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
                <div class="tab-content" id="tab7">
                  <h2>당뇨병 유병자 60대 현황 분석</h2>
                  <article class="increase">
                  	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
                <div class="tab-content" id="tab8">
                  <h2>당뇨병 유병자 70대 이상 현황 분석</h2>
                  <article class="increase">
                 	<h4>01</h4>
                  	<h3>당뇨병 유병률 현황</h3>
                  </article>
                  <article class="cause">
                  	<h4>02</h4>
                  	<h3>원인</h3>
                  </article>
                </div>
              </div>
            </div>
        </div>
    </div>
    
      <div class="Rbtns">
        <div class="rinkToTest"><a href="selfTestM.jsp"><img src="img/check-list.png" alt="진단 하러 가기"><span>진단<br> 하러가기</span></a></div>
      </div>
      <div class="Tbtns">       
        <div class="moveTopBtn"><button onclick="topFunction()" id="myBtn" title="Go to top"><img src="img/up-arrow.png" alt="맨 위로"></button></div>
      </div>        
</div>
    
</div>
<script src="script/top.js"></script>
</body>
</html>