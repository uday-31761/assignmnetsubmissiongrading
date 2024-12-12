<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Faculty</title>
<style>
.search-form button {
	padding: 10px 15px;
	font-size: 14px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.search-form button:hover {
	background-color: #45a049;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
.action-button {
    display: inline-block;
    padding: 8px 15px;
    font-size: 14px;
    color: white;
    background-color: #4CAF50;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.action-button:hover {
    background-color: #45a049;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body bgcolor="white">

	<%@include file="adminnavbar.jsp"%>
	<main>
		<h3 style="text-align: center; color: white">VIEW ALL FACULTY</h3>
		
		<form method="get" action="" align="right" class="search-form"
			style="text-align: center; margin-bottom: 20px;">
			<input type="text" name="searchId" placeholder="Enter Faculty ID"
				value="${param.searchId}">
			<button type="submit">Search</button>
		</form>
		<br>
		<table align="center" border=3 width=80% cellpadding="5px">
			<tr bgcolor="lightblue">
				<th>ID</th>
				<th>NAME</th>
				<th>GENDER</th>
				<th>DATE OF BIRTH</th>
				<th>DEPARTMENT</th>
				<th>SALARY</th>
				<th>EMAIL</th>
				<th>LOCATION</th>
				<th>CONTACT</th>
				<th>ACTION</th>
			</tr>
			<c:forEach items="${facultylist}" var="faculty">
			<c:if test="${empty param.searchId || faculty.id == param.searchId}">
				<tr bgcolor="white" align="center">
					<td><c:out value="${faculty.id}" /></td>
					<td><c:out value="${faculty.name}" /></td>
					<td><c:out value="${faculty.gender}" /></td>
					<td><c:out value="${faculty.dateofbirth}" /></td>
					<td><c:out value="${faculty.department}" /></td>
					<td><c:out value="${faculty.salary}" /></td>
					<td><c:out value="${faculty.email}" /></td>
					<td><c:out value="${faculty.location}" /></td>
					<td><c:out value="${faculty.contact}" /></td>

					<td>
					     <a href='<c:url value="updatefaculty"/>?id=${faculty.id}' class="action-button">Update Details</a>
					</td>

				</tr>
				</c:if>
			</c:forEach>
		</table>
	</main>
</body>
</html>
