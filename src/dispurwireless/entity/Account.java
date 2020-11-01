package dispurwireless.entity;

public class Account {
	
	private int regId;
	private String password;
	private String role;
	public Account(int regId, String password, String role) {
		super();
		this.regId = regId;
		this.password = password;
		this.role = role;
	}
	
	
	public Account(String password, String role) {
		super();
		this.password = password;
		this.role = role;
	}


	public int getRegId() {
		return regId;
	}
	public void setRegId(int regId) {
		this.regId = regId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	

}
