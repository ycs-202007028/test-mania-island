package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		//UserDAO 媛앹껜媛� �깮�꽦�맆�븣 諛붾줈 �뜲�씠�꽣踰좎씠�뒪 �젒洹쇳븯�룄濡� �깮�꽦�옄 �꽕�젙
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS??useUnicode=yes&characterEncoding=UTF8";
			String dbID = "root";
			String dbPassword = "root";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select pw from user where id= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 濡쒓렇�씤 �꽦怨�
				} else {
					return 0; // 鍮꾨�踰덊샇 遺덉씪移�
				}
			}
			return -1; // �븘�씠�뵒 �뾾�쓬
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB�삤瑜�
	}
	
	public int join(User user) {
		String SQL = "insert into user values (?, ?, ?, ?, ?, ?, ?, null, null)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getId());
			pstmt.setString(2,  user.getName());
			pstmt.setString(3,  user.getPw());
			pstmt.setString(4,  user.getBirth());
			pstmt.setString(5,  user.getEmail());
			pstmt.setString(6,  user.getGender());
			pstmt.setString(7,  user.getMbti());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public int delete(int b_ID) { //ReplyDAO.java 참고하고 만든거
		String SQL = "delete from user where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, b_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
