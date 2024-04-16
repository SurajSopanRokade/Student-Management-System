package com.proj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proj.model.Courses;
import com.proj.model.Grade;
import com.proj.model.UserInfo;
import com.proj.utility.DBConnectivity;

public class GradedaoImp1 implements Gradedao{


	@Override
	public void updateGrade(Grade g) {
		// TODO Auto-generated method stub
		Connection con;
		PreparedStatement ps;
	
		try {
			con=DBConnectivity.getConnection();
			ps=con.prepareStatement("update grade set studentid=?, grade=?, comments=?, semester=?, years=? where gradeid=?");
			
			ps.setInt(1, g.getStudentid());
			ps.setString(2, g.getGrade());
			ps.setString(3, g.getComments());
			ps.setInt(4, g.getSemester());
			ps.setString(5, g.getYears());
			ps.setInt(6, g.getGradeid());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int getUserid1(UserInfo c) {
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
	@Override
	public int getInstructorid(int id) {
		// TODO Auto-generated method stub
		Connection con;
		int instructorid = 0;
		try {
			con = DBConnectivity.getConnection();
			PreparedStatement ps = con.prepareStatement("select instructorid from courses where courseid=?");
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				instructorid=rs.getInt(1);
				System.out.println(instructorid);
				
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return instructorid;
	}
	@Override
	public void insertGrade(Grade g) {
		// TODO Auto-generated method stub
		Connection con;
		try {
			con = DBConnectivity.getConnection();
			String sql = "INSERT INTO grade (studentid, courseid, grade, comments ,instructorid, semester, years)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, g.getStudentid());
			ps.setInt(2, g.getCourseid());
			ps.setString(3, g.getGrade());
			ps.setString(4, g.getComments());
			ps.setInt(5, g.getInstructorid());
			ps.setInt(6, g.getSemester());
			ps.setString(7, g.getYears());
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
	
	

	
	

	

}
