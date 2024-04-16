package com.proj.model;

public class Courses {
	private int courseid;
	private String coursename;
	private String department;
	private int instructorid;
	private int maxcapacity;
	private int cstatus;
	
	public Courses() {
		// TODO Auto-generated constructor stub
	}

	public Courses(String coursename, String department, int instructorid,
			int maxcapacity, int cstatus) {
		super();
		this.coursename = coursename;
		this.department = department;
		this.instructorid = instructorid;
		this.maxcapacity = maxcapacity;
		this.cstatus = cstatus; 
	}

	public Courses(int courseid, String coursename, String department, int instructorid, 
			 int maxcapacity, int cstatus) {
		super();
		this.courseid = courseid;
		this.coursename = coursename;
		this.department = department;
		this.instructorid = instructorid;
		this.maxcapacity = maxcapacity;
		this.cstatus = cstatus;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getInstructorid() {
		return instructorid;
	}

	public void setInstructorid(int instructorid) {
		this.instructorid = instructorid;
	}

	public int getMaxcapacity() {
		return maxcapacity;
	}

	public void setMaxcapacity(int maxcapacity) {
		this.maxcapacity = maxcapacity;
	}

	public int getCstatus() {
		return cstatus;
	}

	public void setCstatus(int cstatus) {
		this.cstatus = cstatus;
	}

	@Override
	public String toString() {
		return "Courses [courseid=" + courseid + ", coursename=" + coursename + ", department=" + department
				+ ", instructorid=" + instructorid 
				+ ", maxcapacity=" + maxcapacity + ", cstatus=" + cstatus + "]";
	}
	
	
}
