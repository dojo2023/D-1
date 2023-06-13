package model;

import java.io.Serializable;

public class Loggedin implements Serializable {
	private String user_addr;

	public Loggedin() {
		this(null);
	}
	public Loggedin(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getId() {
		return user_addr;
	}
	public void setId(String user_addr) {
		this.user_addr = user_addr ;
	}
}
