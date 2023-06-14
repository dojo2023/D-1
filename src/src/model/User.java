package model;
import java.io.Serializable;

public class User implements Serializable {
	private int user_num;
	private String user_addr; // ID
	private String user_pw;	// PW
	private String user_nickname;
	private double user_height; //cm
	private double user_weight; //kg
	private int user_gender; //1male, 2female, 3other
	private double user_goalw; //kg
	private String user_birth; //date
	private String user_limit; //date
	private int user_secret;
	private String user_answer;
	private int user_avatar;
	private int user_color;

	public User(int user_secret, String user_nickname, double user_height, String user_pw, int user_gender,
			String user_limit, String user_birth, double user_weight, String user_answer, double user_goalw,
			int user_color, String user_addr, int user_avatar, int user_num) {

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
		this.user_secret = 0;
		this.user_nickname = "USER";
		this.user_height = 0;
		this.user_pw = "";
		this.user_gender = 0;
		this.user_limit = "0";
		this.user_birth = "0";
		this.user_weight = 0;
		this.user_answer = "0";
		this.user_goalw = 0;
		this.user_color = 0;
		this.user_addr = "";
		this.user_avatar = 0;
		this.user_num = 0;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
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

	public double getUser_height() {
		return user_height;
	}

	public void setUser_height(double user_height) {
		this.user_height = user_height;
	}

	public double getUser_weight() {
		return user_weight;
	}

	public void setUser_weight(double user_weight) {
		this.user_weight = user_weight;
	}

	public int getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(int user_gender) {
		this.user_gender = user_gender;
	}

	public double getUser_goalw() {
		return user_goalw;
	}

	public void setUser_goalw(double user_goalw) {
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

	public int getUser_secret() {
		return user_secret;
	}

	public void setUser_secret(int user_secret) {
		this.user_secret = user_secret;
	}

	public String getUser_answer() {
		return user_answer;
	}

	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}

	public int getUser_avatar() {
		return user_avatar;
	}

	public void setUser_avatar(int user_avatar) {
		this.user_avatar = user_avatar;
	}

	public int getUser_color() {
		return user_color;
	}

	public void setUser_color(int user_color) {
		this.user_color = user_color;
	}
}
