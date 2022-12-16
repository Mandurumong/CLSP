package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDao;
import Model.MemberDto;

public class FindPwServiceImpl implements FindPwService{
	private MemberDao memberDao;
	
	public FindPwServiceImpl() {
		memberDao = MemberDao.getInstance();
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDto findPw = (MemberDto)request.getAttribute("findPw");
		memberDao.findPw(findPw);
	}

}
