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
			String sql = "SELECT * FROM M_RECORD WHERE USER_NUM = ? AND RECORD_DATE = ? AND RECORD_TYPE = ?;";
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
			if (param.getRecord_type() != 0) {
				pStmt.setString(3, "%" + param.getRecord_type() + "%");
			}
			else {
				pStmt.setString(3, "%");
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

}
