package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDto;

public interface LoginService {
	
	MemberDto execute(HttpServletRequest request, HttpServletResponse response);
}
