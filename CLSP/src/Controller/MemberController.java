package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.AnalyticsDto;
import Model.MemberDto;
import Model.TestDto;
import Service.AnalyticsService;
import Service.AnalyticsServiceImpl;
import Service.DuplicationCheck;
import Service.DuplicationCheckImpl;
import Service.FindIdService;
import Service.FindIdServiceImpl;
import Service.FindPwService;
import Service.FindPwServiceImpl;
import Service.LoginService;
import Service.LoginServiceImpl;
import Service.RegisterService;
import Service.RegisterServiceImpl;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberController() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		actionDo(request, response);

		
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//회원가입
		if(command.equals("/insertMember.do")) {
			System.out.println("insertMember 실행");
			
			MemberDto insMember = new MemberDto();
			
			insMember.setUser_id(request.getParameter("user_id"));
			insMember.setUser_pw(request.getParameter("user_pw"));
			insMember.setUser_email(request.getParameter("user_email"));
			
			request.setAttribute("insMember", insMember);
			
			RegisterService registerService = new RegisterServiceImpl();
			registerService.execute(request, response);
			response.sendRedirect("index.jsp");			
		}

		//아이디 찾기
		else if(command.equals("/findId.do")) {
			System.out.println("findId 실행");
			
			MemberDto findId = new MemberDto();
			
			findId.setUser_email(request.getParameter("user_email"));
			findId.setUser_pw(request.getParameter("user_pw"));
			
			request.setAttribute("findId", findId);
			
			FindIdService findIdService = new FindIdServiceImpl();
			findIdService.execute(request, response);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("findAccountResult.jsp");
			requestDispatcher.forward(request, response);
						
		}
		
		//비밀번호 찾기
		else if(command.equals("/findPw.do")){
			System.out.println("findPw 실행");
			
			MemberDto findPw = new MemberDto();
			
			findPw.setUser_email(request.getParameter("user_email"));
			findPw.setUser_id(request.getParameter("user_id"));
			
			request.setAttribute("findPw", findPw);
			
			FindPwService findPwService = new FindPwServiceImpl();
			findPwService.execute(request, response);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("findPasswordResult.jsp");
			requestDispatcher.forward(request, response);
			
		}
		
		//비밀번호 변경
		else if(command.equals("/modifyPassword.do")) {
			System.out.println("비밀번호 재설정 실행");
			
			HttpSession session = request.getSession();
			
		}
		
		//로그인
		else if(command.equals("/login.do")) {
			System.out.println("login 실행");
	         
	         String user_id = request.getParameter("user_id");
			 String user_pw = request.getParameter("user_pw");
	         
	         request.setAttribute("user_id", user_id);
			 request.setAttribute("user_pw", user_pw);
	         
	         LoginService loginService = new LoginServiceImpl();
	         String ls = loginService.execute(request, response);
	      
	         
	         if (ls.equals("login")) {
	            HttpSession session = request.getSession();
	            
	            session.setAttribute("user_id", user_id);
	            
	            response.sendRedirect("index.jsp");
	            
	         }else {
	        	 
	            response.sendRedirect("login.jsp");
	         }
		}
		
		//로그아웃
		else if(command.equals("/logout.do")) {
			
		}
		
		//자가진단
		else if(command.equals("/test.do")) {
			System.out.println("test 실행");
			
			TestDto test = new TestDto(); 
			
			String age = request.getParameter("age"); // 나이대
			String breakfast = request.getParameter("meal-breakfast"); //아침여부
			String dinnerTime = request.getParameter("meal-8"); // 저녁 8시 이후 먹는지
			String mealOily = request.getParameter("meal-oily"); // 야식 먹는지
			String mealRegular = request.getParameter("meal-regular"); // 규칙적인 식사
			String mealSpeed =  request.getParameter("meal-speed"); // 식사 속도
			String mealSnack = request.getParameter("meal-snack"); // 식사 후 간식
			String alcohol = request.getParameter("meal-alcohol"); // 술
			String mealdeli = request.getParameter("meal-deli"); // 기름진 음식, 배달음식 
			String after1 = request.getParameter("life-after1"); //1시 이후 취침
			String sleepTime = request.getParameter("life-sleept"); //수면시간
			String light = request.getParameter("life-night"); // 불켜고 자는가
			String brush = request.getParameter("life-brush"); //하루 3회 이상 양치질 
			String smoke = request.getParameter("life-smoke"); //담배를 피는가
			String exerciseRegular = request.getParameter("exercise-regular"); //규칙적인 운동
			String exercise30 = request.getParameter("exercise-30"); // 하루 30분 이상 운동
			String strech = request.getParameter("exercise-st"); // 스트레칭 하는가
			String inheritance = request.getParameter("etc-inheritance"); // 유전
			String stress = request.getParameter("etc-stress"); //스트레스 받는가
			String insulin = request.getParameter("etc-insulin"); //인슐린 저항성 여부
			String fat = request.getParameter("etc-fat"); // 비만?
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("testResult.jsp");
			requestDispatcher.forward(request, response);
			
		}
		//현황분석
		else if(command.equals("/analytics.do")) {
			System.out.println("현황분석 실행");
			
			AnalyticsService analyticsService = new AnalyticsServiceImpl();
			AnalyticsDto analytics = analyticsService.execute(request, response);
			
			request.setAttribute("analytics", analytics);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("analytics.jsp");
			requestDispatcher.forward(request, response);
			
		}
	}
}
