package board;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import board.bbs;

public class bbsDAO {

	private Connection conn;
	private ResultSet rs;

	// connect to mysql
	public bbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/projectdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "ekdud521";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("connect to mysql success.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get bbsID number
	public int getNext() {
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // first text
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // database error
	}
	
	// get date
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	// insert
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	// get list
	public ArrayList<bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM bbs WHERE bbsID <? ORDER BY bbsID DESC LIMIT 10";
		ArrayList<bbs> list = new ArrayList<bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bbs Bbs = new bbs();
				Bbs.setBbsID(rs.getInt(1));
				Bbs.setBbsTitle(rs.getString(2));
				Bbs.setUserID(rs.getString(3));
				Bbs.setBbsDate(rs.getString(4));
				Bbs.setBbsContent(rs.getString(5));		
				list.add(Bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// pageNumber
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM bbs WHERE bbsID <? ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// get content
	public bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bbs Bbs = new bbs();
				Bbs.setBbsID(rs.getInt(1));
				Bbs.setBbsTitle(rs.getString(2));
				Bbs.setUserID(rs.getString(3));
				Bbs.setBbsDate(rs.getString(4));
				Bbs.setBbsContent(rs.getString(5));				
				return Bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// update
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle=?, bbsContent=? WHERE bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// delete
	public int delete(int bbsID) {
		String SQL = "DELETE FROM BBS WHERE bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		}	
}
