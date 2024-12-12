<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
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
        function confirmDelete(studentId) {
            return confirm("Are you sure you want to delete the student with ID: " + studentId + "?");
        }
    </script>
</head>
<body bgcolor="white">
<%@include file="adminnavbar.jsp"%>
<main>
<div>
<h3 style="text-align: center; color: white">DELETE STUDENT</h3>
<br>
<table align="center" border=3 width=80% cellpadding="5px">
    <tr bgcolor="lightblue">
        <th>ID</th>
        <th>NAME</th>
        <th>GENDER</th>
        <th>DEPARTMENT</th>
        <th>EMAIL</th>
        <th>CONTACT</th>
        <th>ACTION</th>
    </tr>
    <c:forEach items="${studentlist}" var="student">
        <tr bgcolor="white" align="center">
            <td><c:out value="${student.id}"/></td>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.gender}"/></td>
            <td><c:out value="${student.department}"/></td>
            <td><c:out value="${student.email}"/></td>
            <td><c:out value="${student.contact}"/></td>
            
            	<td>
				<a href='<c:url value="deletestu?id=${student.id}"/>' 
               class="delete-link" 
               onclick="return confirmDelete('${student.id}')">Delete</a>
				</td>
        </tr>
    </c:forEach>
</table>
</div>
</main>
</body>
</html>
