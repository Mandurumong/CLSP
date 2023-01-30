<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("user_id");	//로그인 여부 판단
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>문의게시판</title>
    <link rel="stylesheet" href="css/community_freeBoard.css">

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
                  		<button name="login"><a href='<c:url value="login.jsp" />'>로그인</a></button>
                  		<button name="register"><a href='<c:url value="register.jsp" />'>회원가입</a></button>
                	</c:when>
                	<c:when test="${user_level == 1 }">
                		<button name="logout"><a href='<c:url value="logout.do"/>'>로그아웃</a></button>
                		<button name="logout"><a href='<c:url value="admin_page.jsp"/>'>관리자페이지</button>
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
                          <a href="analytics.do">현황 분석</a></li>
                        <li>
                          <a href="selfTestM.jsp">자가 진단</a>
                        </li>
                        <li><a href="#">예방법</a>
                        <li><a href="community_freeBoard.jsp">게시판</a>
                        </li>
                      </ul>
                </nav>
           </header>

           <div id="main">
            
           <div class="container">
            <h1>
                <a href="community_freeBoard.jsp">문의게시판</a>
            </h1>

            <div class="search" >
                
                    <div class="row" >
                        <form method="post" name="search" action="#">
                            
                            <table class="searchTable">
                                <tr>
                                    <td><select class="form-control" name="searchField">
                                            <option value="0">선택</option>
                                            <option value="noticeTitle">제목</option>
                                            <option value="eleTitle">내용</option>
                                            <option value="userID">작성자</option>
                                    </select></td>
                                    <td><input type="text" class="form-control"
                                        placeholder="" name="searchText" maxlength="100"></td>
                                    <td><button type="submit" class="btn btn-success">검색</button></td>
                                </tr>
            
                            </table>
                        </form>
                    </div>
            </div>  
            <div class="rowTable">
                <table class="table">
                    <thead>
                        <tr>
                            <th><select class="category-control" name="categoryField">
                                <option value="total">전체보기</option>
                                <option value="diet">정보</option>
                                <option value="tip">진단</option>
                                <option value="etc">기타</option>
                        </select></th>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>작성자</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td>정보</td>
                            <td>1</td>
                            <td><a href="qnaView.jsp">정보에 대한 문의</a></td>
                            <td>2022-11-27</td>
                            <td>사용자</td>
                            
                        </tr>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td>진단</td>
                            <td>2</td>
                            <td><a href="qnaTestView.jsp">검사 결과 문의</a></td>
                            <td>2022-11-26</td>
                            <td>사용자2</td>
                            
                        </tr>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        

                    </tbody>
                </table>
                
            </div>
            <div class="write">
                <a href="write.jsp" class="btn btn-primary pull-right">작성하기</a>
            </div>
        </div>
        <!-- 게시판 메인 페이지 영역 끝 -->
        
        <!-- 부트스트랩 참조 영역 -->

           <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div>
           </div>

    
</body>
</html>