package com.dao;

import java.sql.*;

public class Database {

	private static String Driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/banking-system";
	private static String name="admin";
	private static String pass="admin";
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Connection con=null;
		try {
			Class.forName(Driver);
			con=DriverManager.getConnection(url,name,pass);
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
