package test;

import java.util.List;

import dao.FoodDao;
import model.Food;

public class FoodDaoTest {
	public static void main(String[] args) {
		FoodDao dao = new FoodDao();

		// select()のテスト
		System.out.println("---------- select()のテスト ----------");

		List<Food> cardList = dao.select(new Food());
		for (Food card : cardList) {
			System.out.println("FOODS_NUM：" + card.getFoods_num());
			System.out.println("FOODS_CATEGORY：" + card.getFoods_category());
			System.out.println("FOODS_NAME：" + card.getFoods_name());
			System.out.println("FOODS_CAL：" + card.getFoods_cal());
			System.out.println();
		}
		// insert()のテスト
		System.out.println("---------- insert()のテスト ----------");
		Food insRec = new Food(202, "主食", "pizza", 5846.8);
		if (dao.insert(insRec)) {
			System.out.println("登録成功！");
			List<Food> cardList2 = dao.select(insRec);
			for (Food card : cardList2) {
				System.out.println("FOODS_NUM：" + card.getFoods_num());
				System.out.println("FOODS_CATEGORY：" + card.getFoods_category());
				System.out.println("FOODS_NAME：" + card.getFoods_name());
				System.out.println("FOODS_CAL：" + card.getFoods_cal());
				System.out.println();
			}
		}
		else {
			System.out.println("登録失敗！");
		}

}
}
