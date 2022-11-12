package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class ReplyDAO {

	public Connection conn;
	public ResultSet rs;
	
	public ReplyDAO() {
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
	public ArrayList<Reply> getList(int b_ID, int pageNumber){ String
		SQL="SELECT * FROM REPLY WHERE replyID<? AND replyAvailable=1 AND b_ID=? ORDER BY replyID DESC LIMIT 10"; 
		ArrayList<Reply> list =new ArrayList<Reply>(); 
		try { 
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10); 
			pstmt.setInt(2, b_ID);
			rs=pstmt.executeQuery(); 
			while(rs.next()) { 
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setUserID(rs.getString(2));
				reply.setReplyContent(rs.getString(3));
				reply.setR_Date(rs.getString(4)); 
				reply.setB_ID(b_ID);
				reply.setReplyAvailable(1); 
				list.add(reply);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list; 
	}

	public int getNext() {
		String SQL = "SELECT replyID FROM reply ORDER BY replyID DESC";
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
	public Reply getReply(int replyID) {
		String SQL = "select * from reply where replyID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setUserID(rs.getString(2));
				reply.setReplyContent(rs.getString(3));
				reply.setR_Date(rs.getString(4));
				reply.setB_ID(rs.getInt(5));
				reply.setReplyAvailable(rs.getInt(6));
				return reply;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//댓글 작성
	public int write(int b_ID, String replyContent, String userID) {
		String SQL="INSERT INTO REPLY VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, replyContent);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, b_ID);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	public String getUpdateReply(int replyID) {
		String SQL = "SELECT replyContent FROM reply WHERE replyID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
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
	public int update(int replyID, String replyContent) {
		String SQL = "UPDATE reply SET replyContent = ? WHERE replyID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyID);
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//댓글 삭제
	public int delete(int replyID) {
		String SQL = "update reply set b_Available = 0 where replyID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	}