package model;
import java.io.Serializable;
public class Register implements Serializable {
	private String user_num;
	private String record_date;
	private String record_type;
	private String foods_num;

	public Register(String user_num, String record_date, String record_type, String foods_num) {

		this.user_num = user_num;
		this.record_date = record_date;
		this.record_type = record_type;
		this.foods_num = foods_num;
	}
	//初期値？
	public Register() {
		this.user_num = "";
		this.record_date = "";
		this.record_type = "";
		this.foods_num = "";
	}

	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public String getRecord_type() {
		return record_type;
	}
	public void setRecord_type(String record_type) {
		this.record_type = record_type;
	}
	public String getFoods_num() {
		return foods_num;
	}
	public void setFoods_num(String foods_num) {
		this.foods_num = foods_num;
	}

}
