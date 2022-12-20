<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>성인병 위험도 측정과 예방법 제안 : 자기진단</title>
    <link rel="stylesheet" href="css/test.css">
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
            <h2>자가 진단 테스트</h2>
        </div>
        <div id="select">
          <h2>성별, 나이 대를 선택해주세요</h2>
          <form name="test" action="test1.jsp" method="#">
          <p>성별</p>
          여성<input type="radio" name="gender" id="gender_fe" value="g_fm" required>
          남성<input type="radio" name="gender" id="gender_m" value="g_m" required>  
          <p>
            나이 대
          </p>
          10대<input type="radio" name="age" id="age_10" value="a10" required>
          20대<input type="radio" name="age" id="age_20" value="a20" required>
          30대<input type="radio" name="age" id="age_30" value="a30" required>
          40대<input type="radio" name="age" id="age_40" value="a40" required>
          50대<input type="radio" name="age" id="age_50" value="a50" required>
          60대<input type="radio" name="age" id="age_60" value="a60" required>
          70대<input type="radio" name="age" id="age_70" value="a70" required>
          <br>
          <input type="submit" value="입력하기">
          </form>

        </div>
        </div>
    </div>
    
</body>
</html>