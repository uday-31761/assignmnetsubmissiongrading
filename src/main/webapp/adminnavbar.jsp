<%@page import="com.klef.jfsd.oasgs.model.Admin"%>
<%@page import="com.klef.jfsd.oasgs.model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Account a = (Account) session.getAttribute("account");
Admin am = (Admin) session.getAttribute("user");
if (a == null) {
	response.sendRedirect("sessionfail");
	return;
}
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="navbar.css">


<script type="text/javascript" src="app.js" defer></script>
</head>
<body>

	<nav id="sidebar">

		<ul>
			<li><a href="adminhome" class="logo">Admin Panel</a>
				<button onclick="toggleSidebar()" id="toggle-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
            <path
							d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z" />
        </svg>
				</button></li>

			<li class="active"><a href="adminhome"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path
							d="M240-200h120v-200q0-17 11.5-28.5T400-440h160q17 0 28.5 11.5T600-400v200h120v-360L480-740 240-560v360Zm-80 0v-360q0-19 8.5-36t23.5-28l240-180q21-16 48-16t48 16l240 180q15 11 23.5 28t8.5 36v360q0 33-23.5 56.5T720-120H560q-17 0-28.5-11.5T520-160v-200h-80v200q0 17-11.5 28.5T400-120H240q-33 0-56.5-23.5T160-200Zm320-270Z" />
                    </svg> <span>Admin Home</span>
			</a></li>
			<li>
				<button onclick="toggleSubMenu(this)" class="dropdown-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
                       <path
							d="M12 3L1 9l11 6 9-4.91V17h2V9l-11-6zm0 2.18L18.09 9 12 11.91 5.91 9 12 5.18zm-9 8.46v2c0 1.54 3.58 2.82 8 2.82s8-1.28 8-2.82v-2l-8 3.63-8-3.63z" />
                    </svg>
					<span>Student</span>
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                         <path
							d="M480-361q-8 0-15-2.5t-13-8.5L268-556q-11-11-11-28t11-28q11-11 28-11t28 11l156 156 156-156q11-11 28-11t28 11q11 11 11 28t-11 28L508-372q-6 6-13 8.5t-15 2.5Z" />
                     </svg>
				</button>

				<ul class="sub-menu">
					<div>
						<li><a href="addstudent">Add Student</a></li>
						<li><a href="deletestudent">Delete Student</a></li>
						<li><a href="viewallstudents">View All Students</a></li>
					</div>
				</ul>
			</li>
			<li>
				<button onclick="toggleSubMenu(this)" class="dropdown-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
                         <path
							d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm6 0c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm-6 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                     </svg>
					<span>Faculty</span>
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path
							d="M480-361q-8 0-15-2.5t-13-8.5L268-556q-11-11-11-28t11-28q11-11 28-11t28 11l156 156 156-156q11-11 28-11t28 11q11 11 11 28t-11 28L508-372q-6 6-13 8.5t-15 2.5Z" />
                    </svg>
				</button>
				<ul class="sub-menu">
					<div>
						<li><a href="addfaculty">Add Faculty</a></li>
						<li><a href="deletefaculty">Delete Faculty</a></li>
						<li><a href="viewallfaculty">View All Faculties</a></li>
					</div>
				</ul>
			</li>
			<li class="sub-menu">
				<button onclick="toggleSubMenu(this)" class="dropdown-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
                         <path
							d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12v-2H6V4h12v16h2V4c0-1.1-.9-2-2-2zm-4 4H8v2h6V6zm2 4H8v2h8v-2z" />
                    </svg>
					<span>Course</span>
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path
							d="M480-361q-8 0-15-2.5t-13-8.5L268-556q-11-11-11-28t11-28q11-11 28-11t28 11l156 156 156-156q11-11 28-11t28 11q11 11 11 28t-11 28L508-372q-6 6-13 8.5t-15 2.5Z" />
                    </svg>
				</button>
				<ul class="sub-menu">
					<div>
						<li><a href="addcourse">Add Course</a></li>
						<li><a href="deletecourse">Delete Course</a></li>
						<li><a href="viewallcourses">View All Courses</a></li>
					</div>
				</ul>
			</li>

			<li class="sub-menu">
				<button onclick="toggleSubMenu(this)" class="dropdown-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
                         <path
							d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12v-2H6V4h12v16h2V4c0-1.1-.9-2-2-2zm-4 4H8v2h6V6zm2 4H8v2h8v-2z" />
                    </svg>
					<span>Mapping</span>
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path
							d="M480-361q-8 0-15-2.5t-13-8.5L268-556q-11-11-11-28t11-28q11-11 28-11t28 11l156 156 156-156q11-11 28-11t28 11q11 11 11 28t-11 28L508-372q-6 6-13 8.5t-15 2.5Z" />
                    </svg>
				</button>
				<ul class="sub-menu">
					<div>
						<li><a href="facultycoursemapping">Faculty Course Map</a></li>
						<li><a href="viewfacultycoursemappings">View Faculty
								Course Mappings</a></li>
					</div>
				</ul>
			</li>



			<!-- <li><a href="enrollment"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
                      <path
							d="M13 12c0-2.2-1.8-4-4-4s-4 1.8-4 4 1.8 4 4 4 4-1.8 4-4zm1.5 0c0 2.9-1.6 5.4-4 6.3v1.2h5.5v2H6v-2H11v-1.2c-2.4-0.9-4-3.4-4-6.3 0-3.3 2.7-6 6-6s6 2.7 6 6h-1.5zm5.5 6v-1h-2v1h-2v2h2v1h2v-1h2v-2h-2z" />
                 </svg> <span>Registrations</span>
			</a></li> -->
			<li><a href="logout"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 0 24 24" width="24px" fill="#e8eaed">
    <path
							d="M13 3c0-.55.45-1 1-1h6c1.1 0 2 .9 2 2v16c0 1.1-.9 2-2 2h-6c-.55 0-1-.45-1-1s.45-1 1-1h6V4h-6c-.55 0-1-.45-1-1Zm-1.59 5.41L8.83 12l2.58 2.59c.39.39.39 1.02 0 1.41-.39.39-1.02.39-1.41 0L6 12l3.99-3.99c.39-.39 1.02-.39 1.41 0 .39.39.39 1.02 0 1.41ZM10 11h9c.55 0 1 .45 1 1s-.45 1-1 1h-9v-2Z" />
</svg> <span>Logout</span>
			</a></li>

		</ul>
	</nav>
</body>
</html>