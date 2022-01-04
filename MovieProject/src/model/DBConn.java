package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	// oracle
	private  static  String  driver = "oracle.jdbc.OracleDriver";
	private  static  String  url    = "jdbc:oracle:thin:@localhost:1521:xe";	
	private  static  String  dbuid  = "test";
	private  static  String  dbpwd  = "1234";
		
	private  static  Connection    conn = null;
	
	private  DBConn () {		
	}
	
	public  static  Connection   getInstance() {
		if( conn != null )
			return conn;
		
		try {
			Class.forName(driver);
			conn  =   DriverManager.getConnection(url, dbuid, dbpwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			//e.printStackTrace();
		}
		
		return  conn;
	}
	
	
	
}













