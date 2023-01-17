package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDao;
import Model.MemberDto;

public class AdminModifyServiceImpl implements AdminModifyService{
	private MemberDao memberDao;
	
	public AdminModifyServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		memberDao.updateData((String)request.getAttribute("user_id"), (MemberDto)request.getAttribute("updMember"));

	}

}
