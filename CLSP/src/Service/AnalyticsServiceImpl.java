package Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AnalyticsDao;
import Model.AnalyticsDto;

public class AnalyticsServiceImpl implements AnalyticsService{

	private AnalyticsDao analyticsDao;
	
	public AnalyticsServiceImpl(){
		analyticsDao = AnalyticsDao.getInstance();
	}

	public AnalyticsDto execute(HttpServletRequest request, HttpServletResponse response) {
		return analyticsDao.analytics();
	}

}
