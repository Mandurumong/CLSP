package Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AnalyticsDto;

public interface AnalyticsService {

	AnalyticsDto execute(HttpServletRequest request, HttpServletResponse response); 
}
