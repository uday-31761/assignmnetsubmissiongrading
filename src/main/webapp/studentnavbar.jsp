<%@page import="com.klef.jfsd.oasgs.model.Student"%>
<%@page import="com.klef.jfsd.oasgs.model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
Account a = (Account)session.getAttribute("account");
Student st=(Student)session.getAttribute("user");
if(a==null)
{
  response.sendRedirect("sessionfail");
  return;
}
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Panel</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/navbar.css">
    <link rel="stylesheet" href="/cardcourse.css">
    
    <script type="text/javascript" src="/app.js" defer></script>
</head>
<body>
    <nav id="sidebar">
    <ul>
        <li><a href="studenthome" class="logo">Student Panel</a>
    <button onclick="toggleSidebar()" id="toggle-btn">
        <svg xmlns="http://www.w3.org/2000/svg" height="24px"
            viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
            <path
                d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z" />
        </svg>
    </button>
</li>
        
        <li class="active">
            <a href="viewstudentcourses">
                <!-- Books Icon for View Courses -->
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                    <path d="M200-720h480q33 0 56.5 23.5T760-640v360q0 33-23.5 56.5T680-200H200q-33 0-56.5-23.5T120-280v-360q0-33 23.5-56.5T200-720Zm0 480h480v-360H200v360ZM360-560h240v40H360v-40Zm0 80h240v40H360v-40ZM240-560h80v40h-80v-40Zm0 80h80v40h-80v-40Z" />
                </svg>
                <span>View Courses</span>
            </a>
        </li>

        <li>
            <a href="viewcourseenrollments">
                <!-- Enrollments Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                    <path d="M160-480q0 33 23.5 56.5T240-400h480q33 0 56.5-23.5T800-480q0-33-23.5-56.5T720-560H240q-33 0-56.5 23.5T160-480Zm320 160q-17 0-28.5-11.5T440-560q0-17 11.5-28.5T480-600q17 0 28.5 11.5T520-560q0 17-11.5 28.5T480-480Zm0-240q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47Zm0-80q33 0 56.5-23.5T560-720q0-33-23.5-56.5T480-800q-33 0-56.5 23.5T400-720q0 33 23.5 56.5T480-560Zm0 80Z" />
                </svg>
                <span>Course Enrollment</span>
            </a>
        </li>

        <li>
            <a href="studentprofile">
                <!-- Profile Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                    <path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-240q0-34 17-61.5T240-378q64-30 128-45t112-15q56 0 112 15t128 45q30 15 47 43.5T800-240q0 33-23.5 56.5T720-160H240q-33 0-56.5-23.5T160-240Zm80 0h480v-32q0-12-6-21t-15-15q-58-29-112.5-42T480-360q-56 0-110 13t-110 42q-9 5-15 14t-6 20v32Zm240-320Z" />
                </svg>
                <span>Student Profile</span>
            </a>
        </li>

        <li>
            <a href="logout">
                <!-- Logout Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                    <path d="M400-160q-33 0-56.5-23.5T320-240v-160h80v160h480v-400H400v160h-80v-160q0-33 23.5-56.5T400-800h480q33 0 56.5 23.5T960-720v400q0 33-23.5 56.5T880-240H400ZM240-560l-56 56q-12 12-28 12t-28-12q-12-12-12-28t12-28l128-128q12-12 28-12t28 12l128 128q12 12 12 28t-12 28q-12 12-28 12t-28-12l-56-56Z" />
                </svg>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>