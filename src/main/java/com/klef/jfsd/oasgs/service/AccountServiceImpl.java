package com.klef.jfsd.oasgs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Account;
import com.klef.jfsd.oasgs.repository.AccountRepository;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public String addaccount(Account account) {
		accountRepository.save(account);
		return "Account Inserted Successfully..";
	}

	@Override
	public Account checkaccountlogin(String uemail, String upwd) {
		return accountRepository.checkAccountLogin(uemail, upwd);
	}

	@Override
	public Account findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}

	@Override
	public int updatePassword(String password, String email) {
		return accountRepository.updatePassword(password, email);
	}

}
