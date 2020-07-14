package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JjimDAO {

	private Connection conn;	//db에 접근하는 객체
	private ResultSet rs;
	
	public JjimDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bbs> getList(String userID, int pageNumber){
		String SQL = "SELECT * FROM BBS WHERE bbsID = (select bbsID from jjim where userID = ?) ORDER BY bbsID DESC LIMIT 10"; 
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBoardID(rs.getInt(1));
				bbs.setBbsID(rs.getInt(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setUserID(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsContent(rs.getString(6));
				bbs.setMap(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}

	
	public int write(String userID, int bbsID) {
		String SQL = "INSERT INTO jjim VALUES(?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Jjim> getJjim(String userID, int bbsID) {
		String SQL = "SELECT * FROM jjim WHERE userID = ? AND bbsID = ?";
		ArrayList<Jjim> list = new ArrayList<Jjim>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			pstmt.setInt(2,  bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Jjim jjim = new Jjim();
				jjim.setBbsID(rs.getInt(1));
				jjim.setUserID(rs.getString(2));
				list.add(jjim);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(String userID,int bbsID) {
		String SQL = "DELETE FROM jjim WHERE bbsID = ? AND userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}