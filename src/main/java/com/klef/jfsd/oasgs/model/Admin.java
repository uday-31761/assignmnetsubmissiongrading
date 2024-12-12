package com.klef.jfsd.oasgs.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{ 
  @Id
  @Column(name ="admin_username",length = 50)
  private String username;
  
  public String getUsername() {
  return username;
  }
  public void setUsername(String username) {
  this.username = username;
  }

}