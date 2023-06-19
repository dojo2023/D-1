package model;


import java.io.Serializable;
public class Record implements Serializable{
	private int user_num;
	private String record_date;
	private int record_type;
	private int foods_num;
	private double breakfast;
	private double lunch;
	private double dinner;
	private double totalcal;


	//graph用
	public Record(String record_date,double totalcal) {
		this.record_date = record_date;
		this.totalcal = totalcal;
	}


	//朝昼夜別合計
	public Record(int user_num, String record_date, double breakfast, double lunch, double dinner){
		this.user_num = user_num;
		this.record_date = record_date;
		this.breakfast = breakfast;
		this.lunch = lunch;
		this.dinner = dinner;
	}







	public Record() {
		this.record_date = "";
		this.totalcal = 0;
		this.user_num = 0;
		this.record_type = 0;
		this.foods_num = 0;
		this.breakfast = 0;
		this.lunch = 0;
		this.dinner = 0;
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
	public double getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(double breakfast) {
		this.breakfast = breakfast;
	}
	public double getLunch() {
		return lunch;
	}
	public void setLunch(double lunch) {
		this.lunch = lunch;
	}
	public double getDinner() {
		return dinner;
	}
	public void setDinner(double dinner) {
		this.dinner = dinner;
	}
	public double getTotalcal() {
		return totalcal;
	}
	public void setTotalcal(double totalcal) {
		this.totalcal = totalcal;
	}


}
