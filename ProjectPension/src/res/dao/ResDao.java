package res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConn;
import res.vo.ResVo;

public class ResDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public List<ResVo> getResList() {
		List<ResVo> resList = new ArrayList<ResVo>();

		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select to_char(v.in_date,'yyyy-mm-dd')in_date,r.room_num,r.room_name,v.checked ";
			sql += "from reserve v left join room r ";
			sql += "on v.room_code = r.room_code ";
			sql += "where in_date >= sysdate-1";
			sql += "order by in_date, room_num";
			pstmt = conn.prepareStatement(sql);

			pstmt.execute();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				String inDate = rs.getString("in_date");
				int roomNum = rs.getInt("room_num");
				String roomName = rs.getString("room_name");
				int checked = rs.getInt("checked");
				ResVo rvo = new ResVo(inDate, roomNum, roomName, checked);
				resList.add(rvo);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return resList;
	}

	public List<ResVo> getRoomRes(int roomNum) {

		List<ResVo> resList = new ArrayList<ResVo>();

		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select to_char(v.in_date,'yyyy-mm-dd')in_date,r.room_num,r.room_name, v.checked ";
			sql += "from reserve v left join room r ";
			sql += "on v.room_code = r.room_code ";
			sql += "where room_num = ?";
			sql += "order by in_date, room_num";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNum);

			pstmt.execute();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				String inDate = rs.getString("in_date");
				String roomName = rs.getString("room_name");
				int checked = rs.getInt("checked");
				ResVo rvo = new ResVo(inDate, roomNum, roomName, checked);
				resList.add(rvo);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return resList;
	}

	public void insertResv(int roomCode, int custNum, String in_date, int headcount, int cost) {
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "insert into reserve(res_num, room_code, cust_num, in_date, headcount, cost)";
			sql += "values((select nvl(max(res_num),0)+1 from reserve),?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomCode);
			pstmt.setInt(2, custNum);
			pstmt.setString(3, in_date);
			pstmt.setInt(4, headcount);
			pstmt.setInt(5, cost);

			pstmt.execute();

	
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
	}
	
	public List<ResVo> getResCheck() {
		List<ResVo> resList = new ArrayList<ResVo>();

		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select res_num, cust_num";
			sql += " from reserve";

			pstmt = conn.prepareStatement(sql);

			pstmt.execute();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				int resNum = rs.getInt("res_num");
				int custNum = rs.getInt("cust_num");
				ResVo rvo = new ResVo(resNum, custNum);
				resList.add(rvo);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return resList;
	}

	public int getResNum(int room_code, int custNum, String in_date) {
		int resNum = 0;
		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select res_num";
			sql += " from reserve";
			sql += " where room_code = ?";
			sql += " and cust_num = ?";
			sql += " and in_date = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room_code);
			pstmt.setInt(2, custNum);
			pstmt.setString(3, in_date);

			pstmt.execute();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				resNum = rs.getInt("res_num");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return resNum;
	}

	public void setOutDate(int res_num) {
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "update reserve";
			sql += " set out_date = (select in_date+1 from reserve where res_num= ?)";
			sql += " where res_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_num);
			pstmt.setInt(2, res_num);
			
			pstmt.execute();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
	}

	public void cancelResv(int res_num) {
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "update reserve";
			sql += " set checked = 2";
			sql += " where res_num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_num);
			
			pstmt.execute();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
	}

}
