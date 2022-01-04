package room.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConn;
import room.vo.RoomVo;

public class RoomDao {
	private   Connection         conn   = null;
	private   PreparedStatement  pstmt  = null;
	
	public RoomVo getRoomInfo(int roomNum) {
		RoomVo rVo = new RoomVo();
		ResultSet rs = null;
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select *";
			sql        += " from room";
			sql        += " where room_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int room_code = rs.getInt("room_code");
				String room_name = rs.getString("room_name");
				int room_num = rs.getInt("room_num");
				String room_type = rs.getString("room_type");
				int room_person = rs.getInt("room_person");
				int room_maxperson = rs.getInt("room_maxperson");
				int room_week_cost = rs.getInt("room_week_cost");
				int room_weekend_cost = rs.getInt("room_weekend_cost");
				rVo = new RoomVo(room_code, room_name, room_num, room_type, room_person, room_maxperson, room_week_cost, room_weekend_cost);
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
		
		return rVo;
	}

	public List<RoomVo> getRoomList() {
		List<RoomVo> roomList = new ArrayList<RoomVo>();
		ResultSet rs = null;
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select *";
			sql        += " from room";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int room_code = rs.getInt("room_code");
				String room_name = rs.getString("room_name");
				int room_num = rs.getInt("room_num");
				String room_type = rs.getString("room_type");
				int room_person = rs.getInt("room_person");
				int room_maxperson = rs.getInt("room_maxperson");
				int room_week_cost = rs.getInt("room_week_cost");
				int room_weekend_cost = rs.getInt("room_weekend_cost");
				RoomVo rVo = new RoomVo(room_code, room_name, room_num, room_type, room_person, room_maxperson, room_week_cost, room_weekend_cost);
				roomList.add(rVo);
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
		return roomList;
	}

	public RoomVo getRoomCode(int roomnum) {
		RoomVo rVo = null;
		ResultSet rs = null;
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select *";
			sql        += " from room";
			sql        += " where room_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomnum);
					
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int room_code = rs.getInt("room_code");
				String room_name = rs.getString("room_name");
				int room_num = rs.getInt("room_num");
				String room_type = rs.getString("room_type");
				int room_person = rs.getInt("room_person");
				int room_maxperson = rs.getInt("room_maxperson");
				int room_week_cost = rs.getInt("room_week_cost");
				int room_weekend_cost = rs.getInt("room_weekend_cost");
				rVo = new RoomVo(room_code, room_name, room_num, room_type, room_person, room_maxperson, room_week_cost, room_weekend_cost);
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
		return rVo;
	}

	
}
