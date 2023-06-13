package model;
import java.io.Serializable;

public class Login implements Serializable {
	private String user_addr;
	private String user_pw;

	public Login(String user_addr, String user_pw) {
		this.user_addr = user_addr;
		this.user_pw = user_pw;
	}

	public Login() {
		this.user_addr = "";
		this.user_pw = "";
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
}
