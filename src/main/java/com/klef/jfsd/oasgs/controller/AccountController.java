package com.klef.jfsd.oasgs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.oasgs.model.Account;
import com.klef.jfsd.oasgs.model.Admin;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.service.AccountService;
import com.klef.jfsd.oasgs.service.AdminService;
import com.klef.jfsd.oasgs.service.FacultyService;
import com.klef.jfsd.oasgs.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController 
{
	@Autowired
	private AccountService accountService;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;

	@GetMapping("signup")
	public ModelAndView signup()
	{
		ModelAndView mv = new ModelAndView("signup");
		return mv;
	}
	
	@GetMapping("passwordupdationsuccess")
	public ModelAndView passwordupdationsuccess()
	{
		ModelAndView mv = new ModelAndView("passwordupdationsuccess");
		return mv;
	}

	@PostMapping("accountreg")
	public ModelAndView accountreg(HttpServletRequest request) 
	{
		ModelAndView mv = new ModelAndView();
		String utype = request.getParameter("utype");
		int uid = Integer.parseInt(request.getParameter("uid"));

		if (utype.equalsIgnoreCase("student"))
		{
			Student s = studentService.viewstudentbyid(uid);
			if (s != null) 
			{
				mv.setViewName("accountreg");
				mv.addObject("user", s);
				mv.addObject("role", utype);
			} 
			else 
			{
				mv.setViewName("signup");
				mv.addObject("msg", "User Not Found");
			}
		}
		else if (utype.equalsIgnoreCase("faculty"))
		{
			Faculty f = facultyService.viewfacultybyid(uid);
			if (f != null) 
			{
				mv.setViewName("accountreg");
				mv.addObject("user", f);
				mv.addObject("role", utype);
			} 
			else 
			{
				mv.setViewName("signup");
				mv.addObject("msg", "user not found");
			}
		}

		return mv;
	}

	@PostMapping("addaccount")
	public ModelAndView addAccount(HttpServletRequest request) 
	{
		int userId = Integer.parseInt(request.getParameter("uid"));
		String email = request.getParameter("email");
		String password = request.getParameter("upwd");

		Account.UserType userType;
		userType = Account.UserType.valueOf(request.getParameter("role").toUpperCase());

		Account account = new Account();
		account.setUserId(userId);
		account.setUserType(userType);
		account.setEmail(email);
		account.setPassword(password);

		accountService.addaccount(account);

		ModelAndView mv = new ModelAndView("regsuccess");
		mv.addObject("message", "User Account Created Successfully");
		return mv;

	}

	@GetMapping("login")
	public ModelAndView login() 
	{
	    ModelAndView mv = new ModelAndView("login");
	    return mv;
	}


	@PostMapping("checkAccountLogin")
	  public void checkAccountLogin(HttpServletRequest request, HttpServletResponse response) throws IOException 
	  {
	    String uemail = request.getParameter("uemail");
	    String upwd = request.getParameter("upwd");
	    HttpSession session= request.getSession();

	    Account a= accountService.checkaccountlogin(uemail, upwd);

	    if (a != null) 
	    {
	      session.setAttribute("account",a);
	      
	      if(a.getUserType().equals(Account.UserType.STUDENT))
	      {
	        Student s=studentService.viewstudentbyid(a.getUserId());
	        session.setAttribute("user", s);
	        response.sendRedirect("/studenthome");

	      }
	      else if(a.getUserType().equals(Account.UserType.FACULTY))
	      {
	        Faculty f = facultyService.viewfacultybyid(a.getUserId());
	        session.setAttribute("user", f);

	        response.sendRedirect("/facultyhome");
	      }
	      else if(a.getUserType().equals(Account.UserType.ADMIN))
	      {
	        Admin am=adminService.viewadminbyid(uemail);
	        session.setAttribute("user", am);
	        response.sendRedirect("/adminhome");

	      }
	    } 
	    else 
	    {
	        response.sendRedirect("/login");

	    }
	  }


	  @GetMapping("logout")
	  public ModelAndView logout(HttpServletRequest request) 
	  {
	    HttpSession session = request.getSession();
	    session.removeAttribute("account");
	    session.removeAttribute("user");
	    
	    ModelAndView mv = new ModelAndView("login");
	    return mv;
	  }
	  
	  @GetMapping("sessionfail")
	  public ModelAndView sessionfail()
	  {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("sessionfail");
		return mv;
	  }

	  @GetMapping("changepassword")
	    public ModelAndView changepassword() {
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("changepassword");
	      return mv;
	    }

	    @GetMapping("checkemail")
	    @ResponseBody
	    public Map<String, Boolean> checkEmail(@RequestParam("email") String email) {
	        Map<String, Boolean> response = new HashMap<>();
	        Account account = accountService.findByEmail(email); // Find by uemail (the actual database column)
	        response.put("exists", account != null); // If account exists, return true
	        return response;
	    }



	    @PostMapping("updatepassword")
	    public ModelAndView updatePassword(HttpServletRequest request) {
	        String email = request.getParameter("email");
	        String newPassword = request.getParameter("newPassword");

	        int updated = accountService.updatePassword(newPassword, email);

	        ModelAndView mv = new ModelAndView();
	        if (updated > 0) {
	            mv.setViewName("passwordupdationsuccess"); // Redirect to a success page
	            mv.addObject("message", "Password updated successfully!");
	        } else {
	            mv.setViewName("changepassword"); // Redirect back to changepassword.jsp
	            mv.addObject("message", "Error updating password!");
	        }
	        return mv;
	    }

}
