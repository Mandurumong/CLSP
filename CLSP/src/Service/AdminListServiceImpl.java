package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDao;
import Model.MemberDto;

public class AdminListServiceImpl implements AdminListService{
	private MemberDao memberDao;
	
	public AdminListServiceImpl() {
		memberDao = MemberDao.getInstance();
		
	}
	public MemberDto execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = (String)request.getAttribute("user_id");
		return memberDao.getOneList(user_id);
	}

}
