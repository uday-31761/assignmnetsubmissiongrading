package com.klef.jfsd.oasgs.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="faculty_table")
public class Faculty 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY) // you can take this manually also through form
   @Column(name="fid")
   private int id;
   @Column(name="fname",nullable=false,length = 50)
   private String name;
   @Column(name="fgender",nullable=false,length = 20)
   private String gender;
   @Column(name="fdob",nullable=false,length = 20)
   private String dateofbirth;
   @Column(name="fdepartment",nullable=false,length = 50)
   private String department;
   @Column(name="fsalary",nullable=false)
   private double salary;
   @Column(name="femail",nullable=false,unique = true,length = 50)
   private String email;
   @Column(name="flocation",nullable=false,length=50)
   private String location;
   @Column(name="fcontact",nullable=false,unique = true,length = 20)
   private String contact;
   
   
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getDateofbirth() {
    return dateofbirth;
  }
  public void setDateofbirth(String dateofbirth) {
    this.dateofbirth = dateofbirth;
  }
  public String getDepartment() {
    return department;
  }
  public void setDepartment(String department) {
    this.department = department;
  }
  public double getSalary() {
    return salary;
  }
  public void setSalary(double salary) {
    this.salary = salary;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getLocation() {
    return location;
  }
  public void setLocation(String location) {
    this.location = location;
  }
  public String getContact() {
    return contact;
  }
  public void setContact(String contact) {
    this.contact = contact;
  }


}