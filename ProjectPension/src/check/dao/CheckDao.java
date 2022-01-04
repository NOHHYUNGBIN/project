package check.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import check.vo.CheckVo;
import db.DBConn;

public class CheckDao {
	private   Connection         conn   = null;
	private   PreparedStatement  pstmt  = null;
	
	public CheckVo getResvCheck(int resNum, int custNum) {
		CheckVo cVo = new CheckVo();
		ResultSet rs = null;
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select res.res_num, cust.cust_name, room.room_name, room.room_num, res.in_date, res.headcount, res.cost, res.checked";
			sql        += " from reserve res";
			sql        += " left join customer cust on res.cust_num = cust.cust_num";
			sql        += " left join room room on res.room_code = room.room_code";
			sql        += " where res.res_num = ?";
			sql        += " and cust.cust_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNum);
			pstmt.setInt(2, custNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int res_num = rs.getInt("res_num");
				String cust_name = rs.getString("cust_name");
				String room_name = rs.getString("room_name");
				int room_num = rs.getInt("room_num");
				String in_date = rs.getString("in_date");
				int headcount = rs.getInt("headcount");
				int cost = rs.getInt("cost");
				int checked = rs.getInt("checked");
				cVo = new CheckVo(res_num, cust_name, room_name, room_num, in_date, headcount, cost, checked);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}		

		return cVo;
	}
}
