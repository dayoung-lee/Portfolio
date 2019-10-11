package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import user.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// connect to mysql
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/projectdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "ekdud521";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("connect to mysql success.");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// login
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // login success
				}else
					return 0; // password not correct				
			} 
			return -1; // can't find the id			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // database error
	}
	// date to string
	public Date stringToDate(User user) {
		String year = user.getUserbirthyy();
		String month = user.getUserbirthmm();
		String day = user.getUserbirthdd();
		System.out.println(day);
		Date birthday = Date.valueOf(year+"-"+month+"-"+day);		
		System.out.println(birthday);

		return birthday;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,?)";
		stringToDate(user);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserFirstName());
			pstmt.setString(4,  user.getUserLastName());
			pstmt.setDate(5, stringToDate(user));
			pstmt.setString(6,  user.getUserEmail());
			pstmt.setString(7,  user.getUserPhoneNumber());
			pstmt.setString(8,  user.getUserAddress());			
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	// get user information
	public User getUserInfo(String userID) {
		String SQL = "SELECT * FROM USER WHERE userID=? ";		
		/*userID, userPassword, FirstName, LastName, birthday, email, phoneNumber, Address */
		User user = null;
		try {			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			user = new User(); // DAO
			if(rs.next()) { 			
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserFirstName(rs.getString("FirstName"));
				user.setUserLastName(rs.getString("LastName"));
				user.setUserbirthyy(rs.getString("birthday"));				
				user.setUserEmail(rs.getString("email"));
				user.setUserPhoneNumber(rs.getString("PhoneNumber"));
				user.setUserAddress(rs.getString("Address"));
			}			
			return user;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	// update user information
	public int updateUser(String userID, String userPassword, String email, String phoneNumber, String address) {
		String SQL = "UPDATE user SET userPassword=?, email=?, PhoneNumber=?, Address=? WHERE userID=?";
		try {
			System.out.println(userID + " " +userPassword);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);			
			pstmt.setString(2, email);
			pstmt.setString(3, phoneNumber);
			pstmt.setString(4, address);
			pstmt.setString(5, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
