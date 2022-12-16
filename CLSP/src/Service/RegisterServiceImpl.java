package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import Model.MemberDao;
import Model.MemberDto;

public class RegisterServiceImpl implements RegisterService{
	
	private MemberDao memberDao;

	public RegisterServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto insMember = (MemberDto)request.getAttribute("insMember");
		memberDao.insertMember(insMember);
	}
}
