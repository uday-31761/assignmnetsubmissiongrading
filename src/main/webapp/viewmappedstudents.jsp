<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Students</title>
<style>
.search-form button {
	padding: 8px 15px;
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
	<%@include file="facultynavbar.jsp"%>
	<main>
		<h3 style="text-align: center; color: white">VIEW MAPPED STUDENTS</h3>

		<!-- Search Form -->
			<form method="get" action="" align="right" class="search-form"
				style="text-align: center; margin-bottom: 20px;">
				<input type="text" name="searchId" placeholder="Enter Student ID"
					value="${param.searchId}">
				<button type="submit">Search</button>
			</form>

		<br>
		<table align="center" border=3 width=80% cellpadding="5px">
			<tr bgcolor="lightblue">
				<th>ID</th>
				<th>NAME</th>
				<th>GENDER</th>
				<th>DEPARTMENT</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
			</tr>
			<c:forEach items="${studentlist}" var="student">
				<c:if test="${empty param.searchId || student.id == param.searchId}">
					<tr bgcolor="white" align="center">
						<td><c:out value="${student.id}" /></td>
						<td><c:out value="${student.name}" /></td>
						<td><c:out value="${student.gender}" /></td>
						<td><c:out value="${student.department}" /></td>
						<td><c:out value="${student.email}" /></td>
						<td><c:out value="${student.contact}" /></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</main>
</body>
</html>
