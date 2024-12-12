<%@page import="com.klef.jfsd.oasgs.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty home</title>
</head>
<body>
  <%@include file="facultynavbar.jsp" %>
  <h3 align="center">I am in Faculty home</h3>
  <h3 align="center" style="color: orange">Welcome <%=f.getName().toUpperCase() %></h3>
</body>
</html>