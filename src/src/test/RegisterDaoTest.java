package test;
import java.util.List;

import dao.RegisterDao;
import model.Register;

public class RegisterDaoTest {
	public static void main(String[] args) {
		RegisterDao dao = new RegisterDao();

		// select()のテスト
		System.out.println("---------- select()のテスト ----------");

		List<Register> cardList = dao.select(new Register());
		for (Register card : cardList) {
			System.out.println("FOODS_NUM：" + card.getFoods_num());
			System.out.println("RECORD_DATE：" + card.getRecord_date());
			System.out.println("RECORD_TYPE：" + card.getRecord_type());
			System.out.println("FOODS_NUM：" + card.getFoods_num());
			System.out.println();
		}
		// insert()のテスト
		System.out.println("---------- insert()のテスト ----------");
		Register insRec = new Register(200, "2023-06-30", 2, 100);
		if (dao.insert(insRec)) {
			System.out.println("登録成功！");
			List<Register> cardList2 = dao.select(insRec);
			for (Register card : cardList2) {
				System.out.println("USER_NUM：" + card.getUser_num());
				System.out.println("RECORD_DATE：" + card.getRecord_date());
				System.out.println("RECORD_TYPE：" + card.getRecord_type());
				System.out.println("FOODS_NUM：" + card.getFoods_num());
				System.out.println();
			}
		}
		else {
			System.out.println("登録失敗！");
		}

}
}

