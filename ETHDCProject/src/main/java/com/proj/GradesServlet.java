package com.proj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.dao.GradedaoImp1;
import com.proj.model.Grade;
import com.proj.model.UserInfo;

@WebServlet("/GradesServlet")
public class GradesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GradedaoImp1 gradedaoimp;   
    public GradesServlet() {
        super();
        // TODO Auto-generated constructor stub
        this.gradedaoimp= new GradedaoImp1();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String action = request.getParameter("action");
		
		
		switch(action) {
		case "/updateGrades":updateGrades(request, response);
			break;
		case "/EnrollCourse":enrollUser(request, response);
		    break;
		default:
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public GradedaoImp1 getGradedaoimp() {
		return gradedaoimp;
	}

	public void setGradedaoimp(GradedaoImp1 gradedaoimp) {
		this.gradedaoimp = gradedaoimp;
	}
	
	private void updateGrades(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String gradeid=request.getParameter("gradeid");
		int gid=Integer.parseInt(gradeid);
		String studentid = request.getParameter("studentid");
		int sid=Integer.parseInt(studentid);
		String grade = request.getParameter("grade");
		String comments = request.getParameter("comments");
		String instructorid = request.getParameter("instructorid");
		int iid=Integer.parseInt(instructorid);
		String semester = request.getParameter("semester");
		int seme=Integer.parseInt(semester);
		String years = request.getParameter("years");
		System.out.println("iid : "+iid);
		request.setAttribute("userid", iid);
		Grade g = new Grade(gid,sid, grade,comments,seme,years);
		gradedaoimp.updateGrade(g);
		RequestDispatcher rd = request.getRequestDispatcher("showgrades.jsp");
		rd.forward(request, response);
	}

private void enrollUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String courseid = request.getParameter("courseid");
	String grade="";
	String comments="";
	int seme=0;
	String years="";
	int cid=Integer.parseInt(courseid);
	String username = request.getParameter("username");
	String userpass = request.getParameter("userpass");
	UserInfo u = new UserInfo(username, userpass);
	int sid=gradedaoimp.getUserid1(u);
	int instructorid=gradedaoimp.getInstructorid(cid);
	Grade g = new Grade(sid,cid,grade,comments,instructorid,seme,years);
	gradedaoimp.insertGrade(g);
	request.setAttribute("userid", sid);
	RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
	rd.forward(request, response);
}

}
