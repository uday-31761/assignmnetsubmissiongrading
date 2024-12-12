package com.klef.jfsd.oasgs.controller;

import java.net.http.HttpRequest;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.oasgs.model.Assignment;
import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.StudentCourseMapping;
import com.klef.jfsd.oasgs.model.Submission;
import com.klef.jfsd.oasgs.repository.SubmissionRepository;
import com.klef.jfsd.oasgs.service.CourseService;
import com.klef.jfsd.oasgs.service.FacultyService;
import com.klef.jfsd.oasgs.service.MappingService;
import com.klef.jfsd.oasgs.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	@Autowired
	private CourseService courseService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private MappingService mappingService;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private SubmissionRepository submissionRepository;
	
	

	@GetMapping("studenthome")
	public ModelAndView studenthome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studenthome");
		return mv;
	}

	@GetMapping("studentprofile")
	public ModelAndView studentprofile() 
	{
		ModelAndView mv = new ModelAndView("studentprofile");
		return mv;
	}

	@GetMapping("viewcourseenrollments")
	public ModelAndView viewcourseenrollments() {
		ModelAndView mv = new ModelAndView();
		List<Course> courselist = courseService.viewallcoursess();
		mv.setViewName("viewcourseenrollments");
		mv.addObject("courselist", courselist);
		return mv;
	}

	@PostMapping("checkfaculty")
	public ModelAndView checkfaculty(HttpServletRequest request) {
		String ccode = request.getParameter("courseCode");
		ModelAndView mv = new ModelAndView("registercourse");
		List<Faculty> fl = studentService.getListOfFaculty(ccode);
		List<Student> st = studentService.viewallstudents();
		mv.addObject("facultylist", fl);
		mv.addObject("st", st);
		mv.addObject("courseCode", ccode);
		return mv;
	}

	@GetMapping("registercourse")
	public ModelAndView registercourse() 
	{
		ModelAndView mv = new ModelAndView("registercourse");
		return mv;
	}

	       @PostMapping("registercourse")
		   public ModelAndView submitRegistration(HttpServletRequest request)
		   {
			   
			   String ccode=request.getParameter("courseCode");
			   int fid=Integer.parseInt(request.getParameter("facultyId"));
			   int sid=Integer.parseInt(request.getParameter("sid"));
			   
			   StudentCourseMapping mapping=new StudentCourseMapping();
			   mapping.setCcode(ccode);
			   mapping.setFid(fid);
			   mapping.setSid(sid);
			   
			   String msg = mappingService.studentcoursemapping(mapping);

			   ModelAndView mv = new ModelAndView("mappingsuccess");
			   mv.addObject("message", msg);
			   
			   return mv;
	}
	       
	       @GetMapping("updatestudentprofile")
	       public ModelAndView updatestudentprofile()      
	       {
	         ModelAndView mv=new ModelAndView("updatestudentprofile");
	         mv.setViewName("updatestudentprofile");
	       return mv;
	       }
	       
	       @PostMapping("updatestudentpro")
	       public ModelAndView updatestudentpro(HttpServletRequest request) {
	           int id = Integer.parseInt(request.getParameter("stid"));
	           String name = request.getParameter("stname");
	           String gender = request.getParameter("stgender");
	           double age = Double.parseDouble(request.getParameter("stage"));
	           String department = request.getParameter("stdepartment");

	           Student st = studentService.viewstudentbyid(id);
	           st.setId(id);
	           st.setName(name);
	           st.setGender(gender);
	           st.setAge(age);
	           st.setContact(st.getContact());  
	           st.setDepartment(department);

	           String msg = studentService.updatestudentprofile(st);
	           ModelAndView mv = new ModelAndView("updatesuccess");
	           mv.addObject("message", msg);

	           return mv;
	       }
	       
	       @GetMapping("viewstudentcourses")
	       public ModelAndView viewstudentcourses(HttpServletRequest request) {
	           HttpSession session = request.getSession();
	           Student student = (Student) session.getAttribute("user");
	           ModelAndView mv = new ModelAndView("viewstudentcourses");
	           List<Course> courses = mappingService.findbysid(student.getId());
	           mv.addObject("courselist",courses);
	           return mv;
	       }
	       
	       @GetMapping("viewstudentcoursedetails")
	       public ModelAndView viewstudentcoursedetails(@RequestParam("id")  String ccode)
	       {
	    	   ModelAndView mv= new ModelAndView();
	    	   mv.setViewName("viewstudentcoursedetails");
	    	   Course c = courseService.viewcoursebycode(ccode);
	    	   List<Assignment> ass = facultyService.viewallcourseAssignments(ccode);
	    	   mv.addObject("course",c);
	    	   mv.addObject("assignments",ass);
	    	   return mv;
	       }
		    
		    @PostMapping("addsubmission")
		    public ModelAndView AddAssignment(HttpServletRequest request,@RequestParam("files") MultipartFile file) throws Exception
		    {
		    	ModelAndView mv = new ModelAndView("viewstudentcoursedetails");
		    	String msg="";
		    	
		    	int aid = Integer.parseInt(request.getParameter("assignmentId"));
		    	HttpSession session = request.getSession();
		    	Student st= (Student)session.getAttribute("user");
		    	Submission smtc = submissionRepository.getSubmission(aid,st.getId());
		    	
		    	if(smtc!=null)
		    	{
		    		mv.addObject("message","submission Already Exits ! ");
		    		return mv;
		    	}
		    	
		    	try
		    	{
		    		Submission sm=new Submission();
		    		sm.setAssignmentId(aid);
		    		sm.setStatus(false);
		    		sm.setStudentId(st.getId());
		    		sm.setSubmittedOn(LocalDateTime.now());
		    		byte[] bytes=file.getBytes();
			         Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			         sm.setFileData(bytes);
			         
			         studentService.addSubmission(sm);
			         
			         mv.addObject("message","Submisson Succesfull");
			         return mv;
		    	}
		    	catch(Exception e)
		    	{
		    		mv.addObject("message",e);
		    		return mv;
		    	}
		    	
		    }
}
