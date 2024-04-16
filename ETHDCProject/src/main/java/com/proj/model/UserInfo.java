package com.proj.model;

public class UserInfo {
	private int userid;
	private String username;
	private String userpass;
	private int userroles;
	private String email;
	private String dateofbirth;
	private String contactno;
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}

	public UserInfo(int userid, String username, String userpass, int userroles, String email, String dateofbirth,
			String contactno) {
		super();
		this.userid = userid;
		this.username = username;
		this.userpass = userpass;
		this.userroles = userroles;
		this.email = email;
		this.dateofbirth = dateofbirth;
		this.contactno = contactno;
	}
	public UserInfo( String username, String userpass, int userroles, String email, String dateofbirth,
			String contactno) {
		super();
		this.username = username;
		this.userpass = userpass;
		this.userroles = userroles;
		this.email = email;
		this.dateofbirth = dateofbirth;
		this.contactno = contactno;
	}
	

	public UserInfo(String username, String userpass, String email, String dateofbirth, String contactno) {
		super();
		this.username = username;
		this.userpass = userpass;
		this.email = email;
		this.dateofbirth = dateofbirth;
		this.contactno = contactno;
	}

	public UserInfo(String username, String userpass) {
		super();
		this.username = username;
		this.userpass = userpass;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public int getUserroles() {
		return userroles;
	}

	public void setUserroles(int userroles) {
		this.userroles = userroles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	@Override
	public String toString() {
		return "UserInfo [userid=" + userid + ", username=" + username + ", userpass=" + userpass + ", userroles="
				+ userroles + ", email=" + email + ", dateofbirth=" + dateofbirth + ", contactno=" + contactno + "]";
	}

	
	
	
}
