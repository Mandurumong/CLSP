package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.TestDao;
import Model.TestDto;

public class TestServiceImpl implements TestService{
	
	private TestDao testDao;
	
	public TestServiceImpl() {
		testDao = TestDao.getInstance();
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		TestDto test = (TestDto)request.getAttribute("test");
		testDao.eatingTest(test);
		testDao.lifeTest(test);
		testDao.exerciseTest(test);
		testDao.etcTest(test);
	}

}
