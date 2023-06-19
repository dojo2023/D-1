package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Record;
public class RecordDao {

	public List<Record> select(String user_addr) {
		Connection conn = null;
		List<Record> cardList = new ArrayList<Record>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// graph用でSELECT ￥￥USER_NICKNAMEをUSER_NUMに変えました
			String sql = " SELECT m_record.record_date, SUM(m_foods.foods_cal) AS totalcal\r\n"
					+ "\r\n"
					+ "FROM m_user \r\n"
					+ "\r\n"
					+ "LEFT JOIN m_record ON m_user.user_num = m_record.user_num \r\n"
					+ "\r\n"
					+ "LEFT JOIN m_foods ON m_record.foods_num = m_foods.foods_num \r\n"
					+ "\r\n"
					+ "WHERE M_USER.USER_ADDR = ? \r\n"
					+ "\r\n"
					+ "GROUP BY m_record.record_date; ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, user_addr);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Record card = new Record(
				rs.getString("RECORD_DATE"),
				rs.getDouble("TOTALCAL")
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


	public List<Record> select1(Record param) {
		Connection conn = null;
		List<Record> cardList = new ArrayList<Record>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 朝昼夜でSELECT　
			String sql = "SELECT M_USER.USER_NUM, M_RECORD.RECORD_DATE, "
				    + "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '1' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS breakfast, "
				    + "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '2' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS lunch, "
				    + "       SUM(CASE WHEN M_RECORD.RECORD_TYPE = '3' THEN M_FOODS.FOODS_CAL ELSE 0 END) AS dinner "
				    + "FROM M_USER "
				    + "JOIN M_RECORD ON M_USER.USER_NUM = M_RECORD.USER_NUM "
				    + "JOIN M_FOODS ON M_RECORD.FOODS_NUM = M_FOODS.FOODS_NUM "
				    + "WHERE M_USER.USER_NUM = ? "
				    + "GROUP BY M_USER.USER_NUM, M_RECORD.RECORD_DATE;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			if (param.getUser_num() != 0) {
			    pStmt.setInt(1, param.getUser_num());
			} else {
			    pStmt.setString(1, "%");
			}


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Record card = new Record(
				rs.getInt("USER_NUM"),
				rs.getString("RECORD_DATE"),
				rs.getDouble("BREAKFAST"),
				rs.getDouble("LUNCH"),
				rs.getDouble("DINNER")

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
