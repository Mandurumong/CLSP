package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FindPwService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
