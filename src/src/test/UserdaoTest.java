package test;
import java.util.List;

import dao.UserDao;
import model.User;

public class UserdaoTest {
	public static void main(String[] args) {
		/*
		UserDao dao = new UserDao();
		// select()のテスト
		System.out.println("---------- select()のテスト ----------");
		List<User> cardList2 = dao.select(new User());
		for (User card : cardList2) {
			System.out.println("USER_NUM：" + card.getUser_num());
			System.out.println("USER_ADDR：" + card.getUser_addr());
			System.out.println("USER_PW：" + card.getUser_pw());
			System.out.println("USER_NICKNAME：" + card.getUser_nickname());
			System.out.println("USER_GENDER：" + card.getUser_gender());
			System.out.println("USER_BIRTH：" + card.getUser_birth());
			System.out.println("USER_HEIGHT：" + card.getUser_height());
			System.out.println("USER_WEIGHT：" + card.getUser_weight());
			System.out.println("USER_GOALW：" + card.getUser_goalw());
			System.out.println("USER_LIMIT：" + card.getUser_limit());
			System.out.println("USER_SECRET：" + card.getUser_secret());
			System.out.println("USER_ANSWER：" + card.getUser_answer());
			System.out.println("USER_AVATAR：" + card.getUser_avatar());
			System.out.println("USER_COLOR：" + card.getUser_color());
			System.out.println();
		}

		// insert()のテスト
		System.out.println("---------- insert()のテスト ----------");//全身が書いているがUserDaoのinsert文通りADDR,PW,SECRET,ANSWERだけがが保存される
		User insRec = new User(10, "ap@gmail.com", "password", "aasaa", 131.4, 45.6, 2, 40.0, "2000-01-01", "2023-06-30", 3, "answer", 1, 3);

		if (dao.insert(insRec)) {
			System.out.println("登録成功！");
			List<User> cardList3 = dao.select(insRec);
			for (User card : cardList3) {
				System.out.println("USER_NUM：" + card.getUser_num());
				System.out.println("USER_ADDR：" + card.getUser_addr());
				System.out.println("USER_PW：" + card.getUser_pw());
				System.out.println("USER_NICKNAME：" + card.getUser_nickname());
				System.out.println("USER_GENDER：" + card.getUser_gender());
				System.out.println("USER_BIRTH：" + card.getUser_birth());
				System.out.println("USER_HEIGHT：" + card.getUser_height());
				System.out.println("USER_WEIGHT：" + card.getUser_weight());
				System.out.println("USER_GOALW：" + card.getUser_goalw());
				System.out.println("USER_LIMIT：" + card.getUser_limit());
				System.out.println("USER_SECRET：" + card.getUser_secret());
				System.out.println("USER_ANSWER：" + card.getUser_answer());
				System.out.println("USER_AVATAR：" + card.getUser_avatar());
				System.out.println("USER_COLOR：" + card.getUser_color());
				System.out.println();
			}
		}
		else {
			System.out.println("登録失敗！");
		}
		*/
		// update()のテスト
		//System.out.println("---------- update()のテスト ----------");
		//User upRec = new User(5/*USER_NUMが一致ないと更新できない*/, "ap@gmail.com", "password", "更新３", 131.4, 45.6, 2, 40.0, "20000101", "20230630", 3, "更新", 1, 3);
		/*
		if (dao.update(upRec)) {
			System.out.println("更新成功！");
			List<User> cardList4 = dao.select(upRec);
			for (User card : cardList4) {
				System.out.println("USER_NUM：" + card.getUser_num());
				System.out.println("USER_ADDR：" + card.getUser_addr());
				System.out.println("USER_PW：" + card.getUser_pw());
				System.out.println("USER_NICKNAME：" + card.getUser_nickname());
				System.out.println("USER_GENDER：" + card.getUser_gender());
				System.out.println("USER_BIRTH：" + card.getUser_birth());
				System.out.println("USER_HEIGHT：" + card.getUser_height());
				System.out.println("USER_WEIGHT：" + card.getUser_weight());
				System.out.println("USER_GOALW：" + card.getUser_goalw());
				System.out.println("USER_LIMIT：" + card.getUser_limit());
				System.out.println("USER_SECRET：" + card.getUser_secret());
				System.out.println("USER_ANSWER：" + card.getUser_answer());
				System.out.println("USER_AVATAR：" + card.getUser_avatar());
				System.out.println("USER_COLOR：" + card.getUser_color());
				System.out.println();
			}
		}
		else {
			System.out.println("更新失敗！");
		}


		// update()のテスト
		System.out.println("---------- update()のテスト ----------");
		String userAddr = "nakamura999@gmail.com";
		String userPw = "password";
		String session_now = "AAAA@plus.com";

		UserDao userDao = new UserDao();
		boolean updateResult = userDao.updateAddrPw1(userAddr, userPw, session_now);

		if (updateResult) {
		    System.out.println("変更成功!");
		} else {
		    System.out.println("変更失敗");
		}

		// delete()のテストなし
		*/


	UserDao dao = new UserDao();
	System.out.println("---------- select()のテスト ----------");
	String user_addr = "v@example.com";
	List<User> cardList = dao.checkEmailExistence(user_addr);{
	for (User card : cardList) {
	    System.out.println("USER_NUM：" + card.getUser_num());
	    System.out.println("USER_ADDR：" + card.getUser_addr());
	    System.out.println("USER_PW：" + card.getUser_pw());
	    System.out.println("USER_SECRET：" + card.getUser_secret());
	    System.out.println("USER_ANSWER：" + card.getUser_answer());

	    System.out.println();
	}
	}

	}
}
