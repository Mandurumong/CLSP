package Service;

import Model.MemberDao;

public class DuplicationCheckImpl implements DuplicationCheck{
	
	private MemberDao checkDao;
	
	public DuplicationCheckImpl() {
		checkDao = MemberDao.getInstance();
	}
	
	public int idCheck(String id) {
		int result = checkDao.selectAllId(id);
		return result;
	}

	
}
