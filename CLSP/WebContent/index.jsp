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
<title>성인병 위험도 측정과 예방법 제안 </title>
<link rel="stylesheet" href="css/index.css">
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
            <div class="slidebox">
                <input type="radio" name="slide" id="slide01" checked>
                <input type="radio" name="slide" id="slide02">
                <input type="radio" name="slide" id="slide03">
                <input type="radio" name="slide" id="slide04">

                <ul class="slidelist">
                    <li class="slideitem">
                        <a href="#service_info"><img src="img/캐러셀1.png"></a>
                    </li>
                    <li class="slideitem">
                        <a href="analytics.do"><img src="img/현황분석캐러셀.png"></a>
                    </li>
                    <li class="slideitem">
                        <a href="#"><img src="img/예방법캐러셀.png"></a>
                    </li>
                    <li class="slideitem">
                        <a href="selfTestM.jsp"><img src="img/자가진단캐러셀.png"></a>
                    </li>   
                </ul>

                <div class="slide-control">
                    <div class="control01">
                        <label for="slide04" class="prev"></label>
                        <label for="slide02" class="next"></label>
                    </div>
                    <div class="control02">
                        <label for="slide01" class="prev"></label>
                        <label for="slide03" class="next"></label>
                    </div>
                    <div class="control03">
                        <label for="slide02" class="prev"></label>
                        <label for="slide04" class="next"></label>
                    </div>
                    <div class="control04">
                        <label for="slide03" class="prev"></label>
                        <label for="slide01" class="next"></label>
                    </div>
                </div>
            </div>
            

        <div id="service_info">
            <section class="m-info">
                <h3>01</h3>
                <h2>홈페이지의 소개</h2>
                <br>
                <img src="img/introduce.jpg">
                <p>
                    <br>
                    <br>
                   이 홈페이지는 빅데이터 분석을 통한<br>
                    성인병 위험도 측정과 예방법을 제안해 주는 홈페이지 입니다.<br><br>
                    데이터에 올라와 있는 성인병 유병률을<br>
                    나이대와 성별 등으로 분석하고<br><br>
                    분석된 데이터를 통해 사용자의 데이터와 비교하여 <br> 
                    질병 발생 예측 위험도와 질병에 걸릴 확률,<br>
                     사용자에게 맞는 예방법을 제시해 줍니다.
                </p>
            </section>
        </div>

        <div id="service_function">
            <section class="m-function">
                <h3>02</h3>
                <h2>페이지 이용 안내</h2>
                    <div class="flex-container">
                        
                        <div class="flex-item">
                            <div class="item-icon-wrapper">
                                <a href="analytics.do"><img src="img/analytics.png"></a>
                            </div>
                            <div class="subtitle">현황 분석</div>
                            <div class="body">
                                빅데이터를 분석하여
                                <br>
                                나이대 별로 전체, 성별 별 현황을<br>
                                볼 수 있어요
                            </div>
                        </div>

                        <div class="flex-item">
                            <div class="item-icon-wrapper">
                                <a href="selfTestM.jsp"><img src="img/blog.png"></a>
                            </div>
                            <div class="subtitle">자가 진단</div>
                            <div class="body">
                                입력한 데이터를 분석하여<br> 같은 나이 대의 데이터와<br>
                                위험도와 발병률을 볼 수 있고<br> 예방법을 제시 받을 수 있어요
                            </div>
                        </div>

                        <div class="flex-item">
                            <div class="item-icon-wrapper">
                                <a href="#"><img src="img/glove.png"></a>
                            </div>
                            <div class="subtitle">예방법</div>
                            <div class="body">
                                	자가 진단을 하지 않아도<br> 예방법을 확인 할 수 있어요<br>
                               		크게 식습관, 생활습관,<br> 운동, 기타로 나누어져 있어요
                            </div>
                        </div>
                    </div>
            </section>            
        </div>
        <div id="degreeOfRisk">
            <h3>03</h3>
            <h2>위험도 설명</h2>
            <!-- <img src="img/위험도그래프.png"> -->
            <div class="graph">
                		<ul>
                  			<li>양호</li>
                  			<li>관심</li>
                  			<li>주의</li>
                  			<li>경고</li>
                  			<li>위험</li>
                		</ul>
 	        </div>
            <div id="text">
                <p>위험도는 질병발생 예측건수를 위험도 모델에 적용하여 양호, 관심, 주의, 경고 , 위험 5단계로 이루어져 있습니다.<br><br>
                	발병률에 따라<br><br>
                 0~20%면 양호 단계,<br>
                20~40%면 관심 단계,<br>
                40~60%면 주의 단계,<br>
                60~80%면 경고 단계,<br>
                80~100%면 위험 단계 <br><br>
                	로 나눠집니다.
                </p>
                
            </div>

        </div>
        <div class="Tbtns">       
            <div class="moveTopBtn"><button onclick="topFunction()" id="myBtn" title="Go to top"><img src="img/up-arrow.png" alt="맨 위로"></button></div>
          </div>      
    </div>
        
    </div>
    <script src="script/top.js"></script>
</body>
</html>