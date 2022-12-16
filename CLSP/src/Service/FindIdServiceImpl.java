package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDao;
import Model.MemberDto;

public class FindIdServiceImpl implements FindIdService{
	private MemberDao memberDao;
	
	public FindIdServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDto findId = (MemberDto)request.getAttribute("findId");
		memberDao.findId(findId);
	}

}
