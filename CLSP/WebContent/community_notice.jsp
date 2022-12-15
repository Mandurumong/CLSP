<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/community_notice.css">

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
            
           <nav>
            <ul class="record_menu">
              <li><a href="#">커뮤니티</a></li>
              <li><a href="community_notice.jsp">공지사항</a></li>
              <li><a href="community_freeBoard.jsp">문의게시판</a></li>
            </ul>
           </nav>
           <div class="container">
            <h1>
                <a href="community_notice.jsp">공지사항</a>
            </h1>
            <div class="search" >
                
                    <div class="row" >
                        <form method="post" name="search" action="#">
                            <table class="pull-right">
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
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>작성자</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!-- 테스트 코드 -->
                            <td>1</td>
                            <td><a href="noticeView.jsp">공지사항입니다</a></td>
                            <td>2022-11-27</td>
                            <td>관리자</td>
                            <td>1</td>
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
        </div>
        <!-- 게시판 메인 페이지 영역 끝 -->
        
        <!-- 부트스트랩 참조 영역 -->

           <div class="pagination">
            <a href="#">&laquo;</a>
            <a class="active" href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div>
           </div>

    
</body>
</html>