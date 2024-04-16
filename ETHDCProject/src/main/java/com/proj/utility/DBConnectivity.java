package com.proj.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectivity {
	public DBConnectivity() {
		// TODO Auto-generated constructor stub
	}
	public static Connection getConnection () throws ClassNotFoundException, SQLException {
		Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ethdcprojectdb","root","root");
		return con;
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
