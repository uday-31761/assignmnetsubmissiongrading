package com.klef.jfsd.oasgs.model;

import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "course_table")
public class Course {

  @Id
  @Column(name = "ccode", nullable = false, unique = true)
  private String code;

  @Column(name = "cname", nullable = false)
  private String name;

  @Column(name = "ccredits", nullable = false)
  private int credits;

  @Column(name = "cstart_date")
  private LocalDate startDate;

  @Column(name = "cend_date")
  private LocalDate endDate;

  public Course() {
  }

  public Course(String code, String name, int credits, LocalDate startDate, LocalDate endDate) {
    this.code = code;
    this.name = name;
    this.credits = credits;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getCredits() {
    return credits;
  }

  public void setCredits(int credits) {
    this.credits = credits;
  }

  public LocalDate getStartDate() {
    return startDate;
  }

  public void setStartDate(LocalDate startDate) {
    this.startDate = startDate;
  }

  public LocalDate getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDate endDate) {
    this.endDate = endDate;
  }

  @Override
  public String toString() {
    return "Course{" + "code='" + code + '\'' + ", name='" + name + '\'' + ", credits=" + credits + ", startDate="
        + startDate + ", endDate=" + endDate + '}';
  }
}