package model;
import java.io.Serializable;
public class Food implements Serializable {
	private String foods_num;
	private String foods_cal;
	private String foods_category;
	private String foods_name;

	public Food(String foods_num, String foods_cal, String foods_category, String foods_name) {

		this.foods_num = foods_num;
		this.foods_cal = foods_cal;
		this.foods_category = foods_category;
		this.foods_name = foods_name;
	}
	//初期値？
	public Food() {
		this.foods_num = "";
		this.foods_cal = "";
		this.foods_category = "";
		this.foods_name = "";
	}

	public Food(String foods_category) {
		this.foods_category = foods_category;
	}

	public String getFoods_num() {
		return foods_num;
	}

	public void setFoods_num(String foods_num) {
		this.foods_num = foods_num;
	}

	public String getFoods_cal() {
		return foods_cal;
	}

	public void setFoods_cal(String foods_cal) {
		this.foods_cal = foods_cal;
	}

	public String getFoods_category() {
		return foods_category;
	}

	public void setFoods_category(String foods_category) {
		this.foods_category = foods_category;
	}

	public String getFoods_name() {
		return foods_name;
	}

	public void setFoods_name(String foods_name) {
		this.foods_name = foods_name;
	}

}
