package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AnalyticsService {

	void execute(HttpServletRequest request, HttpServletResponse response); 
}
