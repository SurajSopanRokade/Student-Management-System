package com.proj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.dao.CoursedaoImp1;
import com.proj.model.Courses;
import com.proj.model.UserInfo;

@WebServlet("/course")
public class CoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CoursedaoImp1 coursedaoimp1;   
    
    public CoursesServlet() {
        super();
        this.coursedaoimp1= new CoursedaoImp1();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("showcourses.jsp");
		String action = request.getParameter("action");
		
		
		switch(action) {
		case "/addCourses":insertCourses(request, response);
			break;
		case "/updateCourses":updateCourses(request, response);
			break;
		case "/deleteCourses":deleteCourses(request, response);
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public CoursedaoImp1 getCoursedaoimp1() {
		return coursedaoimp1;
	}

	public void setCoursedaoimp1(CoursedaoImp1 coursedaoimp1) {
		this.coursedaoimp1 = coursedaoimp1;
	}
	private void insertCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coursename = request.getParameter("coursename");
		String department = request.getParameter("department");
		String instructorid = request.getParameter("instructorid");
		int instrid=Integer.parseInt(instructorid);
		String maxcapacity = request.getParameter("maxcapacity");
		int maxc=Integer.parseInt(maxcapacity);
		String cstatus = request.getParameter("cstatus");
		int cstat=Integer.parseInt(cstatus);
		Courses c = new Courses(coursename, department,instrid,maxc,cstat);
		coursedaoimp1.saveCourses(c);
		
	}
	private void updateCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseid=request.getParameter("courseid");
		int cid=Integer.parseInt(courseid);
		String coursename = request.getParameter("coursename");
		String department = request.getParameter("department");
		String instructorid = request.getParameter("instructorid");
		int instrid=Integer.parseInt(instructorid);
		String maxcapacity = request.getParameter("maxcapacity");
		int maxc=Integer.parseInt(maxcapacity);
		String cstatus = request.getParameter("cstatus");
		int cstat=Integer.parseInt(cstatus);
		Courses c = new Courses(cid,coursename, department,instrid,maxc,cstat);
		coursedaoimp1.updateCourses(c);
		
	}
	private void deleteCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseid=request.getParameter("d");
		int cid=Integer.parseInt(courseid);
		coursedaoimp1.deleteCourses(cid);	
	}
	

}
