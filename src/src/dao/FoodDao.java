package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Food;

public class FoodDao {

	public List<Food> select(Food param) {
		Connection conn = null;
		List<Food> cardList = new ArrayList<Food>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 全ての項目を入れました　
			String sql = "select FOODS_CATEGORY, FOODS_NAME, FOODS_CAL  from M_FOODS WHERE FOODS_CATEGORY LIKE ? AND FOODS_NAME LIKE ? FOODS_CAL LIKE ? ORDER BY  FOODS_NUM";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getFoods_category() != null) {
				pStmt.setString(1, "%" + param.getFoods_category() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
			if (param.getFoods_name() != null) {
				pStmt.setString(2, "%" + param.getFoods_name() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}
			if (param.getFoods_cal() != null) {
				pStmt.setString(3, "%" + param.getFoods_cal() + "%");
			}
			else {
				pStmt.setString(3, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Food card = new Food(
				rs.getString("FOOD_CATEGORY"),
				rs.getString("FOOD_NAME"),
				rs.getString("FOOD_CAL"),
				rs.getString("USER_NUM")
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

	public boolean insert(Food card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 全ても項目を入れました（新規登録の時に使うと思うので）
			String sql = "insert into M_FOODS values (?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getFoods_category() != null && !card.getFoods_category().equals("")) {
				pStmt.setString(1, card.getFoods_category());
			}
			else {
				pStmt.setString(1, null);
			}

			if (card.getFoods_name() != null && !card.getFoods_name().equals("")) {
				pStmt.setString(2, card.getFoods_name());
			}
			else {
				pStmt.setString(2, null);
			}

			if (card.getFoods_cal() != null && !card.getFoods_cal().equals("")) {
				pStmt.setString(3, card.getFoods_cal());
			}
			else {
				pStmt.setString(3, null);
			}

			if (card.getFoods_num() != null && !card.getFoods_num().equals("")) {
				pStmt.setString(4, card.getFoods_num());
			}
			else {
				pStmt.setString(4, null);
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


}