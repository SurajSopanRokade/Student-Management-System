package com.proj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.proj.model.UserInfo;
import com.proj.utility.DBConnectivity;

public class UserinfodaoImp implements Userinfodao{


	@Override
	public void saveUserInfo(UserInfo c) {
		// TODO Auto-generated method stub
		Connection con;
		try {
			con = DBConnectivity.getConnection();
			String sql = "INSERT INTO signup (username, userpass,email, dateofbirth,contactno) "
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getUsername());
			ps.setString(2, c.getUserpass());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getDateofbirth());
			ps.setString(5, c.getContactno());
			
			int rs = ps.executeUpdate();
			if (rs > 0) {
                System.out.println("A new record has been inserted successfully.");
            }
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("An error occurred while inserting the record: " + e.getMessage());
		}
	}

	@Override
	public void updateUserInfo(UserInfo c) {
		// TODO Auto-generated method stub
		Connection con;
		PreparedStatement ps;
	
		try {
			con=DBConnectivity.getConnection();
			ps=con.prepareStatement("update signup set username=?, userpass=?, userroles=?, email=?, dateofbirth=?, contactno=? where userid=?");
			ps.setString(1, c.getUsername());
			ps.setString(2, c.getUserpass());
			ps.setInt(3, c.getUserroles());
			ps.setString(4, c.getEmail());
			ps.setString(5, c.getDateofbirth());
			ps.setString(6, c.getContactno());
			ps.setInt(7, c.getUserid());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUserInfo(int id) {
		// TODO Auto-generated method stub
		Connection con;
		PreparedStatement ps;
		try {
			con=DBConnectivity.getConnection();
			ps=con.prepareStatement("Delete from signup where userid="+id);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserInfo searchUserInfoById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int Login(UserInfo c) {
		// TODO Auto-generated method stub
		System.out.println("in login");
		Connection con;
		int userrole = 0;
		try {
			con = DBConnectivity.getConnection();
			PreparedStatement ps = con.prepareStatement("select userroles from signup where username=? and userpass=?");
			ps.setString(1, c.getUsername());
			ps.setString(2, c.getUserpass());
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				userrole=rs.getInt(1);
				System.out.println(userrole);
				
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userrole;	
	}
	
	@Override
	public int getUserid(UserInfo c) {
		// TODO Auto-generated method stub
		Connection con;
		int userid = 0;
		try {
			con = DBConnectivity.getConnection();
			PreparedStatement ps = con.prepareStatement("select userid from signup where username=? and userpass=?");
			ps.setString(1, c.getUsername());
			ps.setString(2, c.getUserpass());
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				userid=rs.getInt(1);
				System.out.println(userid);
				
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userid;	
	}
	
	
	
	
}
