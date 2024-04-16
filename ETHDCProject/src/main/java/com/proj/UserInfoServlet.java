package com.proj;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.dao.UserinfodaoImp;
import com.proj.model.Courses;
import com.proj.model.UserInfo;

@WebServlet("/")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserinfodaoImp userinfodaoimp;
    public UserInfoServlet() {
        super();
        this.userinfodaoimp=new UserinfodaoImp();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action=request.getServletPath();
		
		switch(action) {
		case "/logins":userLogin(request, response);
			break;
		case "/signs":insertUser(request, response);
			break;
		case "/DeleteRecord":deleteUser(request, response);
			break;
		case "/UpdateRecord":updateUser(request, response);
			break;
		
		default:indexPage(request, response);
        	break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public UserinfodaoImp getUserinfodaoimp() {
		return userinfodaoimp;
	}

	public void setUserinfodaoimp(UserinfodaoImp userinfodaoimp) {
		this.userinfodaoimp = userinfodaoimp;
	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String email = request.getParameter("email");
		String dateofbirth = request.getParameter("dateofbirth");
		String contactno = request.getParameter("contactno");
		
		UserInfo u = new UserInfo(username, userpass,email,dateofbirth,contactno);
		userinfodaoimp.saveUserInfo(u);
		userLogin(request, response);
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		int uid=Integer.parseInt(userid);
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		int userroles = Integer.parseInt(request.getParameter("userroles"));
		String email = request.getParameter("email");
		String dateofbirth = request.getParameter("dateofbirth");
		String contactno = request.getParameter("contactno");
		
		UserInfo u = new UserInfo(uid,username, userpass,userroles,email,dateofbirth,contactno);
		userinfodaoimp.updateUserInfo(u);
		if(userroles==2) {
		response.sendRedirect("admin.jsp");
		}
		else {
		response.sendRedirect("showteachers.jsp");
		}
	}
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("d");
		int uid=Integer.parseInt(userid);
		userinfodaoimp.deleteUserInfo(uid);
		response.sendRedirect("admin.jsp");
	}
	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");

		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		UserInfo u = new UserInfo(username, userpass);
		int userrole=userinfodaoimp.Login(u);
		System.out.println("userrole : "+userrole);
		if(userrole!=0 && userrole==1) {
			HttpSession session=request.getSession();
			session.setAttribute("user", username);
			RequestDispatcher rd = request.getRequestDispatcher("AdminDashboard.jsp");
			rd.forward(request, response);
		}
		else if(userrole!=0 && userrole==2) {
			HttpSession session=request.getSession();
			session.setAttribute("user", username);
			int userid=userinfodaoimp.getUserid(u);
			request.setAttribute("userid", userid);
			RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
			rd.forward(request, response);
		}
		else if(userrole!=0 && userrole==3) {
			HttpSession session=request.getSession();
			session.setAttribute("user", username);
			int userid=userinfodaoimp.getUserid(u);
			request.setAttribute("userid", userid);
			RequestDispatcher rd = request.getRequestDispatcher("showgrades.jsp");
			rd.forward(request, response);
		}
		else if(userrole==0) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}
	public void indexPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
	
	
}
