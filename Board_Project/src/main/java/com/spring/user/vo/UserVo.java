package com.spring.user.vo;

public class UserVo {
	private String userid;
	private String userpass;
	private String nickname;
	private String username;
	private String email;
	private String tel;
	private int userpoint;
	
	public UserVo() {
		
	}

	public UserVo(String userid, String userpass, String nickname, String username, String email, String tel,
			int userpoint) {
	
		this.userid = userid;
		this.userpass = userpass;
		this.nickname = nickname;
		this.username = username;
		this.email = email;
		this.tel = tel;
		this.userpoint = userpoint;
	}
	public UserVo(String userid, String userpass, String nickname, String username, String email, String tel) {
		
		this.userid = userid;
		this.userpass = userpass;
		this.nickname = nickname;
		this.username = username;
		this.email = email;
		this.tel = tel;
		
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getUserpoint() {
		return userpoint;
	}

	public void setUserpoint(int userpoint) {
		this.userpoint = userpoint;
	}

	@Override
	public String toString() {
		return "UserVo [userid=" + userid + ", userpass=" + userpass + ", nickname=" + nickname + ", username="
				+ username + ", email=" + email + ", tel=" + tel + ", userpoint=" + userpoint + "]";
	}
	
}
