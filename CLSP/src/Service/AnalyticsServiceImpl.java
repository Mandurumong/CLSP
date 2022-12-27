package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AnalyticsDao;

public class AnalyticsServiceImpl implements AnalyticsService{

	private AnalyticsDao analyticsDao;
	
	public AnalyticsServiceImpl(){
		analyticsDao = AnalyticsDao.getInstance();
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		analyticsDao.analytics10();
		analyticsDao.analytics20();
	}

}
