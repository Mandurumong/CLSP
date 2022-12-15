package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginService {
	
	String execute(HttpServletRequest request, HttpServletResponse response);
}
