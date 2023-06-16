package model;
import java.io.Serializable;
public class Register implements Serializable {
	private int user_num;
	private String record_date;
	private int record_type;
	private int foods_num;

	public Register(int user_num, String record_date, int record_type, int foods_num) {

		this.user_num = user_num;
		this.record_date = record_date;
		this.record_type = record_type;
		this.foods_num = foods_num;
	}

	//登録時
	public Register(String record_date, int record_type, int foods_num) {

		this.record_date = record_date;
		this.record_type = record_type;
		this.foods_num = foods_num;
	}

	//初期値？
	public Register() {
		this.user_num = 0;
		this.record_date = "";
		this.record_type = 0;
		this.foods_num = 0;
	}

	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public int getRecord_type() {
		return record_type;
	}
	public void setRecord_type(int record_type) {
		this.record_type = record_type;
	}
	public int getFoods_num() {
		return foods_num;
	}
	public void setFoods_num(int foods_num) {
		this.foods_num = foods_num;
	}

}
