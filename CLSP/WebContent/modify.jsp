<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>개인정보수정</title>
    <link rel="stylesheet" href="css/modify.css">

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
                        <button name="mypage"><a href="mypage_info.jsp">마이페이지</a></button>
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
            
           <nav>
            <ul class="record_menu">
              <li><a href="mypage_info.jsp">마이페이지</a></li>
              <li><a href="mypage_info.jsp">개인정보 수정</a></li>
              <li><a href="userQna.jsp">나의 문의 사항</a></li>
            </ul>
           </nav>
            <div class="main-info">
                <div class="main-info-top">
                  <div class="title">
                    <h3>개인 정보 수정</h3>
                  </div>
                  </div>
                  <div class="info-form">
                <form id="pwReConfirm" action="#">
                  <div class="main-info-input">
                    <ul>
                        <li>
                         <label for="uid">아이디</label>
                         <input type="text" id="uid" placeholder=<%=user_id %> name = "uid" readonly>
                        </li>
                        <li>
                         <label for="pwd1">현재 비밀번호</label>
                         <input type="password" id="pwd1" name="pwd1" autofocus placeholder="기존 비밀번호를 입력해 주세요" required>
                       </li>
                        <li>
                        <label for="newPwd1">새 비밀번호</label>
                        <input type="password" id="newPwd1" name="newPwd1" placeholder="새 비밀번호를 입력해 주세요" required>
                        </li>
                        <li>
                          <label for="newPwd2">새 비밀번호 확인</label>
                          <input type="password" id="newPwd2" name="newPwd2" placeholder="새 비밀번호를 다시 입력해 주세요" required>
                          </li>
                        <li>
                            <label for="email">이메일</label>
                            <input type="email" id="email" name="email" placeholder="user@gmail.com" required>
                        </li>
                    </ul>    
                  </div>
                  <div class="info-btn">
                    <button class="info-btn-btn-uw" id="userWithdrawal" name="userWithdrawal" type="submit">회원탈퇴</button>
                    <button class="info-btn-btn-uc" id="userCorrection" name="userCorrection" type="submit">회원정보수정</button>
                  </div>
                </form>
                  </div>
                  </div>
                  </div>
            </div>

</body>
</html>