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
			String sql = "select FOODS_NUM, FOODS_CATEGORY, FOODS_NAME, FOODS_CAL  from M_FOODS WHERE FOODS_CATEGORY LIKE ? AND FOODS_NAME LIKE ? ORDER BY  FOODS_CATEGORY";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getFoods_num() != 0) {
				pStmt.setString(1, "%" + param.getFoods_num() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
			if (param.getFoods_category() != null) {
				pStmt.setString(2, "%" + param.getFoods_category() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}
			if (param.getFoods_name() != null) {
				pStmt.setString(3, "%" + param.getFoods_name() + "%");
			}
			else {
				pStmt.setString(3, "%");
			}
			if (param.getFoods_cal() != 0) {
				pStmt.setString(4, "%" + param.getFoods_cal() + "%");
			}
			else {
				pStmt.setString(4, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Food card = new Food(
				rs.getInt("FOODS_NUM"),
				rs.getString("FOODS_CATEGORY"),
				rs.getString("FOODS_NAME"),
				rs.getDouble("FOODS_CAL")
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
			String sql = "INSERT INTO M_FOODS ( FOODS_CATEGORY , FOODS_NAME , FOODS_CAL) VALUES(?, ?, ?)";
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

			if (card.getFoods_cal() != 0) {
				pStmt.setDouble(3, card.getFoods_cal());
			}
			else {
				pStmt.setString(3, null);
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


	public List<Food> search(Food param) {
		Connection conn = null;
		List<Food> cardList = new ArrayList<Food>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 全ての項目を入れました　
			String sql = "select FOODS_NAME, FOODS_CAL from M_FOODS WHERE FOODS_CATEGORY LIKE ? AND FOODS_NAME LIKE ?";
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

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Food card = new Food();
				card.setFoods_name(rs.getString("FOODS_NAME"));
				card.setFoods_cal(rs.getDouble("FOODS_CAL"));
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


	//カテゴリーをすべて取得
	public List<Food> cat_select () {
		Connection conn = null;
		List<Food> cardList = new ArrayList<Food>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");


			String sql = "SELECT DISTINCT FOODS_CATEGORY FROM M_FOODS";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			//結果を保存
			ResultSet rs = pStmt.executeQuery();

			while(rs.next()) {
				Food card = new Food(rs.getString("FOODS_CATEGORY"));
				cardList.add(card);
				System.out.println(rs.getString("FOODS_CATEGORY"));
			}
			System.out.println(cardList.get(0).getFoods_category());

		}catch (SQLException e) {


		}catch (ClassNotFoundException e) {
				e.printStackTrace();
				cardList = null;
		}finally {
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
		return cardList;
	}


}
