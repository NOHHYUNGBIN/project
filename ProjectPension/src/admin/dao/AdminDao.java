package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.AdminVo;
import db.DBConn;
import res.vo.ResVo;

public class AdminDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public List<AdminVo> AdminList() {
		List<AdminVo> adminList = new ArrayList<AdminVo>();

		ResultSet rs = null;

		try {
			DBConn db = new DBConn();
			conn = db.getConnection();
			String sql = "select * from admin_account";

			pstmt = conn.prepareStatement(sql);

			pstmt.executeQuery();

			rs = pstmt.getResultSet();

			while (rs.next()) {
				String admin_id = rs.getString("admin_id");
				String admin_pwd = rs.getString("admin_pwd");
				AdminVo avo = new AdminVo(admin_id,admin_pwd);
				adminList.add(avo);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return adminList;
	}
}
