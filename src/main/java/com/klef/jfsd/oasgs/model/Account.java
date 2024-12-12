package com.klef.jfsd.oasgs.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "account_table")
public class Account 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, length = 10)
	private int accountId;
	
	@Column(name = "uid", nullable = false, length = 10)
	private int userId;
	
	@Column(name = "utype", nullable = false, length = 10)
	private UserType userType;
	
	@Column(name = "uemail", nullable = false)
	private String email;
	
	@Column(name = "upwd", nullable = false)
	private String password;

	@Override
	public String toString() 
	{
		return "Accounts [accountId=" + accountId + ", userId=" + userId + ", userType=" + userType + ", email=" + email
				+ ", password=" + password + "]";
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public enum UserType 
	{
		STUDENT, FACULTY, ADMIN
	}
}