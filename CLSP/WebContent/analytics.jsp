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
                 <img src="img/당뇨1,2형.png">
                  
              </div>
              <div class="tab-content" id="tab2">
                  <h2>당뇨병 유병자 10대 현황 분석</h2>
              </div>
                <div class="tab-content" id="tab3">
                  <h2>당뇨병 유병자 20대 현황 분석</h2>
                </div>
                <div class="tab-content" id="tab4">
                  <h2>당뇨병 유병자 30대 현황 분석</h2>
                </div>
                <div class="tab-content" id="tab5">
                   <h2>당뇨병 유병자 40대 현황 분석</h2>
                </div>
                <div class="tab-content" id="tab6">
                  <h2>당뇨병 유병자 50대 현황 분석</h2>
                </div>
                <div class="tab-content" id="tab7">
                  <h2>당뇨병 유병자 60대 현황 분석</h2>
                </div>
                <div class="tab-content" id="tab8">
                  <h2>당뇨병 유병자 70대 이상 현황 분석</h2>
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