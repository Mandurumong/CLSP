package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.TestDto;

public interface TestService {

	void execute(HttpServletRequest request, HttpServletResponse response);
	
}
