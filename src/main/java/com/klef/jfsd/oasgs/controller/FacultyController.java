package com.klef.jfsd.oasgs.controller;

import java.net.http.HttpRequest;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.Submission;
import com.klef.jfsd.oasgs.repository.SubmissionRepository;
import com.klef.jfsd.oasgs.service.AdminService;
import com.klef.jfsd.oasgs.service.CourseService;
import com.klef.jfsd.oasgs.service.FacultyService;
import com.klef.jfsd.oasgs.service.MappingService;
import com.klef.jfsd.oasgs.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController 
{
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private MappingService mappingService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired 
	private SubmissionRepository submissionRepository;
	
	    @GetMapping("facultyhome")
		public ModelAndView facultyhome()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("facultyhome");
			return mv;
		}
	    
	    @GetMapping("facultyprofile")
	    public ModelAndView facultyprofile()
	    {
	      ModelAndView mv = new ModelAndView("facultyprofile");
	      return mv;
	    }
	    
	    @GetMapping("/viewmappedstudents")
	    public ModelAndView viewmappedstudents(HttpServletRequest request)
	    {
	    	HttpSession session = request.getSession();
	    	Faculty f = (Faculty) session.getAttribute("user");
	    	
	    	ModelAndView mv=new ModelAndView("viewmappedstudents");
	    	List<Student> st=mappingService.findbyfid(f.getId());
	    	System.out.println(st.toString());
	    	mv.addObject("studentlist", st);
	    	return mv;
	    }
	    
	    @GetMapping("/viewmappedcourses")
	    public ModelAndView viewmappedcourses(HttpServletRequest request)
	    {
	    	HttpSession session = request.getSession();
	    	Faculty f = (Faculty) session.getAttribute("user");
	    	
	    	ModelAndView mv=new ModelAndView("viewmappedcourses");
	    	List<Course> c = mappingService.coursesfindbyfid(f.getId());
	    	System.out.println(c.toString());
	    	mv.addObject("courselist",c);
	    	
	    	return mv;
	    }
	    
	    @GetMapping("viewfacultycoursedetails")
	       public ModelAndView viewstudentcoursedetails(@RequestParam("id")  String ccode)
	       {
	    	   ModelAndView mv= new ModelAndView();
	    	   mv.setViewName("viewfacultycoursedetails");
	    	   Course c = courseService.viewcoursebycode(ccode);
	    	   List<Assignment> ass = facultyService.viewallcourseAssignments(ccode);
	    	   mv.addObject("course",c);
	    	   mv.addObject("assignments",ass);
	    	   return mv;
	       }
	    
	    @GetMapping("displaypdf")
	    public ResponseEntity<byte[]> displayPdf(@RequestParam("id") int id) throws Exception {
	        Assignment ass= facultyService.FindAssById(id);
	        
	        byte[] pdfBytes = ass.getFile();

	        return ResponseEntity.ok()
	                .contentType(MediaType.APPLICATION_PDF)
	                .body(pdfBytes);
	    }
	    
	    
	    @GetMapping("displaysubmission")
	    public ResponseEntity<byte[]> displaysubmission(@RequestParam("aid") int aid, @RequestParam("sid") int sid) throws Exception 
	    {
	        Submission submission=submissionRepository.getSubmission(aid,sid);
	        
	        byte[] pdfBytes = submission.getFileData();

	        return ResponseEntity.ok()
	                .contentType(MediaType.APPLICATION_PDF)
	                .body(pdfBytes);
	    }
	    
	    @GetMapping("assignmnetcreation")
	      public ModelAndView assignmnetcreation()
	      {
	        ModelAndView mv = new ModelAndView("assignmnetcreation");
	        return mv;
	      }
	    
	    @PostMapping("AddAssignment")
	    public ModelAndView AddAssignment(HttpServletRequest request,@RequestParam("files") MultipartFile file) throws Exception
	    {
	    	ModelAndView mv=new ModelAndView("redirect:/viewfacultycoursedetails?id="+request.getParameter("courseCode"));
	    	String msg="";
	    	
	    	try
	    	{
	    		 String title = request.getParameter("title");
	             String description = request.getParameter("description");
	             LocalDate startDate = LocalDate.parse(request.getParameter("startDate"), DateTimeFormatter.ISO_DATE);
	             LocalDate dueDate = LocalDate.parse(request.getParameter("dueDate"), DateTimeFormatter.ISO_DATE);
	             String courseCode = request.getParameter("courseCode");
	             String status = request.getParameter("status");
	             int maxGrade = Integer.parseInt(request.getParameter("maximumGrade"));
	             
	             byte[] bytes=file.getBytes();
		         Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		         
		         Assignment ass=new Assignment();
		         
		         ass.setTitle(title);
		         ass.setDescription(description);
		         ass.setStartDate(startDate);
		         ass.setDueDate(dueDate);
		         ass.setCourseCode(courseCode);
		         ass.setStatus(status);
		         ass.setFile(bytes);
		         ass.setMaximumGrade(maxGrade);
		 
		         facultyService.AddAssignment(ass);		         
		         return mv;
	    	}
	    	catch(Exception e)
	    	{
	    		return mv;
	    	}
	    	
	    }
	    
	    @GetMapping("viewSubmissions")
	    public ModelAndView viewSubmissions(@RequestParam("id") int id)
	    {
	    	ModelAndView mv=new ModelAndView("viewSubmissions");
	    	List<Submission> sms= studentService.viewSubmissions(id);
	    	mv.addObject("submissions",sms);
	    	Assignment assignment = facultyService.FindAssById(id);
	    	mv.addObject("assignment",assignment);
	    	return mv;
	    }

	    @PostMapping("/AddGrade")
	    public String addGrade(@RequestParam("submissionId") int submissionId, 
	                           @RequestParam("grade") String grade, 
	                           @RequestParam("assignmentId") int assignmentId, 
	                           HttpServletRequest request) {

	        Submission submission = submissionRepository.findById(submissionId)
	                .orElseThrow(() -> new IllegalArgumentException("Invalid submission ID"));

	        submission.setGrade(grade);
	        submission.setStatus(true);  // Update status as "graded"

	        submissionRepository.save(submission);

	        return "redirect:/viewSubmissions?id=" + assignmentId;
	    }


}
