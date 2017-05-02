package org.basic.bean;

public class User {
	private String userID;
	private String userAccount;
	private String password;
	private String mobile;
	private String address;
	private String icon;

	public User() {

	}

	public User(String userID, String userAccount, String password, String mobile, String address,String icon) {
		this.userID = userID;
		this.userAccount = userAccount;
		this.password = password;
		this.mobile = mobile;
		this.address = address;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
}
