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
    <link rel="stylesheet" href="css/admin_member.css">
</head>
<body>
    <div id="header">
        <ul>
           <h2><a href="/admin_page">관리자 페이지</a></h2> 
            <li><a href="/admin_modify">관리자 계정 관리 </a></li>
            <li><a href="memberList.do">회원 관리</a></li>
            <li><a href="/adminBoard">게시글 관리</a></li>
        </ul>
    </div>
    <div id="top-nav">
    	<button name="logout" onClick="location.href='logout.do'">로그아웃</button>
    	<button name="homepage" onClick="location.href='/'">홈페이지</button>
    </div>
    <div id="content">
        <h3>회원 관리</h3>
        <div id="search">
        	<select class="search-control" name="searchField" id="searchField">
        		<option value="user_id">아이디</option>
        		<option value="user_email">이메일</option>
        	</select>
        	<input type="text" class="search-control" name="searchText" id="searchText" maxlength="100">
        	<button type="button" onclick="searchcheck()">검색</button>
        </div>
    	<div id="top-button">
    		<button type="button" onclick="fn_mdown()">전체 다운로드</button>
    	</div>
        <div id="data">
            <table>
            	<tr>
                	<th>아이디</th>
                	<th>이메일</th>
                	<th>가입일</th>
                	<th>등급</th>
                	<th>관리</th>
            	</tr>
            	<c:forEach var="memberDto" items="${memberList}">
            	<tr>
	            	<td><c:out value="${memberDto.user_id}"/></td>
	            	<td><c:out value="${memberDto.user_email}"/></td>
	            	<td><c:out value="${memberDto.reg_date}"/></td>
	            	<td>
	            	<c:choose>
	            		<c:when test="${memberDto.user_level == 0 }">일반회원</c:when>
	            		<c:otherwise>관리자</c:otherwise>
	            	</c:choose>
	            	</td>
	            	<td>
	            		<button type="button" id="trash" onClick="fn_delete('${memberDto.user_id}')"><img src="img/trashcan.png" alt="삭제"></button>
	            		<a href="memberInfo.do?user_id=${memberDto.user_id }"><button type="button"><img src="img/gear.png" alt="설정"></button></a>
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
    	function fn_delete(user_id){
    		 if (confirm("회원정보를 삭제하시겠습니까?") == true){ 
    		     location.href="deleteMember.do?user_id="+user_id;
    		 }else{ 
    		     return false;
    		 }
    	}
    </script>
    <script type="text/javascript" src="js/member_list.js"></script>
    <script type="text/javascript" src="js/down.js"></script>
</html>