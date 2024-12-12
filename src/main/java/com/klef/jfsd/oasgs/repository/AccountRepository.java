package com.klef.jfsd.oasgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.oasgs.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer>
{
	@Query("select a from Account a where a.email=?1 and a.password=?2")
	  public Account checkAccountLogin(String uemail,String upwd);

	  @Query("select a from Account a where a.email = ?1")
	  public Account findByEmail(String email);

	  @Query("update Account a set a.password=?1 where a.email=?2")
	  @Modifying
	  @Transactional
	  public int updatePassword(String password, String email);


}
