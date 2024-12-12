package com.klef.jfsd.oasgs.service;

import java.util.List;

import com.klef.jfsd.oasgs.model.Admin;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
public interface AdminService 
{
	public Admin viewadminbyid(String username);
	public void fcmapping(FacultyCourseMapping mapping);
	public List<FacultyCourseMapping> viewfacultycoursemapping();
	public String facultycoursemapping(int id);

}
