<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Expired</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
.login-btn {
	background-color: #4CAF50;
	border: none; /* No border */
	color: white; /* White text */
	padding: 10px 15px; /* Padding inside the button */
	text-align: center; /* Center text */
	text-decoration: none; /* Remove underline */
	display: inline-block; /* Inline display */
	font-size: 16px; /* Font size */
	margin: 10px 0; /* Margin */
	cursor: pointer; /* Pointer cursor on hover */
	border-radius: 5px; /* Rounded corners */
	transition: background-color 0.3s ease;
	/* Smooth transition for background */
}

.login-btn:hover {
	background-color: #45a049; /* Darker green on hover */
}
</style>

</head>
<body align="center">
	<%@include file="mainnavbar.jsp"%>
	<br/><br/><br/><br/>
	<h3 align="center" style="color: red;">Session Expired</h3>
	<br>
	<div align="center">
		<button class="login-btn" onclick="window.location.href='login'">Login Again</button>
	</div>
</body>
</html>