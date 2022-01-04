package cust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cust.vo.CustomerVo;
import db.DBConn;


public class CustomerDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public int getCustInfo(String name, String tel) {
		int custNum = 0;
		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select cust_num";
			sql += " from customer ";
			sql += " where cust_name = ?";
			sql += " and tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);

			pstmt.execute();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				custNum = rs.getInt("cust_num");
				
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
		return custNum;
	}

	public void insertCust(CustomerVo custVo) {
		
		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "insert into customer(cust_num, cust_name, birth, tel)";
			sql += " values( (select nvl(max(cust_num),0)+1 from customer),?,?,?)  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custVo.getCust_name());
			pstmt.setString(2, custVo.getBirth());
			pstmt.setString(3, custVo.getTel());

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
