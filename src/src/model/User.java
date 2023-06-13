package model;
import java.io.Serializable;

public class User implements Serializable {
	private String user_num;
	private String user_addr; // ID
	private String user_pw;	// PW
	private String user_nickname;
	private String user_height; //cm
	private String user_weight; //kg
	private String user_gender; //0male, 1female, 2other
	private String user_goalw; //date
	private String user_birth; //date
	private String user_limit; //date
	private String user_secret;
	private String user_answer;
	private String user_avatar;
	private String user_color;

	public User(String user_secret, String user_nickname, String user_height, String user_pw, String user_gender,
			String user_limit, String user_birth, String user_weight, String user_answer, String user_goalw,
			String user_color, String user_addr, String user_avatar, String user_num) {

		this.user_secret = user_secret;
		this.user_nickname = user_nickname;
		this.user_height = user_height;
		this.user_pw = user_pw;
		this.user_gender = user_gender;
		this.user_limit = user_limit;
		this.user_birth = user_birth;
		this.user_weight = user_weight;
		this.user_answer = user_answer;
		this.user_goalw = user_goalw;
		this.user_color = user_color;
		this.user_addr = user_addr;
		this.user_avatar = user_avatar;
		this.user_num = user_num;
	}
//初期値？
	public User() {
		this.user_secret = "";
		this.user_nickname = "USER";
		this.user_height = "0";
		this.user_pw = "";
		this.user_gender = "2";
		this.user_limit = "";
		this.user_birth = "";
		this.user_weight = "0";
		this.user_answer = "";
		this.user_goalw = "0";
		this.user_color = "0";
		this.user_addr = "";
		this.user_avatar = "0";
		this.user_num = "";
	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
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

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_height() {
		return user_height;
	}

	public void setUser_height(String user_height) {
		this.user_height = user_height;
	}

	public String getUser_weight() {
		return user_weight;
	}

	public void setUser_weight(String user_weight) {
		this.user_weight = user_weight;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_goalw() {
		return user_goalw;
	}

	public void setUser_goalw(String user_goalw) {
		this.user_goalw = user_goalw;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_limit() {
		return user_limit;
	}

	public void setUser_limit(String user_limit) {
		this.user_limit = user_limit;
	}

	public String getUser_secret() {
		return user_secret;
	}

	public void setUser_secret(String user_secret) {
		this.user_secret = user_secret;
	}

	public String getUser_answer() {
		return user_answer;
	}

	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}

	public String getUser_avatar() {
		return user_avatar;
	}

	public void setUser_avatar(String user_avatar) {
		this.user_avatar = user_avatar;
	}

	public String getUser_color() {
		return user_color;
	}

	public void setUser_color(String user_color) {
		this.user_color = user_color;
	}
}
