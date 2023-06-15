package test;

import dao.UserDao;
import model.User;
public class loginTest {
		public static void main(String[] args) {
			testIsLoginOK1();	// ユーザーが見つかる場合のテスト
			testIsLoginOK2();	// ユーザーが見つからない場合のテスト
		}


		public static void testIsLoginOK1() {
			UserDao dao = new UserDao();
			if (dao.isLoginOK(new User("AAAA@plus.com", "password"))) {
				System.out.println("testIsLoginOK1：テストが成功しました");
			}
			else {
				System.out.println("testIsLoginOK1：テストが失敗しました");
			}
		}

		public static void testIsLoginOK2() {
			UserDao dao = new UserDao();
			if (!dao.isLoginOK(new User("AAAA@plus.com", "pass"))) {
				System.out.println("testIsLoginOK2：テストが成功しました");
			}
			else {
				System.out.println("testIsLoginOK2：テストが失敗しました");
			}
		}
	}