package com.klef.jfsd.oasgs.service;

import com.klef.jfsd.oasgs.model.Account;

public interface AccountService 
{
	public String addaccount(Account account);

	public Account checkaccountlogin(String uemail, String upwd);

	public Account findByEmail(String email);

	public int updatePassword(String password, String email);
}
