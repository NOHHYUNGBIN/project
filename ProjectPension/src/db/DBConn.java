package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private  String  driver = "oracle.jdbc.OracleDriver";
	private  String  dburl  = "jdbc:oracle:thin:@192.168.0.10:1521:xe";
	private  String  dbuid  = "pension";
	private  String  dbpwd  = "project";
	
	private  Connection  conn = null;
	
	public   Connection  getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(dburl, dbuid, dbpwd);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void  close() {
		try {
		   if(conn != null)	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
		
}


