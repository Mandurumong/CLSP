<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>개인정보수정</title>
    <link rel="stylesheet" href="/css/mypage_info.css">

</head>
<body>
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
                        <button name="logout"><a href="#">로그아웃</a></button>
                        <button name="mypage"><a href="/mypage_info.jsp">마이페이지</a></button>
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
                            <li><a href="/community_notice.jsp">공지사항</a></li>
                            <li><a href="/community_freeBoard.jsp">문의게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="/mypage.jsp">마이페이지</a></li>
              <li><a href="/modify.jsp">개인정보 수정</a></li>
              <li><a href="/userQna.jsp">나의 문의 사항</a></li>
            </ul>
           </nav>
            <div class="main-info">
                <div class="main-info-top">
                  <div class="title">
                    <h3>개인 정보 수정</h3>
                    
                  </div>
                  </div>
                  <div class="subTitle">
                    <h3>비밀번호 재확인</h3>
                  </div>
                  <div class="info-form">
                <form id="pwReConfirm" action="#">
                  <div class="main-info-input">
                    <ul>
                        <li>
                         <label for="uid">아이디</label>
                         <input type="text" id="uid" placeholder="user" name = "uid" readonly>
                        </li>
                        <li>
                         <label for="pwd1">비밀번호</label>
                         <input type="password" id="pwd1" name="pwd1" autofocus placeholder="현재 비밀번호를 입력해 주세요" required>
                       </li>
                    </ul>    
                  </div>
                  <div class="info-btn">
                    <button class="info-btn-btn" type="button" name=""><a href="/modify.jsp"><span>확인</span></a></button>
                </form>
                  </div>
                  </div>
                  </div>
            </div>

</body>
</html>