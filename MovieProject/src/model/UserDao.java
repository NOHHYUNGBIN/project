package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class UserDao {
	
	ArrayList<UserVo> list;
	String name;
	
	public String insertUser(UserVo user) {
		String result = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";

		conn = DBConn.getInstance();
		sql = "insert into user1(userid,userpwd,username,birth,phone)";
		sql += " values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getBirth());
			pstmt.setString(5, user.getPhone());

			pstmt.executeUpdate();

			result = "회원가입이 완료되었습니다.";

		} catch (SQLException e) {
			switch (e.getErrorCode()) {
			case 1:
				result = "중복된 아이디 입니다.";
				break;
			default:
				result = "관리자에게 문의바랍니다.";
			}
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
		
			} catch (SQLException e) {
			}
		}
		return result;

	}

	public ArrayList<UserVo> userLogin() {
		list = new ArrayList<UserVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select userid,userpwd " + "from user1";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String userid = rs.getString("userid");
				String userpwd = rs.getString("userpwd");
				UserVo uvo = new UserVo(userid, userpwd);
				list.add(uvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}
	
	public String getName(String userid) {
		name = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select username " 
				   + "from user1 "
				   + "where userid = ?";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("username");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
			}
		}
		return name;
	}
}
