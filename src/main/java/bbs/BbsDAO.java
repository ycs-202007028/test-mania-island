package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		//UserDAO 객체가 생성될때 바로 데이터베이스 접근하도록 생성자 설정
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
			String dbID = "root";
			String dbPassword = "root";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// getDate 현재시간 가져오기
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB 오류
	}
	
	// 다음글
	public int getNext() {
		String SQL = "select b_ID from board order by b_ID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	// 글쓰기 정보 -> DB에 추가
	public int write(String b_Title, String id, String b_Content) {
		String SQL = "insert into board values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, b_Title);
			pstmt.setString(3, id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, b_Content);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate(); // 0 이상의 결과 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	// 글목록
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "select * from board where b_ID < ? and b_Available = 1 order by b_ID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setB_ID(rs.getInt(1));
				bbs.setB_Title(rs.getString(2));
				bbs.setId(rs.getString(3));
				bbs.setB_Date(rs.getString(4));
				bbs.setB_Content(rs.getString(5));
				bbs.setB_Available(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 페이지 존재 유무
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from board where b_ID < ? and b_Available = 1 order by b_ID desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); //게시글 갯수 -> 페이지수 계산
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// 글 읽기
	public Bbs getBbs(int b_ID) {
		String SQL = "select * from board where b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, b_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setB_ID(rs.getInt(1));
				bbs.setB_Title(rs.getString(2));
				bbs.setId(rs.getString(3));
				bbs.setB_Date(rs.getString(4));
				bbs.setB_Content(rs.getString(5));
				bbs.setB_Available(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// 게시물 수정
	public int update(int b_ID, String b_Title, String b_Content) {
		String SQL = "update board set b_Title = ?, b_Content = ? where b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, b_Title);
			pstmt.setString(2, b_Content);
			pstmt.setInt(3, b_ID);
			return pstmt.executeUpdate(); // 0 이상의 결과 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	// 게시물 삭제
	public int delete(int b_ID) {
		String SQL = "update board set b_Available = 0 where b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, b_ID);
			return pstmt.executeUpdate(); // 0 이상의 결과 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
}
