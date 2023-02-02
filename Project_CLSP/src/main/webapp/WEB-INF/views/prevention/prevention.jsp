<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	int user_level = (Integer)session.getAttribute("user_level");
%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>예방법</title>
<link rel="stylesheet" href="css/prevention.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body class="body-set">
	<div id="container">
		<header>
			<div class="header">
				<div id="logo">
					<a href="<c:url value='/'/>" class="logo"> 
						<img src="#" alt="logo">
					</a>
				</div>

				<div id="top-nav">
                	<c:choose>
                		<c:when test="${user_id == null }">
                  			<button name="login"><a href='<c:url value="/login" />'>로그인</a></button>
                  			<button name="register"><a href='<c:url value="/register" />'>회원가입</a></button>
                		</c:when>
                		<c:when test="${user_level == 1 }">
                			<button name="logout"><a href='<c:url value="/logout.do"/>'>로그아웃</a></button>
                			<button name="logout"><a href='<c:url value="/admin_page"/>'>관리자페이지</button>
                		</c:when>
                		<c:otherwise>
                			<button name="logout"><a href='<c:url value="/logout.do" />'>로그아웃</a></button>
                  			<button name="mypage"><a href='<c:url value="/mypage_info" />'>마이페이지</a></button>
                		</c:otherwise>
                	</c:choose>    
                </div>

			</div>

			<nav>
				<ul class="menu">
					<li><a href="<c:url value='/index'/>">홈</a></li>
					<li><a href="analytics.do">현황 분석</a></li>
					<li><a href="/selfTestM">자가 진단</a></li>
					<li><a href="${path}/api/prevent">예방법</a>
					<li><a href="#">커뮤니티</a>
						<ul class="submenu">
							<li><a href="${path}/board/list">자유게시판</a></li>
						</ul></li>
				</ul>
			</nav>
		</header>

		<div id="main">
			<div id="banner">
				<h2>예방법</h2>
			</div>
			
			<div class="contents">
				<div class="all-tab">
					<ul>
						<li id="tab1" class="btnCon"><input type="radio"
							name="tabmenu" id="tabmenu1" checked> <label
							for="tabmenu1">식습관</label>
							<div class="tabCon" id="tabCon1">
								<div class="txtArea">
									<p>당뇨병 예방을 위한 식습관 교정은 단순히 어떤 음식을 줄이거나 제한하는 것이 아니라 건강한 식사를
										계획하고 실천하는 것입니다.</p>
									<h3 class="subTit_bl">
										<span>올바른 식습관의 필요성</span>
									</h3>
									<p>올바른 식습관으로 당뇨병을 예방하고, 좋은 영양 상태를 유지해야 합니다.</p>
									<div class="subList">
										<h2 class="subTit">식이요법을 잘 실천한다면</h2>
										<ul class="listNum">
											<li>1. 식사 · 운동 · 약물 요법이 균형을 이루어 혈당을 본인의 목표치와 유사하게 유지하고,
												혈중 지질 농도를 가능한 정상과 가까운 수준으로 유지할 수 있습니다.</li>
											<li>2. 식사요법의 준수를 통해 내게 맞는 표준체중을 유지할 수 있습니다.</li>
											<li>3. 당뇨병 합병증을 예방하고 치료하는데 도움이 됩니다.</li>
											<li>4. 다양한 식품을 골고루 섭취해 특정 영양소가 부족하거나 과다한 섭취로 인한 영양불균형
												상태를 예방 할 수 있습니다.</li>
										</ul>
									</div>
								</div>

								<div class="txtArea bg">
									<h3 class="subTit_bl">
										<span>식사요법의 기본원칙</span>
									</h3>
									<ul class="imgInfo">
										<li><img src="images/dietary01_01.png" alt=""> <span
											class="pointTit">일정한 시간에 알맞은 양의 음식을 규칙적으로 먹습니다. </span> <span
											class="info">적절한 열량섭취와 규칙적인 식사는 혈당조절에 도움이 됩니다.</span></li>
										<li><img src="images/dietary01_02.png" alt=""> <span
											class="pointTit">설탕이나 꿀 등 단순당의 섭취를 주의합니다. </span> <span
											class="info">단순당은 농축된 열량원으로 소화흡수가 빨라 급격한 혈당상승을 유발할 수
												있습니다.</span></li>
										<li><img src="images/dietary01_03.png" alt=""> <span
											class="pointTit">식이섬유소를 충분히 섭취합니다. </span> <span class="info">식이섬유소는
												완만한 혈당의 상승과 혈중지방의 농도를 조절하므로 혈당 조절 및 심뇌혈관계 질환의 예방에 도움이 됩니다.</span></li>
										<li><img src="images/dietary01_04.png" alt=""> <span
											class="pointTit">지방을 적절히 섭취하되 콜레스테롤의 섭취는 제한합니다. </span> <span
											class="info">동물성 단백질에 함유된 포화지방산과 콜레스테롤의 과다한 섭취는
												심뇌혈관계질환의 위험을 증가시킬 수 있으므로 가급적 섭취를 줄입니다.</span></li>
										<li><img src="images/dietary01_05.png" alt=""> <span
											class="pointTit">염분 섭취를 줄입니다. </span> <span class="info">과다한
												염분의 섭취는 혈압을 상승시킬 수 있으므로 싱겁게 먹는 습관을 갖도록 합니다.</span></li>
										<li><img src="images/dietary01_06.png" alt=""> <span
											class="pointTit">음주는 피하는 것이 좋습니다. </span> <span class="info">술은
												영양소가 포함되지 않으면서 열량을 많이 내므로 피하는 것이 좋습니다.</span></li>
									</ul>
								</div>

								<div class="bbs">
									<h3 class="subTit_bl">
										<span>추천 요리 레시피</span>
									</h3>
									<ul class="thumbList">
										<li><a href="images/recipe_spring7.jpg"> <span
												class="thumb"><img
													src="images/O76dMQTl3xrF4yk1uHoeW2bCwcgmiBVf.jpg"></span> <span
												class="tit"><span>죽순 양배추롤 전골</span></span>
										</a></li>
										<li><a
											href="images/recipe_spring6.jpg">
												<span class="thumb"><img
													src="images/sDjNLGfcVBaWe3tJhbnAguSdlqCzYI4U.jpg"></span> <span
												class="tit"><span>실곤약 고추 잡채</span></span>
										</a></li>
										<li><a
											href="images/recipe_spring5.jpg">
												<span class="thumb"><img
													src="images/3jWCPRUOfQMkcvdGJDKLSnlIoegzaxZN.jpg"></span> <span
												class="tit"><span>달래 소고기샐러드</span></span>
										</a></li>
										<li><a
											href="images/recipe_spring4.jpg">
												<span class="thumb"><img
													src="images/cazmvhOrg3JRGF9DkpufnyW6CTwLYNUS.jpg"></span> <span
												class="tit"><span>브로콜리 통마늘볶음</span></span>
										</a></li>

									</ul>

									<!-- //bbsUtil -->
								</div>

							</div></li>
						<li id="tab2" class="btnCon"><input type="radio"
							name="tabmenu" id="tabmenu2" checked> <label
							for="tabmenu2">운동</label>
							<div class="tabCon" id="tabCon2">
								<div class="txtAreaTab2">
									<h3 class="subTit_bl">
										<span>운동의 장점</span>
									</h3>
									<p>운동은 칼로리를 소모시켜 식사요법의 효과를 높이고 혈당을 떨어뜨려 장기적으로 성인병과 당뇨 합병증을
										예방하는데 도움이 됩니다.</p>

									<ul class="listNumTab2">
										<li>1. 당뇨병이 발생할 가능성이 높은 위험군에서 제 2형 당뇨병의 발생 빈도를 감소시키며 혈당의
											조절을 돕고, 제 1형 당뇨병에서 인슐린의 효능을 높여 인슐린의 필요량을 줄일 수 있습니다.</li>
										<li>2. 심혈관계 질환(동맥경화증: 심장병, 중풍)의 발생 위험이 감소됩니다. 이는 운동요법으로
											지질대사의 장애를 교정하고(저밀도지단백­콜레스테롤이 감소되고 고밀도지단백 콜레스테롤이 증가되며), 심근의
											혈류가 개선되고, 폐기능이 향상되며 동시에 고혈압도 개선됨에 따른 효과입니다.</li>
										<li>3. 비만형 인슐린의존형 당뇨병에서 체중감량을 위하여 식사요법의 보완수단으로도 운동은 큰 효과가
											있습니다.</li>
										<li>4. 운동으로 인한 말초조직에서의 인슐린 작용의 증가효과로 고혈당이 개선 될 뿐아니라 인슐린의
											요구량이나 경구 혈당 강하제의 요구량을 감소시킬 수 있습니다.</li>
										<li>5. 당뇨병환자에서 위축되기 쉬운 근력의 향상을 기대할 수 있습니다.</li>
										<li>6. 혈액의 점성도를 낮춰 혈액 순환이 잘되게 하며 혈소판의 기능에도 영향을 주어 혈전증의
											예방에도 도움이 됩니다.</li>
										<li>7. 정신적인 안정감, 불안감 해소, 숙면은 물론 현대인의 복잡한 사회생활에서 누적되기 쉬운
											스트레스의 해소에도 크게 도움이 되며, 생활에 활력을 얻고 기분이 상쾌하여 삶의 질을 높일 수 있습니다.</li>
									</ul>
								</div>
								 <div class="guide">
                                        <h3 class="subTit_bl"><span>시작하기 전</span></h3>
                                            <p class="guideTxt">
                                                운동을 시작하기 전에 먼저 생각해야 할 것은 이 운동이 생활의 리듬을 너무 망가뜨려서는 안된다는 것이며, 쉽게 할 수 있어야 하고, 꾸준히 할 수 있어야 하며, 좀더 바란다면 그 운동이 재미있는 것이면 더욱 좋겠습니다. 쉽게 할 수 있는 운동으로는 가벼운 차림으로 집 주위 혹은 직장주위를 대략 15∼20분 걷는 것을 들 수 있습니다. 또 운동을 처음 시작하는 것이라면 오늘은 단 5분간 만이라도 좋습니다. 일단 짧은 시간이라도 시작을 하고 매일매일 혹은 차츰 시간을 조금씩 늘려 나가야합니다. 절대로 욕심을 내어서 처음부터 무리하게 운동을 하지 않는 것이 좋습니다. 안 쓰던 근육을 갑자기 많이 쓰게 되면 근육에 무리가 와서 통증이 생기며, 이렇게 되면 이 또한 스트레스로 작용하여 혈당조절에 나쁜 영향을 미치게 됩니다. 나이가 드신 당뇨인의 경우에는 골관절 질환으로 인하여 보행이 불편한 경우도 있는데, 이런 경우 무조건 걷는 운동만을 고집한다면 결국 운동을 못하도록 만드는 것과 같습니다. 따라서 이런 경우에는 가벼운 맨손체조라도 시작하는 것이 좋습니다.
                                            </p>
                                    </div>
								<div class="videoArea">
									<h3 class="subTit_bl">
										<span>추천 운동 영상</span>
									</h3>
									<div id="videoSemiList">
										<c:forEach var="v" items="${list}">
											<div class="mycell">
												<div class="card">
													<div class="videoLink">
														<video src="${v.FILEURL}${v.FILENM}" width="300"
															height="170"></video>
													</div>
													<div class="videoSemiListTitle">
														<a href="/clsp/api/video?num=${v.ROW_NUM}">
															<h2 class="h2Title">${v.TNM}</h2>
														</a>
													</div>
												</div>
											</div>
										</c:forEach>
									<div id="listMorebtn">
										<a href="/clsp/api/video/list">영상 더보기</a>
									</div>
									</div>
								</div>
								   <div class="way">
                                    <h3 class="subTit_bl"><span>올바른 운동을 위한 Tip</span></h3>
                                        <div class="wayTxt">
                                            <p class="wayTxtP"><b>운동 원칙</b>
                                            <br>❗ 주 3회 이상의 유산소 운동과 주 2회 이상의 근력 운동을 병행하세요.
                                                근육은 포도당을 태우는 기관이라서 근력운동은 매우 중요합니다.
                                            <br>❗ 가급적 매일 혹은 격일로 하는 것이 좋습니다.
                                                운동 간격이 너무 멀어지면 매번 새롭게 운동하는 느낌을 받게되면서 운동의 효과도 감소하게 됩니다.
                                            </p>
                                            <p class="wayTxtP"><b>수분 섭취</b>
                                            <br>❗ 운동 시 수분 섭취를 꾸준히 해주세요!
                                                <br>
                                                운동시간이 길어지거나 더운 날씨에 운동을 하는 경우에는 특히  수분 섭취가 충분히 해야 합니다.
                                            </p>
                                            <p class="wayTxtP"><b>운동 강도</b>
                                            <br>❗ 운동의 강도는 처음부터 강하게 하지 말고 본인에게 맞는 강도로 서서히 올려주시고, 휴식을 충분히 갖도록 합니다.</p>        
                                            <p class="wayTxtP"><b>운동 타이밍</b>
                                            <br>❗ 혈당관리 목적이라면 식전보다는 식후에 운동하세요!
                                            <br>식후 두 시간 후의 혈당을 낮추려면 식후 30분에서 1시간 사이에 운동하는게 좋습니다.
                                            </p>
                                        
                                        </div>
                                </div> 
                                <div class="pointArea">
                                    <h3 class="subTit_bl"><span>운동 시 주의점</span></h3>
                                    <div class="hPoint">
                                        <p>
                                            ✔ 과도한 운동은 근육에 무리를 가져오고 저혈당의 위험을 높입니다.
                                            특히 공복시의 운동이나 장기간의 산행은 저혈당의 위험성을 더욱 증가시킵니다.
                                            <br>
                                            ✔ 운동 중이나 운동 후에 고통이 남는 운동은 피하며, 운동 후 피로감이나 운동의 후유증이 남는 것은 피하세요.
                                            <br>
                                            ✔ 운동 중에 몸의 상태가 좋지 않은 경우에는 즉시 휴식을 취하고 계속 몸의 상태가 나쁠 때는 쉬도록 합니다.
                                            <br>
                                            ✔ 운동을 너무 자주 하게 되면 오히려 근육이 피로하여 탈진하게 되고 운동의 효과를 충분히 볼 수 없게 됩니다.
                                        </p>
                                        <p>
    
                                        </p>
                                    </div>
                                </div>
							</div>
						</li>
							
						<li id="tab3" class="btnCon">
							<input type="radio"
							name="tabmenu" id="tabmenu3" checked> <label
							for="tabmenu3">생활습관</label>
							<div class="tabCon" id="tabCon3">
								                     <div class="txtAreaTab3">
                                    <div class="lifestyle">
                                        <h3 class="subTit_bl"><span>생활습관 개선</span></h3>
                                          <div class="lifestyleTxt">
                                            <p class="lst">
                                                ✔&nbsp; <b>충분한 수면</b>
                                                <br>
                                                &nbsp;잠은 혈당과 밀접한 관련이 있습니다.밤에 숙면을 취하지 못하면 체내 당 대사가 제대로 이뤄지지 않아 혈당을 조절하는 인슐린 분비가 줄어들기 때문이에요. 
                                                수면 부족은 식욕 억제 호르몬인 렙틴의 분비를 줄여 식욕과 체중이 증가하면서 비만으로 이어지기도 해요. 당뇨병 위험이 커지는 거죠.
                                                잠을 푹 자지 못하고 자주 깨는 증상의 수면 장애가 지속되면 당뇨병에 걸릴 확률이 높아요. 
                                                수면 장애가 지속되면 반대로 혈당이 더 높아져 위험해요. 불면증을 적극적으로 극복해야 하는 이유예요. 혹시 불면증이 있는 경우 낮 시간 동안 활동량을 늘리면 불면증 개선뿐 아니라 혈당 관리에도 좋아요.
                                            </p>
                                            <p class="lst">
                                                ✔&nbsp; <b>취침 시 불끄기</b>
                                                <br>
                                                &nbsp;밝은 곳에서 자면 인슐린저항성 커지고 심혈관질환 위험도 올라갑니다.
                                                <br>
                                                &nbsp;미국 노스웨스턴대 연구팀이 건강한 성인 20명을 대상으로 조사한 결과 밝은 곳에서 잠든 그룹은 인슐린저항성이 15% 증가했고, 심박수도 올랐습니다. 밝은 조명을 켜고 자면 장기적으로 당뇨병 발생 위험이 커질 수 있습니다.
                                                <br>
                                                &nbsp;밝은 곳에서 자면 당뇨병 위험이 올라가는 이유는 멜라토닌에 있습니다. 밝은 조명은 멜라토닌 분비를 억제합니다. 그러면 생체리듬이 깨집니다. 서울성모병원 내분비내과 양여리 교수는 또 “밤에 잠을 푹 못자면 스트레스 호르몬인 코르티솔 수치가 올라간다”며 “이 호르몬은 인슐린 분비를 억제해 공복혈당을 상승시키는 작용을 한다”고 말했습니다. 밤에 푹 자야 체내 호르몬 분비가 균형 있게 이뤄져 혈당이 안정적으로 유지됩니다.
                                                <br>
                                                &nbsp; 이미 당뇨병이 있는 사람이라면 심혈관질환 예방을 위해서라도 잘 때 불을 꺼야 합니다. 당뇨병 환자는 다섯 명 중 세 명이 고혈압, 고콜레스테롤혈증 등 심혈관질환 위험인자를 가지고 있는데, 여기에 조명 때문에 잠까지 제대로 못 자면 큰 일입니다.
                                                <br>
                                                &nbsp;가천대 길병원 내분비내과 김병준 교수는 “일정한 시각에 잠들고 똑같은 시간대에 일어나는 게 중요하다”며 “자는 동안에 숙면을 위해서 조명을 끄거나 어둡게 하라”고 말했습니다. 여기에 아침에 일어나자마자 밝은 빛을 쬐고, 잠들기 최소 두 시간 전부터는 금식하고, 침실을 조용하고 시원하게 유지하는 것도 ‘당뇨를 예방하는’ 수면법입니다.
                                            </p>
                                            <p class="lst">
                                                ✔&nbsp; <b>양치질 3회 이상 권장</b>
                                                <br>
                                                하루에 양치질을 한 번만 하는 사람은 세 번 하는 사람에 비해 당뇨병 발병 위험이 14% 높았다고 합니다. 
                                                <br>잇몸병이 있으면 당뇨병이 생길 위험이 올라갑니다. 잇몸병을 일으키는 세균은 혈관에도 염증을 일으킵니다. 그러면 혈관 기능이 떨어지고, 포도당 대사에 문제가 생깁니다. 세균이 혈관을 타고 췌장으로 이동해 인슐린 분비 세포를 망가뜨릴 수도 있습니다. 
                                                식사 후에는 반드시 양치질을 해서 입속 세균을 없애야 합니다. 이미 당뇨병이 있는 사람도 잇몸병이 생기지 않게 해야 합니다. 구강 건강이 좋지 않은 당뇨 환자는 심뇌혈관질환 발생 위험이 17% 높았습니다.
                                            </p>
                                            <p class="lst">
                                                ✔&nbsp; <b>흡연의 위험성</b>
                                                <br>&nbsp;국내 연구에 따르면 흡연은 직접적으로 인슐린저항성 및 내장비만을 유발하며, 운동부족 및 부적절한 식사 등 잘못된 생활습관 등의 효과가 더해지면서 체중이 증가되며, 더 나아가 대사증후군 및 제2형 당뇨병의 위험을 증가시킬 것으로 추정된다고 합니다.
                                                또한 간접흡연에 노출된 성인의 혈당 조절 이상 위험이 1.3배로 높았으며 간접흡연에 하루 4시간 이상 노출되면 2형 당뇨병 발생 위험이 36% 이상 증가한다는 연구 결과도 있습니다. 
                                                일본 연구에서는 3만7000여 명의 여성을 대상으로 15년 동안 조사했더니, 부모 중 흡연자가 있으면 흡연자가 없는 경우에 비해 당뇨 발병 위험이 18% 높다고 나왔습니다. 
                                                <br>따라서 흡연자의 경우 금연을 권장합니다.

                                            </p>
                                         </div>
                                    </div>
                                    <div class="etc">
                                        <h3 class="subTit_bl"><span>기타</span></h3>
                                            <div class="etcTxt">
                                                <p class="ett">
                                                   <b>유전적 요인은 후천성 요인보다 낮습니다.</b>
                                                   <br>
                                                  	 ❗ 당뇨병은 가족력보다도 후천적인 생활습관의 영향을 더 크게 받는 질병입니다. 
                                                   <br>당뇨 발병 요인은 생활 습관 등 후천적 요인이 70%, 유전적 소인이 30% 정도 차지한다고 전문가 들은 말하고 있습니다. 부모님 중 한분이 당뇨일 경우 약 30%, 두 분 다 당뇨 일 경우 약 50%의 유전율을 나타낸다고 합니다. 혈당을 꾸준히 관리하면 가족력이 있어도 당뇨병이 생기지 않을 수 있어요.
                                                </p>
                                                <p class="ett">
                                                    <b>스트레스는 만병의 근원</b>
                                                    <br>
                                                   	 ❗ 스트레스가 일시적으로 혈당을 높일 수 있습니다.
                                                    <br>
                                                    몸에 정신적, 신체적 스트레스가 가해지면 이를 극복하기 위해 교감신경이 활성화돼요. 교감신경이 활성화되면 뇌와 근육에 포도당과 산소를 더 많이 공급하려고 심장이 빨리 뛰고, 모든 신경이 예민해지고, 식은땀이 나고, 손도 떨리죠. 이런 증상들은 자연스러운 몸의 방어 기전으로, 저혈당으로 인한 반응이 아니기에 안심하셔도 됩니다. 다만, 장기적이고 반복적인 스트레스는 당뇨병에 직접적인 영향을 줄 수 있어요. 평소 스트레스를 잘 관리해야 하는 이유예요. 
                                                    <br>규칙적인 운동이나 명상이 심신의 안정을 가져다줘서 스트레스 해소에 도움이 됩니다.
                                                </p>
                                                <p class="ett">
                                                    <b>인슐린 저항성</b>
                                                    <br>
                                                 	   ❗ 인슐린 저항성이 있는 경우, 높은 확률로 당뇨에 걸릴 수 있습니다. 
                                                    <br>
                                                    인슐린 저항성이 높으면 인슐린이 제 기능을 잘 하지 못합니다. 췌장에서 인슐린이 아무리 많이 나와도 혈당이 잡히지 않습니다. 인슐린 저항성은 당뇨병 외에 다른 질환(암, 심혈관질환, 난임)의 위험도 높이기에 적절한 식이조절과 규칙적인 운동을 병행하여 인슐린 저항성을 낮춰야합니다.                                                    
                                                </p>
                                                <p class="ett">
                                                    <b>비만은 성인병을 유발</b>
                                                    <br>
                                                   	 ❗ 비만의 경우 여러 합병증을 유발 할 수 있습니다. 
                                                    <br>
                                                    
                                                    과체중 또는 비만의 경우 세포 안에 지방이 쌓이고, 지방세포에서 염증성 물질들이 만들어지고 분비되며, 유리지방산이 증가하면서 인슐린 저항성이 생기게 됩니다. 이 경우 인슐린 분비 능력이 떨어져 혈당 조절에 이상이 생기게 되어 당뇨병에 걸리게 됩니다. 
                                                    <br>특히 복부비만률이 증가할수록 당뇨병으로 인한 안과 질환 발병률이 높아졌다는 연구결과가 있습니다. 복부비만인 당뇨병 환자의 경우 눈 합병증을 주의해야 합니다. 섭취 칼로리를 제한하고 꾸준한 운동이 필요합니다.                                                    
                                                </p>
                                            </div>
                                    </div>
                                
                                </div>  
							</div>
						</li>
							</div>
							</li>					
				</div>
			</ul>
		</div>
	</div>
	</div>
	</div>
<script type="text/javascript" src="js/prevention.js"></script>
</body>
</html>

