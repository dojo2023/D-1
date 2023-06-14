package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {
	public boolean isLoginOK(User user) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/miffy", "sa", "");

			// SELECT文を準備する
			String sql = "select count(*) from M_USER where USER_ADDR = ? and USER_PW = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, user.getUser_addr());
			pStmt.setString(2, user.getUser_pw());

			System.out.println(user.getUser_addr());
			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			System.out.println(rs.getInt("count(*)"));
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
			System.out.println("oh my god.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}

	public List<User> select(User param) {
		Connection conn = null;
		List<User> cardList = new ArrayList<User>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/miffy", "sa", "");

			// USER_ADDR, USER_PW, USER_SECRET, USER_ANSWER以外全部入れた
			String sql = "select USER_NICKNAME, USER_HEIGHT, USER_WEIGHT, USER_GENDER, USER_BIRTH, USER_GOALW, USER_LIMIT, USER_AVATAR, USER_COLOR from M_USER WHERE USER_NICKNAME LIKE ? AND USER_HEIGHT LIKE ? AND USER_WEIGHT LIKE ? AND USER_GENDER LIKE ? AND USER_BIRTH LIKE ? AND USER_GOALW LIKE ? AND USER_LIMIT LIKE ? AND USER_AVATAR LIKE ? AND USER_COLOR LIKE ?  ORDER BY USER_NUM";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getUser_nickname() != null) {
				pStmt.setString(1, "%" + param.getUser_nickname() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
			if (param.getUser_height() != null) {
				pStmt.setString(2, "%" + param.getUser_height() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}
			if (param.getUser_weight() != null) {
				pStmt.setString(3, "%" + param.getUser_weight() + "%");
			}
			else {
				pStmt.setString(3, "%");
			}
			if (param.getUser_gender() != null) {
				pStmt.setString(4, "%" + param.getUser_gender() + "%");
			}
			else {
				pStmt.setString(4, "%");
			}
			if (param.getUser_birth() != null) {
				pStmt.setString(5, "%" + param.getUser_birth() + "%");
			}
			else {
				pStmt.setString(5, "%");
			}
			if (param.getUser_goalw() != null) {
				pStmt.setString(6, "%" + param.getUser_goalw() + "%");
			}
			else {
				pStmt.setString(6, "%");
			}
			if (param.getUser_limit() != null) {
				pStmt.setString(7, "%" + param.getUser_limit() + "%");
			}
			else {
				pStmt.setString(7, "%");
			}
			if (param.getUser_avatar() != null) {
				pStmt.setString(8, "%" + param.getUser_avatar() + "%");
			}
			else {
				pStmt.setString(8, "%");
			}
			if (param.getUser_color() != null) {
				pStmt.setString(9, "%" + param.getUser_color() + "%");
			}
			else {
				pStmt.setString(9, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				User card = new User(
				rs.getString("USER_ADDR"),
				rs.getString("USER_PW"),
				rs.getString("USER_SECRET"),
				rs.getString("USER_NUM"),
				rs.getString("USER_ANSWER"),
				rs.getString("USER_NICKNAME"),
				rs.getString("USER_HEIGHT"),
				rs.getString("USER_WEIGHT"),
				rs.getString("USER_GENDER"),
				rs.getString("USER_BIRTH"),
				rs.getString("USER_GOALW"),
				rs.getString("USER_LIMIT"),
				rs.getString("USER_AVATAR"),
				rs.getString("USER_COLOR")
				);
				cardList.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}
			}
		}

		// 結果を返す
		return cardList;
	}


	public boolean insert(User card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/miffy", "sa", "");

			// 全ても項目を入れました（新規登録の時に使うと思うので）
			String sql = "insert into M_USER values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getUser_num() != null && !card.getUser_num().equals("")) {
				pStmt.setString(1, card.getUser_num());
			}
			else {
				pStmt.setString(1, null);
			}

			if (card.getUser_addr() != null && !card.getUser_addr().equals("")) {
				pStmt.setString(2, card.getUser_addr());
			}
			else {
				pStmt.setString(2, null);
			}

			if (card.getUser_pw() != null && !card.getUser_pw().equals("")) {
				pStmt.setString(3, card.getUser_pw());
			}
			else {
				pStmt.setString(3, null);
			}

			if (card.getUser_nickname() != null && !card.getUser_nickname().equals("")) {
				pStmt.setString(4, card.getUser_nickname());
			}
			else {
				pStmt.setString(4, null);
			}

			if (card.getUser_height() != null && !card.getUser_height().equals("")) {
				pStmt.setString(5, card.getUser_height());
			}
			else {
				pStmt.setString(5, null);
			}

			if (card.getUser_weight() != null && !card.getUser_weight().equals("")) {
				pStmt.setString(6, card.getUser_weight());
			}
			else {
				pStmt.setString(6, null);
			}

			if (card.getUser_gender() != null && !card.getUser_gender().equals("")) {
				pStmt.setString(7, card.getUser_gender());
			}
			else {
				pStmt.setString(7, null);
			}

			if (card.getUser_goalw() != null && !card.getUser_goalw().equals("")) {
				pStmt.setString(8, card.getUser_goalw());
			}
			else {
				pStmt.setString(8, null);
			}

			if (card.getUser_birth() != null && !card.getUser_birth().equals("")) {
				pStmt.setString(9, card.getUser_birth());
			}
			else {
				pStmt.setString(9, null);
			}

			if (card.getUser_limit() != null && !card.getUser_limit().equals("")) {
				pStmt.setString(10, card.getUser_limit());
			}
			else {
				pStmt.setString(10, null);
			}

			if (card.getUser_secret() != null && !card.getUser_secret().equals("")) {
				pStmt.setString(11, card.getUser_secret());
			}
			else {
				pStmt.setString(11, null);
			}
			if (card.getUser_avatar() != null && !card.getUser_avatar().equals("")) {
				pStmt.setString(12, card.getUser_avatar());
			}
			else {
				pStmt.setString(12, null);
			}
			if (card.getUser_color() != null && !card.getUser_color().equals("")) {
				pStmt.setString(13, card.getUser_color());
			}
			else {
				pStmt.setString(13, null);
			}

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}


	public boolean update(User card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/miffy", "sa", "");

			// 変更できる項目だけ入れました
			String sql = "update M_USER set USER_PW=?, USER_NICKNAME=?, USER_HEIGHT=?, USER_WEIGHT=?, USER_GENDER=?, USER_GOALW=?, USER_BIRTH=?, USER_LIMIT=?, USER_AVATAR=? USER_COLOR=?  where USER_NUM=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getUser_pw() != null && !card.getUser_pw().equals("")) {
				pStmt.setString(1, card.getUser_pw());
			}
			else {
				pStmt.setString(1, null);
			}

			if (card.getUser_nickname() != null && !card.getUser_nickname().equals("")) {
				pStmt.setString(2, card.getUser_nickname());
			}
			else {
				pStmt.setString(2, null);
			}

			if (card.getUser_height() != null && !card.getUser_height().equals("")) {
				pStmt.setString(3, card.getUser_height());
			}
			else {
				pStmt.setString(3, null);
			}

			if (card.getUser_weight() != null && !card.getUser_weight().equals("")) {
				pStmt.setString(4, card.getUser_weight());
			}
			else {
				pStmt.setString(4, null);
			}

			if (card.getUser_gender() != null && !card.getUser_gender().equals("")) {
				pStmt.setString(5, card.getUser_gender());
			}
			else {
				pStmt.setString(5, null);
			}

			if (card.getUser_goalw() != null && !card.getUser_goalw().equals("")) {
				pStmt.setString(6, card.getUser_goalw());
			}
			else {
				pStmt.setString(6, null);
			}

			if (card.getUser_birth() != null && !card.getUser_birth().equals("")) {
				pStmt.setString(7, card.getUser_birth());
			}
			else {
				pStmt.setString(7, null);
			}

			if (card.getUser_limit() != null && !card.getUser_limit().equals("")) {
				pStmt.setString(8, card.getUser_limit());
			}
			else {
				pStmt.setString(8, null);
			}

			if (card.getUser_avatar() != null && !card.getUser_avatar().equals("")) {
				pStmt.setString(9, card.getUser_avatar());
			}
			else {
				pStmt.setString(9, null);
			}

			if (card.getUser_color() != null && !card.getUser_color().equals("")) {
				pStmt.setString(10, card.getUser_color());
			}
			else {
				pStmt.setString(10, null);
			}

			pStmt.setString(11, card.getUser_num());

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}

	//delete文いらない？



}
