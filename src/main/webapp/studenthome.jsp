<%@page import="com.klef.jfsd.oasgs.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
</head>
<body>
  <%@include file="studentnavbar.jsp" %>
  <h3 align="center">I am in Student Home</h3>
  <h3 align="center" style="color: orange">Welcome <%=st.getName().toUpperCase() %></h3>
</body>
</html>