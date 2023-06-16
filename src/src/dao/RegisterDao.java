package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Register;
public class RegisterDao {

	public List<Register> select(Register param) {
		Connection conn = null;
		List<Register> cardList = new ArrayList<Register>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// SQL文を準備・ SELECT分でUSER_NUM,RECORD_DATEで検索する時使用
			String sql = "SELECT * FROM M_RECORD WHERE USER_NUM = ? AND RECORD_DATE = ? AND RECORD_TYPE = ? ORDER BY USER_NUM;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させるtestの時"%" + param.get＃＃) + "%"形式でエラー出たので変更しました。。
			if (param.getUser_num() != 0) {
				pStmt.setInt(1, param.getUser_num());
			}
			else {
				pStmt.setInt(1, 0);
			}
			if (param.getRecord_date() != null) {
				pStmt.setString(2, param.getRecord_date());
			}
			else {
				pStmt.setString(2, "%");
			}
			if (param.getRecord_type() != 0) {
				pStmt.setInt(3,param.getRecord_type());
			}
			else {
				pStmt.setInt(3, 0);
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Register card = new Register(
				rs.getInt("USER_NUM"),
				rs.getString("RECORD_DATE"),
				rs.getInt("RECORD_TYPE"),
				rs.getInt("FOODS_NUM")
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


	public boolean insert(Register card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 全ても項目を入れました（新規登録の時に使うと思うので）
			String sql = "INSERT INTO M_RECORD ( USER_NUM, RECORD_DATE, RECORD_TYPE, FOODS_NUM) VALUES(?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getUser_num() !=0) {
				pStmt.setInt(1, card.getUser_num());
			}
			else {
				pStmt.setInt(1, 0);
			}

			if (card.getRecord_date() != null && !card.getRecord_date().equals("")) {
				pStmt.setString(2, card.getRecord_date());
			}
			else {
				pStmt.setString(2, null);
			}

			if (card.getRecord_type() != 0) {
				pStmt.setInt(3, card.getRecord_type());
			}
			else {
				pStmt.setInt(3, 0);
			}
			if (card.getFoods_num() != 0) {
				pStmt.setInt(4, card.getFoods_num());
			}
			else {
				pStmt.setInt(4, 0);
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
