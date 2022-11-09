package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Test_ReplyDAO {
	private Connection conn;
	private ResultSet rs;
	
	public Test_ReplyDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul&useSSL=false";	
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	// 댓글 목록 페이지
	public ArrayList<Test_Reply> getList(int t_id, int pageNumber){ String
		SQL="SELECT * FROM test_REPLY WHERE tr_ID<? AND tr_Available=1 AND t_id=? ORDER BY tr_ID DESC LIMIT 10"; 
		ArrayList<Test_Reply> list =new ArrayList<Test_Reply>(); 
		try { 
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10); 
			pstmt.setInt(2, t_id);
			rs=pstmt.executeQuery(); 
			while(rs.next()) { 
				Test_Reply test_reply = new Test_Reply();
				test_reply.setTr_ID(rs.getInt(1));
				test_reply.setUserID(rs.getString(2));
				test_reply.setTr_Content(rs.getString(3));
				test_reply.setTr_Date(rs.getString(4)); 
				test_reply.setT_id(t_id);
				test_reply.setTr_Available(1); 
				list.add(test_reply);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list; 
	}

	public int getNext() {
		String SQL = "SELECT tr_ID FROM test_reply ORDER BY tr_ID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 댓글인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	// 댓글 목록
	public Test_Reply getTest_Reply(int t_id) {
		String SQL = "select * from test_reply where t_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, t_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Test_Reply test_reply = new Test_Reply();
				test_reply.setTr_ID(rs.getInt(1));
				test_reply.setUserID(rs.getString(2));
				test_reply.setTr_Content(rs.getString(3));
				test_reply.setTr_Date(rs.getString(4));
				test_reply.setT_id(rs.getInt(5));
				test_reply.setTr_Available(rs.getInt(6));
				return test_reply;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//댓글 작성
	public int write(int t_id, String tr_Content, String userID) {
		String SQL="INSERT INTO TEST_REPLY VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, tr_Content);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, t_id);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public String getUpdateTest_Reply(int tr_ID) {
		String SQL = "SELECT tr_Content FROM test_reply WHERE tr_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tr_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //오류
	}
	//댓글 수정
	public int update(int tr_ID, String tr_Content) {
		String SQL = "UPDATE test_reply SET tr_Content = ? WHERE tr_ID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, tr_Content);
			pstmt.setInt(2, tr_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//댓글 삭제
	public int delete(int t_id) {
		String SQL = "update test_reply set tr_Available = 0 where t_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, t_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
}
}
