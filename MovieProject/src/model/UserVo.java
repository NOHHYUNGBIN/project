package model;

public class UserVo {
	private String userId;
	private String userPwd;
	private String userName;
	private String birth;
	private String phone;

	public UserVo() {
		
	}
	public UserVo(String userId) {
		this.userId = userId;
	}

	public UserVo(String userId, String userPwd, String userName, String birth, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
	}

	public UserVo(String userId, String userPwd) {

		this.userId = userId;
		this.userPwd = userPwd;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", birth=" + birth
				+ ", phone=" + phone + "]";
	}

}
