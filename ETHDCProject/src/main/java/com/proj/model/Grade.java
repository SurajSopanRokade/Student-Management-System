package com.proj.model;

public class Grade {
	private int gradeid;
	private int studentid;
	private int courseid;
	private String grade;
	private String comments;
	private int instructorid;
	private int semester;
	private String years;
	
	public Grade() {
		// TODO Auto-generated constructor stub
	}

	public Grade(int gradeid, int studentid, int courseid, String grade, String comments,
			int instructorid, int semester, String years) {
		super();
		this.gradeid = gradeid;
		this.studentid = studentid;
		this.courseid = courseid;
		this.grade = grade;
		this.comments = comments;
		this.instructorid = instructorid;
		this.semester = semester;
		this.years = years;
	}
	public Grade( int studentid, int courseid, String grade, String comments,
			int instructorid, int semester, String years) {
		super();
		this.studentid = studentid;
		this.courseid = courseid;
		this.grade = grade;
		this.comments = comments;
		this.instructorid = instructorid;
		this.semester = semester;
		this.years = years;
	}
	
	

	public Grade(int gradeid, int studentid, String grade, String comments, int semester, String years) {
		super();
		this.gradeid = gradeid;
		this.studentid = studentid;
		this.grade = grade;
		this.comments = comments;
		this.semester = semester;
		this.years = years;
	}
	
	public Grade(int studentid, int courseid, int instructorid) {
		super();
		this.studentid = studentid;
		this.courseid = courseid;
		this.instructorid = instructorid;
	}

	public int getGradeid() {
		return gradeid;
	}

	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}

	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getInstructorid() {
		return instructorid;
	}

	public void setInstructorid(int instructorid) {
		this.instructorid = instructorid;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	@Override
	public String toString() {
		return "Grade [gradeid=" + gradeid + ", studentid=" + studentid + ", courseid=" + courseid + ", grade=" + grade
				+  ", comments=" + comments + ", instructorid=" + instructorid
				+ ", semester=" + semester + ", years=" + years + "]";
	}
	
}
