package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Loggedin;
import model.User;

public class UserDao {
	public boolean isLoginOK(User user) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

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

	public List<User> select(String addr) {
		Connection conn = null;
		List<User> cardList = new ArrayList<User>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// USER_ADDR, USER_PW, USER_SECRET, USER_ANSWER以外全部入れた(selectに) --> 入れなかったらテストでエラーが出るので入れるようにしました。。
			String sql = "select USER_NUM, USER_ADDR, USER_PW, USER_SECRET, USER_ANSWER, USER_NICKNAME, USER_HEIGHT, USER_WEIGHT, USER_GENDER, USER_BIRTH, USER_GOALW, USER_LIMIT, USER_AVATAR, USER_COLOR from M_USER WHERE USER_ADDR = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// プレースホルダにログイン中のユーザーのmailを設定
	        pStmt.setString(1, addr);
	        System.out.println(addr);

			// SQL文を完成させる


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				User card = new User(
				rs.getInt("USER_NUM"),
				rs.getString("USER_ADDR"),
				rs.getString("USER_PW"),
				rs.getString("USER_NICKNAME"),
				rs.getDouble("USER_HEIGHT"),
				rs.getDouble("USER_WEIGHT"),
				rs.getInt("USER_GENDER"),
				rs.getDouble("USER_GOALW"),
				rs.getString("USER_BIRTH"),
				rs.getString("USER_LIMIT"),
				rs.getInt("USER_SECRET"),
				rs.getString("USER_ANSWER"),
				rs.getInt("USER_AVATAR"),
				rs.getInt("USER_COLOR")
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
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// 全ても項目を入れました（新規登録の時に使うと思うので）
			String sql = "insert into M_USER (USER_ADDR, USER_PW, USER_SECRET, USER_ANSWER) values (?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getUser_addr() != null && !card.getUser_addr().equals("")) {
				pStmt.setString(1, card.getUser_addr());
			}
			else {
				pStmt.setString(1, null);
			}

			if (card.getUser_pw() != null && !card.getUser_pw().equals("")) {
				pStmt.setString(2, card.getUser_pw());
			}
			else {
				pStmt.setString(2, null);
			}

			if (card.getUser_secret() != 0) {
				pStmt.setInt(3, card.getUser_secret());
			}
			else {
				pStmt.setInt(3, 0);
			}
			if (card.getUser_answer() != null && !card.getUser_limit().equals("")) {
				pStmt.setString(4, card.getUser_answer());
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


	public boolean update(User card2) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// プロフィール画面で変更する時のコード
			String sql = "update M_USER set USER_NICKNAME=?, USER_HEIGHT=?, USER_WEIGHT=?, USER_GENDER=?, USER_GOALW=?, USER_BIRTH=?, USER_LIMIT=?, USER_AVATAR=?, USER_COLOR=?  where USER_ADDR=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			if (card2.getUser_nickname() != null && !card2.getUser_nickname().equals("")) {
				pStmt.setString(1, card2.getUser_nickname());
			}
			else {
				pStmt.setString(1, null);
			}

			if (card2.getUser_height() != 0) {
				pStmt.setDouble(2, card2.getUser_height());
			}
			else {
				pStmt.setDouble(2, 0);
			}

			if (card2.getUser_weight() != 0) {
				pStmt.setDouble(3, card2.getUser_weight());
			}
			else {
				pStmt.setDouble(3, 0);
			}

			if (card2.getUser_gender() != 0) {
				pStmt.setDouble(4, card2.getUser_gender());
			}
			else {
				pStmt.setDouble(4, 0);
			}

			if (card2.getUser_goalw() != 0) {
				pStmt.setDouble(5, card2.getUser_goalw());
			}
			else {
				pStmt.setDouble(5, 0);
			}

			if (card2.getUser_birth() != null && !card2.getUser_birth().equals("")) {
				pStmt.setString(6, card2.getUser_birth());
			}
			else {
				pStmt.setString(6, null);
			}

			if (card2.getUser_limit() != null && !card2.getUser_limit().equals("")) {
				pStmt.setString(7, card2.getUser_limit());
			}
			else {
				pStmt.setString(7, null);
			}

			if (card2.getUser_avatar() != 0) {
				pStmt.setInt(8, card2.getUser_avatar());
			}
			else {
				pStmt.setInt(8, 0);
			}

			if (card2.getUser_color() != 0) {
				pStmt.setInt(9, card2.getUser_color());
			}
			else {
				pStmt.setInt(9, 0);
			}

			pStmt.setString(10, card2.getUser_addr());

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
			ResultSet rs=pStmt.executeQuery();
			rs.getString("nickname");
			System.out.println(rs.getString("nickname"));

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

	public boolean updateAddrPw1(String user_addr,String user_pw, String session_now) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// Addr, Pwの変更
			String sql = "update M_USER set user_addr = ?  where USER_ADDR=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, user_addr);


				pStmt.setString(2, (session_now)); // session



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

	public boolean updateAddrPw2(String user_addr,String user_pw, String session_now) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// Addr, Pwの変更
			String sql = "update M_USER set user_pw = ?  where USER_ADDR=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, user_pw);


				pStmt.setString(2, (session_now)); // session



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

	public boolean seekPw(String user_addr,String user_pw) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			// Addr, Pwの変更
			String sql = "update M_USER set user_pw = ?  where USER_ADDR=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, user_pw);


				pStmt.setString(2, user_addr); // session



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
	//↑たぶん

	//user_numを取得
	public int getNum(Loggedin user) {
		int id = 0;
		Connection conn = null;

		try {

			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

			String sql = "SELECT USER_NUM FROM M_USER WHERE USER_ADDR = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, user.getId());
			ResultSet rs = pStmt.executeQuery();

			rs.next();
			id = rs.getInt("USER_NUM");

		}catch(SQLException e ) {

		}catch(ClassNotFoundException e) {

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
		return id;
	}

	//graph用メソッド
	public List<User> selectByUserAddress(String user_addr) {
	    Connection conn = null;
	    List<User> userList = new ArrayList<>();

	    try {
	        // JDBCドライバを読み込む
	        Class.forName("org.h2.Driver");

	        // データベースに接続する
	        conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

	        // SQLクエリを作成
	        String sql = "SELECT *, TIMESTAMPDIFF(YEAR, user_birth, CURDATE()) AS USER_AGE FROM M_USER WHERE USER_ADDR = ? ORDER BY USER_NUM";
			String sql2 = "select count(*) from M_USER where USER_ADDR = ?";
	        PreparedStatement pStmt = conn.prepareStatement(sql);
	        PreparedStatement pStmt2 = conn.prepareStatement(sql2);

	        // プレースホルダにログイン中のユーザーのmailを設定
	        pStmt.setString(1, user_addr);
	        pStmt2.setString(1, user_addr);
	        System.out.println(user_addr);

	        // SQL文を実行し、結果セットを取得
	        ResultSet rs = pStmt.executeQuery();
	        System.out.println("hello");
	        ResultSet rs2 = pStmt2.executeQuery();
	        System.out.println("hello");

			// ユーザーID一致するユーザーがいたかどうかをチェックする
			rs2.next();
			System.out.println(rs2.getInt("count(*)"));

			if (rs2.getInt("count(*)") == 1) {
				while (rs.next()) {
		            User user = new User(
	            		rs.getInt("USER_NUM"),
	    				rs.getString("USER_ADDR"),
	    				rs.getString("USER_PW"),
	    				rs.getString("USER_NICKNAME"),
	    				rs.getDouble("USER_HEIGHT"),
	    				rs.getDouble("USER_WEIGHT"),
	    				rs.getInt("USER_GENDER"),
	    				rs.getDouble("USER_GOALW"),
	    				rs.getString("USER_BIRTH"),
	    				rs.getString("USER_LIMIT"),
	    				rs.getInt("USER_SECRET"),
	    				rs.getString("USER_ANSWER"),
	    				rs.getInt("USER_AVATAR"),
	    				rs.getInt("USER_COLOR"),
	    				rs.getInt("USER_AGE")
	    			);
		            userList.add(user);
		        }
			}

	        // 結果セットからデータを取得し、Userオブジェクトを作成してリストに追加

	        System.out.println(userList);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        userList = null;
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        userList = null;
	    } finally {
	        // データベースを切断
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	                userList = null;
	            }
	        }
	    }

	    // 結果を返す
	    return userList;
	}

	//addr存在検出
	public List<User> checkEmailExistence(String user_addr) {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    List<User> userList = new ArrayList<>();


	    try {
	        conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");
	        String query = "SELECT COUNT(*) as ex, USER_NUM, USER_SECRET, USER_ANSWER FROM M_USER WHERE USER_ADDR = ?";
	        stmt = conn.prepareStatement(query);
	        stmt.setString(1, user_addr);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            User card = new User(
	            	rs.getInt("ex"),
	                rs.getInt("USER_SECRET"),
	                rs.getString("USER_ANSWER")
	            );
	            userList.add(card);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 데이터베이스 연결 해제
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    return userList;
	}

	// 既にメールアドレスが登録されているか
	public User findByEmail(String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User user = null;

		try {
	        conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");

	        String sql = "SELECT * FROM m_user WHERE USER_ADDR = ?";
	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, email);
	        rs = stmt.executeQuery();

	        if (rs.next()) {
	            // ユーザーが見つかった場合ユーザーアドレスを取得
	            user = new User();
	            user.setUser_addr(rs.getString("USER_ADDR"));

	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // エラーハンドリング
	    } finally {
	        // リソースのクローズ処理
	    }

    return user;
}
}