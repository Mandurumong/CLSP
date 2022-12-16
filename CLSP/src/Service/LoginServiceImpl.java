package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Model.MemberDao;
import Model.MemberDto;

public class LoginServiceImpl implements LoginService{
	
	private MemberDao memberDao;
	
	public LoginServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return memberDao.login((String) request.getAttribute("user_id"), (String) request.getAttribute("user_pw"));
		
	}	
}