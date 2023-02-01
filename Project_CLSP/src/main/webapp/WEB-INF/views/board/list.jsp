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
    <title>문의게시판</title>
    <link rel="stylesheet" href="${path}/css/community_freeBoard.css">
	
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
                <c:choose>
                <c:when test="${user_id == null }">
                  <button name="login"><a href='<c:url value="/login" />'>로그인</a></button>
                  <button name="register"><a href='<c:url value="register.jsp" />'>회원가입</a></button>
                </c:when>
                <c:otherwise>
                	<button name="logout"><a href='<c:url value="/logout" />'>로그아웃</a></button>
                  	<button name="mypage"><a href='<c:url value="/confirm/view" />'>마이페이지</a></button>
                </c:otherwise>
                </c:choose>
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
<!--                             <li><a href="community_notice.jsp">공지사항</a></li> -->
                            <li><a href="freeBoard.do">자유게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="#">커뮤니티</a></li>
<!--               <li><a href="community_notice.jsp">공지사항</a></li> -->
              <li><a href="community_freeBoard.jsp">자유게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <h1>
                <a href="freeBoard.do">자유게시판</a>
            </h1>
            <div class="search" >
                
                    <div class="row" >
                            <table class="searchTable">
                                <tr>
                                    <td>
                                    <select class="form-control" name="searchField" id="searchField">
                                            <option value="title">제목</option>
                                            <option value="content">내용</option>
                                            <option value="user">작성자</option>
                                    </select>
                                    <input type="text" class="form-control"
                                        placeholder="" name="searchText" id="searchText" maxlength="100">
                                    <a class="btn btn-success" onclick="searchcheck()">검색</a>
                                   </td>
                                </tr>
                            </table>
                    </div>
            </div>  
            <div class="rowTable">
                <table class="table">
                    <thead>
                        <tr>
                            <th><select class="category-control" name="categoryField" id="category" onchange="selectOption(this)">
                                <option value="all">전체보기</option>
                                <option value="qna">질문</option>
                                <option value="tip">정보</option>
                                <option value="daily">일상</option>
                                <option value="diet">식단</option>
                                <option value="etc">기타</option>
                        </select></th>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>작성자</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${boardList}">
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
            <c:if test="${user_id ne null }">
            <div class="write">
                <a href="/clsp/board/write" class="btn btn-primary pull-right">작성하기</a>
            </div>
            </c:if>
        </div>
   

   <!--         <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div> -->
          
          <div class="pagebtn" style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<ahref="/clsp/board/list?page=${paging.startPage - 1 }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a onclick="go(${p})" >${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a  href="/clsp/board/list?page=${paging.endPage+1 }">&gt;</a>
		</c:if>
	</div>
           </div>

<script type="text/javascript" src="${path}/js/list.js">

</script>
</body>
</html>