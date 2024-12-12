<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Faculty Course Mapping</title>
</head>
<body align="center">
	<%@include file="adminnavbar.jsp"%>
	<div class="container">
		<h2 style="text-align: center;">Faculty Course Mapping</h2>
		<br />

		<c:if test="${not empty infoMessage}">
			<div style="color: red; text-align: center;">${infoMessage}</div>
		</c:if>

		<c:if test="${not empty successMessage}">
			<div
				style="background-color: green; color: white; padding: 10px 20px; width: fit-content; margin-top: 20px; border-radius: 5px; position: absolute; right: 10px; top: 10px;">
				${successMessage}
			</div>
		</c:if>

		<form action="facultycoursemapping" method="post">
			<table align="center">
				<tr>
					<td><label for="faculty">Faculty</label></td>
					<td><select name="facultyId" id="faculty" required>
							<option value="">Select Faculty</option>
							<c:forEach var="faculty" items="${facultyList}">
								<option value="${faculty.id}">${faculty.id}-
									${faculty.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label for="course">Course</label></td>
					<td><select name="courseCode" id="course" required>
							<option value="">Select Course</option>
							<c:forEach var="course" items="${courseList}">
								<option value="${course.code}">${course.code}-
									${course.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label for="assignedDate">Assigned Date</label></td>
					<td><input type="date" name="assignedDate" id="assignedDate"
						value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>"
						readonly required></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="Submit" class="btn-submit" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
