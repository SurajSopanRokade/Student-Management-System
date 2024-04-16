package com.proj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.proj.model.Courses;
import com.proj.model.UserInfo;
import com.proj.utility.DBConnectivity;

public class CoursedaoImp1 implements Coursedao{

	@Override
	public void saveCourses(Courses c) {
		// TODO Auto-generated method stub
		Connection con;
		try {
			con = DBConnectivity.getConnection();
			String sql = "INSERT INTO courses (coursename, department, instructorid,maxcapacity, cstatus) "
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getCoursename());
			ps.setString(2, c.getDepartment());
			ps.setInt(3, c.getInstructorid());
			ps.setInt(4, c.getMaxcapacity());
			ps.setInt(5, c.getCstatus());
			
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
	public void updateCourses(Courses c) {
		// TODO Auto-generated method stub
		Connection con;
		PreparedStatement ps;
	
		try {
			con=DBConnectivity.getConnection();
			ps=con.prepareStatement("update courses set coursename=?, department=?, instructorid=?, maxcapacity=?, cstatus=? where courseid=?");
			ps.setString(1, c.getCoursename());
			ps.setString(2, c.getDepartment());
			ps.setInt(3, c.getInstructorid());
			ps.setInt(4, c.getMaxcapacity());
			ps.setInt(5, c.getCstatus());
			ps.setInt(6, c.getCourseid());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCourses(int id) {
		// TODO Auto-generated method stub
		Connection con;
		PreparedStatement ps;
		try {
			con=DBConnectivity.getConnection();
			ps=con.prepareStatement("Delete from courses where courseid="+id);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserInfo searchCoursesById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
