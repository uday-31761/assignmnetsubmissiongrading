<%@page import="com.klef.jfsd.oasgs.model.Faculty"%>
<%@page import="com.klef.jfsd.oasgs.model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
Account a = (Account)session.getAttribute("account");
Faculty f=(Faculty)session.getAttribute("user");
if(a==null)
{
  response.sendRedirect("sessionfail");
  return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Portal</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/navbar.css">
    <link rel="stylesheet" href="/cardcourse.css">
    <script type="text/javascript" src="/app.js" defer></script>
</head>
<body>
    <nav id="sidebar">
        <ul>
            <li><a href="facultyhome" class="logo">Faculty Panel</a>
    <button onclick="toggleSidebar()" id="toggle-btn">
        <svg xmlns="http://www.w3.org/2000/svg" height="24px"
            viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
            <path
                d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z" />
        </svg>
    </button>
</li>

            <li class="active">
                <a href="facultyhome">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M480-740L240-560v360h120v-200q0-17 11.5-28.5T400-440h160q17 0 28.5 11.5T600-400v200h120v-360L480-740ZM400-120H240q-33 0-56.5-23.5T160-200v-360h640v360q0 33-23.5 56.5T720-120H560q-17 0-28.5-11.5T520-160v-200h-80v200q0 17-11.5 28.5T400-120Z"/>
                    </svg>
                    <span>Home</span>
                </a>
            </li>
            <li>
                <a href="viewmappedcourses?facultyId=${facultyId}">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M160-800h640v80H160v-80Zm0 320h480v80H160v-80Zm0 320h640v80H160v-80Zm0-160h320v80H160v-80Zm0-160h640v80H160v-80Z"/>
                    </svg>
                    <span>View Courses</span>
                </a>
            </li>
            <li>
                <a href="viewmappedstudents">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M480-760q-58 0-98.5 40.5T341-621q0 58 40.5 98.5T480-482q58 0 98.5-40.5T619-621q0-58-40.5-98.5T480-760ZM160-560v80h640v-80H160Z"/>
                    </svg>
                    <span>View Students</span>
                </a>
            </li>
            <li>
                <a href="facultyprofile">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M480-760q-58 0-98.5 40.5T341-621q0 58 40.5 98.5T480-482q58 0 98.5-40.5T619-621q0-58-40.5-98.5T480-760ZM240-160v-80q0-58 40.5-98t98.5-40h160q58 0 98.5 40t40.5 98v80H240Z"/>
                    </svg>
                    <span>View Profile</span>
                </a>
            </li>
            <li>
                <a href="logout">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M160-240v-480h320v80H240v320h240v80H160Zm400-160v-80h320v80H560ZM640-440v-80h240v80H640Z"/>
                    </svg>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </nav>
</body>
</html>
