<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
	int user_level = (Integer)session.getAttribute("user_level");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>예방법</title>
    <link rel="stylesheet" href="${path}/css/videoView.css"/>
	
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
                        <li><a href="${path}/api/prevent">예방법</a>
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
            

           <div class="container">
            <h1>
                <a href="#">상세 보기</a>
            </h1>
           
                <div class="cmn-content" class="cmn-search">
                <div class="common01">
                
                
                
                        <div class="detail-view">
                            <p class="title">${video.TNM}</p>
                            <div class="post-info">
                                <p><video src="${video.FILEURL}${video.FILENM}" width="1200" height="600" controls  loop></video></p>
                                <p><br></p>
                                <p></p>  
                            </div>
                            <div class="post-content">
                                <div class="fr-view">
                                    <ul>
                                        <li>
    
                                            <p>
                                                <strong>순번</strong>
                                               ${video.ROW_NUM}
                                            </p>
                                        </li>    
                                        <li>
                                            <p>
                                                <strong>동영상 제목</strong>
                                                ${video.TTLNM}
                                            </p>
                                        </li> 
                                          <li>
                                            <p>
                                                <strong>동영상 설명</strong>
                                                ${video.VDODESC}
                                            </p>
                                        </li>    
                                        <li>
                                            <p>
                                                <strong>운동명</strong>
                                               ${video.TNM}
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <strong>운동부위명</strong>
                                                ${video.PARTNM}
                                            </p>

                                        </li>
                                        <li>
                                            <p>
                                                <strong>체력요인명</strong>
                                                ${video.FNM}
                                            </p>

                                        </li>
                                        <li>
                                            <p>
                                                <strong>연령대명</strong>
                                               ${video.AGGNM}
                                            </p>

                                        </li>
                                        <li>
                                            <p>
                                                <strong>소도구및기구명</strong>
                                                ${video.TOOLNM} 
                                            </p>

                                        </li>


                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="b-btn01 type01">
                        <div class="button-group a-r">
                            <a class="button medium border v1" href="/api/video/list"> <strong>목록</strong> </a>
                        </div>
                    </div>

                </div>
                </div>    
                   
             
            </div>
        </div>
        </div>
</body>
</html>