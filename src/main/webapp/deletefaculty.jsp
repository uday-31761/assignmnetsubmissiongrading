<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteFaculty</title>
<style>
    .delete-link {
    display: inline-block;
    padding: 8px 15px;
    font-size: 14px;
    color: white;
    background-color: red;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.delete-link:hover {
    background-color: red;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
    </style>
<script>
	function confirmDelete(facultyId) {
		return confirm("Are you sure you want to delete the faculty with ID: "
				+ facultyId + "?");
	}
</script>
</head>
</head>
<body bgcolor="white">
	<%@include file="adminnavbar.jsp"%>
	<main>
		<h3 style="text-align: center; color: white">DELETE FACULTY</h3>
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
					<a href='<c:url value="deletefac?id=${faculty.id}"/>'  class="delete-link" 
                                                      onclick="return confirmDelete('${faculty.id}')">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>
