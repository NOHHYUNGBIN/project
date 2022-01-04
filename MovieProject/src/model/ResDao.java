package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class ResDao {
	ResVo rvo;

	public int getPcode(ResVo rvo) {
		int pcode = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select p.pcode " + "from play p left join movie m " + "on p.mcode = m.mcode "
				+ "left join cinema c " + "on p.ccode = c.ccode " + "where to_char(pdate,'yymmddhh24mi') = ? "
				+ "and m.mname = ? " + "and c.cname = ? ";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvo.getpDate());
			pstmt.setString(2, rvo.getmName());
			pstmt.setString(3, rvo.getcName());

			rs = pstmt.executeQuery();
			if (rs.next()) {

				pcode = rs.getInt("pcode");

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

				e.printStackTrace();
			}
		}
		System.out.println(pcode);
		return pcode;
	}

	public ResVo getPData(int pcode) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select c.cname, m.mname, to_char(p.pdate,'yy/mm/dd hh24:mi') pdate, screen "
				+ "from play p left join movie m " + "on p.mcode = m.mcode " + "left join cinema c "
				+ "on p.ccode = c.ccode " + "where p.pcode = ?";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				String cname = rs.getString("cname");
				String mname = rs.getString("mname");
				String pdate = rs.getString("pdate");
				String screen = rs.getString("screen");
				rvo = new ResVo(cname, mname, pdate, screen);
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

				e.printStackTrace();
			}
		}

		return rvo;
	}

	public int getSeatInfo(int pcode, String seatNum) {
		int rcode = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT  NVL(RCODE,0) rcode ";
		sql += " fROM   SEAT  ";
		sql += " WHERE  PCODE = ? AND SEATNUM = ?";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			pstmt.setString(2, seatNum);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				rcode = rs.getInt("rcode");

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

				e.printStackTrace();
			}
		}

		return rcode;
	}

	public String insertRes(String userid, int pcode, int pcount, String pdate) {
		String result = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";

		conn = DBConn.getInstance();
		sql = "insert into res" + " values(seq_rcode.nextval,?,?,?,to_date(?,'yymmddhh24mi'))";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, pcode);
			pstmt.setInt(3, pcount);
			pstmt.setString(4, pdate);

			pstmt.executeUpdate();

			result = "예약완료";

		} catch (SQLException e) {
			switch (e.getErrorCode()) {
			case 1:
				result = "중복된 자료입니다";
				break;
			default:
				result = e.getMessage();
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

	public String updateSeat(int pcode, String seat, int rcode) {
		String result = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";

		conn = DBConn.getInstance();
		sql = "update seat set rcode = ?";
		sql += " where pcode = ? and seatnum = ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rcode);
			pstmt.setInt(2, pcode);
			pstmt.setString(3, seat);

			pstmt.executeUpdate();

			result = "예약완료";

		} catch (SQLException e) {
			switch (e.getErrorCode()) {
			case 1:
				result = "중복된 자료입니다";
				break;
			default:
				result = e.getMessage();
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

	public void deleteRes(int rcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete " + "from  res " + "where rcode = ? ";
		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcode);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}

	public int getRcode(String userid, int pcode) {
		int rcode = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(rcode) rcode" + " from  res " + " where userid = ?" + " and   pcode  = ?";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, pcode);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				rcode = rs.getInt("rcode");

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

				e.printStackTrace();
			}
		}
		return rcode;
	}

	public Vector getDataList(String userid) {
		Vector outV = new Vector();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select r.rcode,c.cname,m.mname,p.screen,s.seatnum,p.pdate" 
				   + " from seat s"
				   + " join res r on r.rcode = s.rcode" + " join play p on p.pcode = r.pcode"
				   + " join cinema c on p.ccode = c.ccode" + " join movie m on m.mcode = p.mcode"
				   + " join user1 u on u.userid = r.userid" + " where u.userid = ? "
				   + " order by pdate,rcode";
		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Vector v = new Vector();
				v.add(rs.getInt("rcode"));
				v.add(rs.getString("cname"));
				v.add(rs.getString("mname"));
				v.add(rs.getString("screen"));
				v.add(rs.getString("seatnum"));
				v.add(rs.getString("pdate"));
				outV.add(v);
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
		return outV;
	}
}