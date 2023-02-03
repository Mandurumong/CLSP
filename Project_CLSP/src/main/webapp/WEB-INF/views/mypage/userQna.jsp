<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <link rel="stylesheet" href="css/userQna.css">

</head>
<body class="body-set">
      <div id="container">
        <header>
            <div class="header">
                <div id="logo">
                    <a href="<c:url value='/'/>" class="logo">
                    <img src="img/그림2.png" alt="logo">
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
                  			<button name="mypage"><a href='<c:url value="/confirm/view" />'>마이페이지</a></button>
                		</c:otherwise>
                	</c:choose>    
                </div>
            </div>

            <nav>
                <ul class="menu">
                    <li>
                      <a href="<c:url value='/index'/>">홈</a></li>
                    <li>
                      <a href="analytics.do">현황 분석</a></li>
                    <li>
                      <a href="/selfTestM">자가 진단</a>
                    </li>
                    <li><a href="${path}/api/prevent">예방법</a></li>
                    <li><a href="/board/list">게시판</a></li>
                  </ul>
            </nav>
       </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
                <li><a href="#">마이페이지</a></li>
                <li><a href="${path}/mypage/modify">개인정보 수정</a></li>
                <li><a href="${path}/mypage">나의 문의 사항</a></li>
            </ul>
           </nav>
           <div class="container">
            <div class="main-title">
            <h2>
                나의 문의 사항
            </h2>
            </div>

          
            <div class="rowTable">
                <table class="table">
                  
                    <tbody>
                    <c:forEach var="list" items="${board}">
                           <tr>
                            <td>${list.FB_CATEGORY}</td>
                            <td>${list.FB_NUM }</td>
                            <td> 
                            <c:forEach var="i" begin="1" end="${list.FB_INDENT}" step="1">
                            	->
                            </c:forEach>
                           <a href="/clsp/board?fbNum=${list.FB_NUM}">${list.FB_TITLE}</a></td>
                            <td>${list.FB_DATE }</td>
                            <td>${list.FB_USERID}</td>
                        </tr>
                    </c:forEach>
                    
                    

                    </tbody>
                </table>
                
            </div>

        </div>
        <!-- 게시판 메인 페이지 영역 끝 -->
        
        <!-- 부트스트랩 참조 영역 -->

            <div class="pagebtn" ">		
		<c:if test="${bPaging.startPage != 1 }">
			<a href="/clsp/mypage?page=${bPaging.startPage - 1 }">&lt;</a>
		</c:if>
		<c:forEach begin="${bPaging.startPage }" end="${bPaging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == bPaging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != bPaging.nowPage }">
					<a onclick="go(${p})" >${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${bPaging.endPage != bPaging.lastPage}">
			<a  href="/clsp/mypage?page=${bPaging.endPage+1 }">&gt;</a>
		</c:if>
	</div>
	</div>    
<script type="text/javascript" src="${path}/js/userQna.js"></script>
</body>
</html>