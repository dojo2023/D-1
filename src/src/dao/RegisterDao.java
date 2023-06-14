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
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/miffy", "sa", "");

			// SQL文を準備・ SELECT分でUSER_NUM,RECORD_DATEで検索する時使用
			String sql = "SELECT M_USER.USER_NUM,  M_USER.USER_NICKNAME, M_RECORD.RECORD_DATE, \r\n"
					+ "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '1' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS breakfast,\r\n"
					+ "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '2' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS lunch,\r\n"
					+ "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '3' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS dinner\r\n"
					+ "FROM M_USER\r\n"
					+ "JOIN M_RECORD ON M_USER.USER_NUM = M_RECORD.USER_NUM\r\n"
					+ "JOIN M_FOODS ON M_RECORD.FOODS_NUM = M_FOODS.FOODS_NUM WHERE M_USER.USER_NUM = ? AND M_RECORD.RECORD_DATE = ?\r\n"
					+ "GROUP BY M_USER.USER_NICKNAME, M_RECORD.RECORD_DATE;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getUser_num() != 0) {
				pStmt.setString(1, "%" + param.getUser_num() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
			if (param.getRecord_date() != null) {
				pStmt.setString(2, "%" + param.getRecord_date() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Register card = new Register(
				rs.getInt("USER_NUM"),
				rs.getString("USER_NICKNAME"),
				rs.getString("RECORD_DATE"),
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

}
