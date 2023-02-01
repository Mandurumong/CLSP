<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>답글보기</title>
    <link rel="stylesheet" href="${path}/css/qnaView.css"/>
	
</head>
<body>
<script src="script/reply.js?1234"></script>
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
                          <a href="analytics.jsp">현황 분석</a></li>
                        <li>
                          <a href="selfTestM.jsp">자가 진단</a>
                        </li>
                        <li><a href="#">예방법</a>
                        <li><a href="#">커뮤니티</a>
                          <ul class="submenu">
                            <li><a href="community_freeBoard.jsp">자유게시판</a></li>
                          </ul>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <nav>
            <ul class="record_menu">
              <li><a href="#">커뮤니티</a></li>
              <li><a href="community_freeBoard.jsp">자유게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <h1>
                <a href="community_freeBoard.jsp">자유게시판</a>
            </h1>
                <div class="cmn-content" class="cmn-search">
                <div class="common01">
                    <div class>
                        <div class="detail-view">
                            <p class="title">${board.FB_TITLE}</p>
                            <div class="post-info">
                                <ul>
                                    <li class="category">

                                        <p>
                                            <strong>카테고리</strong>
                                            ${board.FB_CATEGORY}
                                        </p>
                                    </li>    
                                    <li class="date">
                                        <p>
                                            <strong>등록일</strong>
                                            ${board.FB_DATE}
                                        </p>
                                    </li>    
                                    <li class="count">
                                        <p>
                                            <strong>조회수</strong>
                                            ${board.FB_COUNT}
                                        </p>
                                    </li>
                                    <li>
                                        <p>
                                            <strong>작성자</strong>
                                            ${board.FB_USERID}
                                        </p>

                                    </li>
                                </ul>
                            </div>
                            <div class="post-content">
                                <div class="fr-view">
                                    <p>${board.FB_CONTENT}</p>     
                                </div>
                            </div>
                        </div>
                      <!--   <c:if test="${user_id ne null}"> 
	                        <div>
	                       
		                        <form action="replyInsert.do" method="post" name = "replyForm">
		                        <input name="fb_num" type ="hidden" value="${board.FB_NUM }">
		                        <input name=user_id type="hidden" value=" ${board.FB_USERID }"> 
		                        <input name="replyparentnum" type="hidden" value="0">
		                          ${user_id}
		                          <input name="replycontent" style="border: solid 1px; width:300px; height: 30px" type="text"  placeholder="댓글을 작성하세요">
		                          <button type="submit" >댓글달기</button>
		                        </form>
	                        </div>
						</c:if>  
							-->
						
						
						 <div>
	                       
		                        <form action="/clsp/reply/write" method="post" name = "replyForm">
								<!-- 히든으로 글번호, 유저아이디 전달  -->
		                        <input name="fbNum" type ="hidden" value="${board.FB_NUM }">
		                        <input name="replyUserId" type="hidden" value=""> 
		                        <input name="replyParentNum" type="hidden" value="0">
		                          ${user_id}
		                          <input name="content" style="border: solid 1px; width:300px; height: 30px" type="text"  placeholder="댓글을 작성하세요">
		                          <button type="submit" >댓글달기</button>
		                        </form>
	                        </div>
						
						
						<!-- 댓글 출력 반복문 -->
						<c:forEach var="reply" items="${replies}" varStatus="status" >
						<table style="border-spacing: 20px; width: 800px;" class = "reply">
							<tr>
								<c:if test ="${reply.REPLYPARENTNUM eq 0}">
								<td >${reply.REPLYUSERID} </td> 
								<td>${reply.REPLYCONTENT}</td>
								<td>
									${reply.REPLYDATE}&nbsp;
									<c:if test="${user_id ne null}">
									<a onclick="">수정</a>									
									<a onclick="">삭제</a>
									<a onclick="rereplyshow(${status.index})">답글달기</a>									
									</c:if>  
									
								</td>
								<
								
								</c:if>
							</tr>
							<c:forEach var="rereply" items="${replies}"  varStatus="insts" >
								<c:if test="${reply.REPLYNUM eq rereply.REPLYPARENTNUM }">
								<tr>
									<td style="padding-left: 20px">${rereply.REPLYUSERID}</td> 
									<td>${rereply.REPLYCONTENT}</td>
									<td>${rereply.REPLYDATE}</td>
									
								</tr>
								</c:if>
							</c:forEach>
							
							
							
						</table>
						<!-- 입력칸은 부모댓글 갯수와 1:1 대응하도록  -->
						<c:if test ="${reply.REPLYPARENTNUM eq 0}">
					
						<table class="re_reply">
							<tr>
								 <td style="padding-left: 40px">${user_id }</td>
								 <td>
									 <form action="/clsp/reply/write" method="post" name = "replyForm">
									<!-- 히든으로 글번호, 유저아이디 전달  -->
				                         <input name="fbNum" type ="hidden" value="${board.FB_NUM }">
		                       			 <input name="replyUserId" type="hidden" value=""> 
				                        <input name="replyParentNum" type="hidden" value="${reply.REPLYNUM }">
										<input style="border: solid 1px;" type="text" name = "content" >
									 	<button type="submit">완료</button>
									 	
									 </form>
								 </td>
							</tr>
						</table>
						</c:if>
						</c:forEach>
                    </div>
                    <div class="b-btn01 type01">
                        <div class="button-group a-r">
                            <a class="button medium border v1" href="/clsp/board/list"> <strong>목록</strong></a>
                            <a class="button medium border v1" href="/clsp/board/edit?fbNum=${board.FB_NUM}"> <strong>수정</strong></a>
                            <a class="button medium border v1" onclick="deleteBtn()"> <strong>삭제</strong></a>
                            <a class="button medium border v1" onclick=""> <strong>답글등록</strong></a>
                        </div>
                    </div>

                </div>
                </div>    
                   
             
            </div>
        </div>



           </div>

    
</body>
</html>

<script type="text/javascript">

function deleteBtn(){
	var cf = window.confirm('삭제하시겠습니까?')
	if(cf){
		location.href="/clsp/board/delete?fbNum=${board.FB_NUM}"
	}
}

</script>