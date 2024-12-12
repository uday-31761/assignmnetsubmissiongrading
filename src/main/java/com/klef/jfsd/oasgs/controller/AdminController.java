package com.klef.jfsd.oasgs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.hibernate.engine.spi.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.oasgs.model.Admin;
import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Registrations;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.oasgs.service.AdminService;
import com.klef.jfsd.oasgs.service.CourseService;
import com.klef.jfsd.oasgs.service.FacultyService;
import com.klef.jfsd.oasgs.service.RegistrationsService;
import com.klef.jfsd.oasgs.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private RegistrationsService registrationsService;

	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;

	@GetMapping("/")
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("start");
		return mv;
	}

	

	@GetMapping("about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("about");
		return mv;
	}


	@GetMapping("adminhome")
	public ModelAndView adminhome() {
	    ModelAndView mv = new ModelAndView();

	    long facultyCount = facultyService.getFacultyCount(); 
	    long studentCount = studentService.getStudentCount(); 
	    long courseCount = courseService.getCourseCount();   

	    mv.setViewName("adminhome");
	    mv.addObject("facultyCount", facultyCount);
	    mv.addObject("studentCount", studentCount);
	    mv.addObject("courseCount", courseCount);

	    return mv;
	}


	@GetMapping("addstudent")
	public ModelAndView addStudent() {
		ModelAndView mv = new ModelAndView("addstudent");
		return mv;
	}

	@PostMapping("insertstudent")
	public ModelAndView insertStudent(HttpServletRequest request) {
		String name = request.getParameter("sname");
		String gender = request.getParameter("sgender");
		double age = Double.parseDouble(request.getParameter("sage"));
		String department = request.getParameter("sdepartment");
		String email = request.getParameter("semail");
		String contact = request.getParameter("scontact");

		Student student = new Student();
		student.setName(name);
		student.setGender(gender);
		student.setAge(age);
		student.setDepartment(department);
		student.setEmail(email);
		student.setContact(contact);

		String msg = studentService.addstudent(student);
		ModelAndView mv = new ModelAndView("studentregsuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents() {
		ModelAndView mv = new ModelAndView();
		List<Student> studentlist = studentService.viewallstudents();
		mv.setViewName("viewallstudents");
		mv.addObject("studentlist", studentlist);
		return mv;
	}

	@GetMapping("deletestudent")
	public ModelAndView deletestudent() {
		ModelAndView mv = new ModelAndView();
		List<Student> studentlist = studentService.viewallstudents();
		mv.setViewName("deletestudent");
		mv.addObject("studentlist", studentlist);
		return mv;
	}

	@GetMapping("deletestu")
	public String deletestu(@RequestParam("id") int sid) {
		studentService.deletestudent(sid);
		return "redirect:/deletestudent";
	}

	@GetMapping("updatestudent")
	public ModelAndView updatestudent(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("updatestudent");
		Student student = studentService.viewstudentbyid(id);
		mv.addObject("student", student);
		return mv;
	}

	@PostMapping("updatestu")
	public ModelAndView update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("sid"));
		String name = request.getParameter("sname");
		String gender = request.getParameter("sgender");
		double age = Double.parseDouble(request.getParameter("sage"));
		String department = request.getParameter("sdepartment");

		Student st = new Student();
		st.setId(id);
		st.setName(name);
		st.setGender(gender);
		st.setAge(age);
		st.setDepartment(department);

		String msg = studentService.updatestduent(st);
		ModelAndView mv = new ModelAndView("updatesuccess");
		mv.addObject("message", msg);

		return mv;

	}

	@GetMapping("viewstudentbyid")
	public ModelAndView viewstudentbyid() {
		ModelAndView mv = new ModelAndView("viewstudentbyid");
		return mv;
	}

	@PostMapping("viewstudent")
	public ModelAndView viewstudent(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		ModelAndView mv = new ModelAndView("viewstudentbyid");
		Student st = studentService.viewStudentById(uid);
		mv.addObject("st", st);
		return mv;
	}

	@GetMapping("addfaculty")
	public ModelAndView addfaculty() {
		ModelAndView mv = new ModelAndView("addfaculty");
		return mv;
	}

	@PostMapping("insertfaculty")
	public ModelAndView insertfaculty(HttpServletRequest request) {
		String name = request.getParameter("fname");
		String gender = request.getParameter("fgender");
		String dob = request.getParameter("fdob");
		String department = request.getParameter("fdepartment");
		double salary = Double.parseDouble(request.getParameter("fsalary"));
		String location = request.getParameter("flocation");
		String email = request.getParameter("femail");
		String contact = request.getParameter("fcontact");

		Faculty facul = new Faculty();
		facul.setName(name);
		facul.setGender(gender);
		facul.setDateofbirth(dob);
		facul.setDepartment(department);
		facul.setSalary(salary);
		facul.setLocation(location);
		facul.setEmail(email);
		facul.setContact(contact);

		String msg = facultyService.addfaculty(facul);
		ModelAndView mv = new ModelAndView("facultyregsuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@GetMapping("viewallfaculty")
	public ModelAndView viewallfaculty() {
		ModelAndView mv = new ModelAndView();
		List<Faculty> facultylist = facultyService.viewallfaculty();
		mv.setViewName("viewallfaculty");
		mv.addObject("facultylist", facultylist);
		return mv;
	}

	@GetMapping("deletefaculty")
	public ModelAndView deletefaculty() {
		ModelAndView mv = new ModelAndView();
		List<Faculty> facultylist = facultyService.viewallfaculty();
		mv.setViewName("deletefaculty");
		mv.addObject("facultylist", facultylist);
		return mv;
	}

	@GetMapping("deletefac")
	public String deletefac(@RequestParam("id") int fid) {
		facultyService.deletefaculty(fid);
		return "redirect:/deletefaculty";
	}

	@GetMapping("updatefaculty")
	public ModelAndView updatefaculty(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("updatefaculty");
		Faculty faculty = facultyService.viewfacultybyid(id);
		mv.addObject("faculty", faculty);
		return mv;
	}

	@PostMapping("updatefac")
	public ModelAndView updatefac(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("fid"));
		String name = request.getParameter("fname");
		String gender = request.getParameter("fgender");
		String dateofbirth = request.getParameter("fdob");
		String department = request.getParameter("fdepartment");
		double salary = Double.parseDouble(request.getParameter("fsalary"));
		String location = request.getParameter("flocation");

		Faculty fac = new Faculty();
		fac.setId(id);
		fac.setName(name);
		fac.setGender(gender);
		fac.setDateofbirth(dateofbirth);
		fac.setDepartment(department);
		fac.setSalary(salary);
		fac.setLocation(location);

		String msg = facultyService.updatefaculty(fac);
		ModelAndView mv = new ModelAndView("updatesuccess");
		mv.addObject("message", "Updated Faculty Success");
		return mv;
	}

	@GetMapping("addcourse")
	public ModelAndView addcourse() {
		ModelAndView mv = new ModelAndView("addcourse");
		return mv;
	}

	@PostMapping("insertcourse")
	public ModelAndView insertCourse(HttpServletRequest request) {
		String code = request.getParameter("ccode");
		String name = request.getParameter("cname");
		int credits = Integer.parseInt(request.getParameter("ccredits"));
		LocalDate startDate = LocalDate.parse(request.getParameter("cstart_date"));
		LocalDate endDate = LocalDate.parse(request.getParameter("cend_date"));

		Course course = new Course();
		course.setCode(code);
		course.setName(name);
		course.setCredits(credits);
		course.setStartDate(startDate);
		course.setEndDate(endDate);

		String msg = courseService.addcourse(course);
		ModelAndView mv = new ModelAndView("courseregsuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@GetMapping("viewallcourses")
	public ModelAndView viewallcourses() {
		ModelAndView mv = new ModelAndView();
		List<Course> courselist = courseService.viewallcoursess();
		mv.setViewName("viewallcourses");
		mv.addObject("courselist", courselist);
		return mv;
	}

	@GetMapping("deletecourse")
	public ModelAndView deletecourse() {
		ModelAndView mv = new ModelAndView();
		List<Course> courselist = courseService.viewallcoursess();
		mv.setViewName("deletecourse");
		mv.addObject("courselist", courselist);
		return mv;
	}

	@GetMapping("deletecou")
	public String deletecou(@RequestParam("code") String ccode) {
		courseService.deletecourse(ccode);
		return "redirect:/deletecourse";
	}

	@GetMapping("updatecourse")
	public ModelAndView updateCourse(@RequestParam("ccode") String ccode) {
		ModelAndView mv = new ModelAndView("updatecourse");
		Course course = courseService.viewcoursebycode(ccode);
		mv.addObject("course", course);
		return mv;
	}

	@PostMapping("updatec")
	public ModelAndView updatecourse(HttpServletRequest request) {
		String code = request.getParameter("ccode");
		String name = request.getParameter("cname");
		int credits = Integer.parseInt(request.getParameter("ccredits"));
		LocalDate startDate = LocalDate.parse(request.getParameter("cstart_date"));
		LocalDate endDate = LocalDate.parse(request.getParameter("cend_date"));

		Course course = new Course();
		course.setCode(code);
		course.setName(name);
		course.setCredits(credits);
		course.setStartDate(startDate);
		course.setEndDate(endDate);

		String msg = courseService.updatecourse(course);
		ModelAndView mv = new ModelAndView("updatesuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@GetMapping("/facultycoursemapping")
	public String facultycoursemapping(Model model) {
		// Add attributes for the faculty and course dropdowns
		model.addAttribute("facultyList", facultyService.viewallfaculty());
		model.addAttribute("courseList", courseService.viewallcoursess());
		model.addAttribute("facultyCourseMapping", new FacultyCourseMapping());
		return "facultycoursemapping"; // JSP page name
	}

	@PostMapping("/facultycoursemapping")
	public String saveMapping(@RequestParam("facultyId") int facultyId, @RequestParam("courseCode") String courseCode,
			@RequestParam("assignedDate") String assignedDate, Model model) {
		FacultyCourseMapping mapping = new FacultyCourseMapping();

		Faculty faculty = facultyService.viewfacultybyid(facultyId);
		Course course = courseService.viewcoursebycode(courseCode);
		try {
			if (faculty != null && course != null) {
				mapping.setFaculty(faculty);
				mapping.setCourse(course);
				mapping.setAssignedDate(assignedDate);

				adminService.fcmapping(mapping);

				model.addAttribute("successMessage", "Mapping saved successfully!");
			} else {
				model.addAttribute("errorMessage", "Error: Faculty or Course not found.");
			}
		}

		catch (IllegalArgumentException e) {
			model.addAttribute("infoMessage", "This faculty is already mapped to this course.");
		}

		model.addAttribute("facultyList", facultyService.viewallfaculty());
		model.addAttribute("courseList", courseService.viewallcoursess());
		return "facultycoursemapping";
	}

	@GetMapping("viewfacultycoursemappings")
	public ModelAndView viewFacultyCourseMappings() {
		ModelAndView mv = new ModelAndView();
		List<FacultyCourseMapping> fcmapping = adminService.viewfacultycoursemapping();
		mv.setViewName("viewfacultycoursemappings");
		mv.addObject("fcmapping", fcmapping);
		return mv;
	}

	
	@GetMapping("/enrollment")
	public String getEnrollmentStatus(Model model) {
		Registrations registration = registrationsService.getCurrentStatus();
		model.addAttribute("registrationStatus", registration);
		return "manageEnrollment";
	}

	@PostMapping("/enrollment/update")
	public void updateEnrollmentStatus(@RequestParam("enrollmentStatus") boolean status, Model model,
			HttpServletResponse response) throws IOException {
		Registrations registration = registrationsService.getCurrentStatus();
		registration.setStatus(status);
		registrationsService.save(registration);
		model.addAttribute("registrationStatus", registration);
		response.sendRedirect("/enrollment");
	}

	@GetMapping("deletefacultycoursemapping")
	public ModelAndView deletefacultycoursemapping() {
		ModelAndView mv = new ModelAndView();
		List<FacultyCourseMapping> facultycourse = adminService.viewfacultycoursemapping();
		mv.setViewName("deletefacultycoursemapping");
		mv.addObject("fcmapping", facultycourse);
		return mv;
	}

	@GetMapping("deletefaccou")
	public String deletefaccou(@RequestParam("id") int id) {
		adminService.facultycoursemapping(id);
		return "redirect:/viewfacultycoursemappings";
	}
}