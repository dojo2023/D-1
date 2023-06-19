package test;

import java.util.List;

import dao.RecordDao;
import model.Record;



public class RecordDaoTest {
	public static void main(String[] args) {
		RecordDao dao = new RecordDao();

		// select()のテスト
		System.out.println("---------- select()のテスト ----------");

		List<Record> cardList = dao.select(new Record());
		for (Record card : cardList) {
			System.out.println("RECORD_DATE：" + card.getRecord_date());
			System.out.println("TOTALCAL：" + card.getTotalcal());
			System.out.println();
		}
		// select()のテスト
				System.out.println("---------- select()のテスト ----------");

				List<Record> cardList2 = dao.select1(new Record());
				for (Record card : cardList2) {
					System.out.println("USER_NUM：" + card.getUser_num());
					System.out.println("RECORD_DATE：" + card.getRecord_date());
					System.out.println("BREAKFAST：" + card.getBreakfast());
					System.out.println("LUNCH：" + card.getLunch());
					System.out.println("DINNER：" + card.getDinner());
					System.out.println();
				}

}
}

