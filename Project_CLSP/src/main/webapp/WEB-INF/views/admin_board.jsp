<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.project.clsp.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="css/admin_board.css">
</head>
<body>
    <div id="header">
        <ul>
           <h2><a href="/admin_page">관리자 페이지</a></h2> 
            <li><a href="/admin_modify">관리자 계정 관리 </a></li>
            <li><a href="memberList.do">회원 관리</a></li>
            <li><a href="">게시글 관리</a></li>
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='/'">홈페이지</button>
    </div>
    <div id="content">
        <h3>게시글 관리</h3>
        <div id="search">
        	<select class="search-control" name="searchField" id="searchField">
            	<option value="all">전체보기</option>
            	<option value="질문">질문</option>
            	<option value="정보">정보</option>
            	<option value="일상">일상</option>
            	<option value="식단">식단</option>
            	<option value="기타">기타</option>
        	</select>
        	<input type="text" class="search-control" name="searchText" id="searchText" maxlength="100">
        	<button type="button" onclick="searchcheck()">검색</button>
        </div>
<!-- 
 			<div id="top-button">
    		<button type="button" onclick="fn_Bdown()">전체 다운로드</button>
	  	  	</div>
 -->    	
        <div id="data">
            <table>
            	<tr>
                	<th>카테고리</th>
                	<th>번호</th>
                	<th>제목</th>
                	<th>작성자</th>
                	<th>작성시간</th>
                	<th>관리</th>
            	</tr>
            	<c:forEach var="list" items="${boardList}">
            	<tr>
	            	<td><c:out value="${list.FB_CATEGORY}"/></td>
	            	<td><c:out value="${list.FB_NUM}"/></td>
	            	<td><c:out value="${list.FB_TITLE}"/></td>
	            	<td><c:out value="${list.FB_USERID}"/></td>
	            	<td><c:out value="${list.FB_DATE }"/></td>
	            	<td>
	            		<button type="button" id="trash" onclick="deleteBtn()"><img src="img/trashcan.png" alt="삭제"></button>
	            	</td>
            	</tr>
            	</c:forEach>
            </table>
            <div id="button">                
            </div>
            <div class="pagebtn" style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/memberList.do?page=${paging.startPage - 1 }">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a onclick="go(${p})" >${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a  href="/memberList.do?page=${paging.endPage+1 }">&gt;</a>
				</c:if>
			</div>  
        </div>
    </div>
</body>
<script type="text/javascript">
	function deleteBtn(){
		var cf = window.confirm('삭제하시겠습니까?')
		if(cf){
			location.href="/board/delete?fbNum=${board.FB_NUM}"
		}
	}
</script>
    <script type="text/javascript" src="js/member_list.js"></script>
    <script type="text/javascript" src="js/down.js"></script>
</html>