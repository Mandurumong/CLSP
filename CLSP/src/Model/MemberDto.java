package Model;

public class MemberDto {
	private String user_id;
	private String user_pw1;
	private String user_email;
	private int level;
	
	public MemberDto() {}
	
	public MemberDto(String id, String pw, String email, int level) {
		this.user_id = id;
		this.user_pw1 = pw;
		this.user_email = email;
		this.level = level;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw1;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw1 = user_pw;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public int getLevel(){
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}

}
