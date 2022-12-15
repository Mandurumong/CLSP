package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDto;
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
	}
}
