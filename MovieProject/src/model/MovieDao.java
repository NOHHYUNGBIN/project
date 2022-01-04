package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDao {
	ArrayList<MovieVo> movieList, placeList, dayList, timeList;

	// 현재 상영중인 영화목록을 가져옴
	public ArrayList<MovieVo> MovieChoice() {
		movieList = new ArrayList<MovieVo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select mcode,mname,mgrade "
				   + "from movie "
				   + "order by mname";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String movieCode = rs.getString("mcode");
				String movieName = rs.getString("mname");
				int movieGrade = rs.getInt("mgrade");
				MovieVo mvo = new MovieVo(movieCode, movieName, movieGrade);
				movieList.add(mvo);
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
		return movieList;

	}

	// 영화선택시 상영하는 영화관 지점목록을 가져옴.
	public ArrayList<MovieVo> PlaceChoice(String movieName) {
		placeList = new ArrayList<MovieVo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select distinct c.cname " 
		           + "from movie m left join play p " 
				   + "on m.mcode = p.mcode "
				   + "left join cinema c " 
				   + "on p.ccode = c.ccode " 
				   + "where m.mname = ? "
				   + "order by c.cname";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String placeName = rs.getString("cname");
				MovieVo mvo = new MovieVo(placeName);
				placeList.add(mvo);
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
		return placeList;

	}

	public ArrayList<MovieVo> DayChoice(String movieName, String placeName) {
		dayList = new ArrayList<MovieVo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select distinct to_CHAR(p.pdate,'yy\"년\" mm\"월\" dd\"일\"') day "
				   + "from play p left join cinema c "
				   + "on p.ccode = c.ccode left join movie m "
				   + "on p.mcode = m.mcode "
				   + "where m.mname = ? "
				   + "and c.cname = ? "
				   + "and to_char(p.pdate, 'yymmdd') >= to_char(sysdate,'yymmdd') "
				   + "and to_char(p.pdate, 'yymmdd') <= to_char(sysdate+5,'yymmdd') "
				   + "order by day";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieName);
			pstmt.setString(2, placeName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String days = rs.getString("day");
				MovieVo mvo = new MovieVo(days);
				dayList.add(mvo);
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
		return dayList;
	}

	public ArrayList<MovieVo> TimeChoice(String movieName, String placeName, String day) {
		timeList = new ArrayList<MovieVo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select to_char(p.pdate,'hh24:mi') ptime "
				   + "from play p left join cinema c " 
				   + "on p.ccode = c.ccode "
				   + "left join movie m " 
				   + "on p.mcode = m.mcode " 
				   + "where m.mname = ? "
				   + "and c.cname = ? "
				   + "and to_char(p.pdate,'yymmdd') = ? "
				   + "and to_char(p.pdate,'yymmddhh24mi') >= to_char(sysdate+10/24/60,'yymmddhh24mi') "
				   + "order by p.pdate";

		try {
			conn = DBConn.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieName);
			pstmt.setString(2, placeName);
			pstmt.setString(3, day);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String days = rs.getString("ptime");
				MovieVo mvo = new MovieVo(days);
				timeList.add(mvo);
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
		return timeList;
	}
	

}
