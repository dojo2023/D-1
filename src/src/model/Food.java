package model;
import java.io.Serializable;
public class Food implements Serializable {
	private int foods_num;
	private double foods_cal;
	private String foods_category;
	private String foods_name;

	public Food(int foods_num, double foods_cal, String foods_category, String foods_name) {

		this.foods_num = foods_num;
		this.foods_cal = foods_cal;
		this.foods_category = foods_category;
		this.foods_name = foods_name;
	}
	//初期値？
	public Food() {
		this.foods_num = 0;
		this.foods_cal = 0;
		this.foods_category = "";
		this.foods_name = "";
	}

	//プルダウン検索時に使用
	public Food(String foods_category) {
		this.foods_category = foods_category;
	}

	//品目登録時に使用
	public Food(double foods_cal, String foods_category, String foods_name) {
		this.foods_cal = foods_cal;
		this.foods_category = foods_category;
		this.foods_name = foods_name;
	}

	public int getFoods_num() {
		return foods_num;
	}

	public void setFoods_num(int foods_num) {
		this.foods_num = foods_num;
	}

	public double getFoods_cal() {
		return foods_cal;
	}

	public void setFoods_cal(double foods_cal) {
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
