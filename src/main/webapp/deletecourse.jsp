<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Courses</title>
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
        function confirmDelete(courseCode) {
            return confirm("Are you sure you want to delete the course with code: " + courseCode + "?");
        }
    </script>
</head>
<body bgcolor="white">
<%@include file="adminnavbar.jsp"%>
<main>
<h3 style="text-align: center; color:white">DELETE COURSES</h3>
<br>
<table align="center" border=3 width=80% cellpadding="5px">
    <tr bgcolor="lightblue">
        <th>COURSE CODE</th>
        <th>COURSE NAME</th>
        <th>CREDITS</th>
        <th>START DATE</th>
        <th>END DATE</th>
        <th>ACTION</th>
    </tr>
    <c:forEach items="${courselist}" var="course">
        <tr bgcolor="white" align="center">
            <td><c:out value="${course.code}"/></td>
            <td><c:out value="${course.name}"/></td>
            <td><c:out value="${course.credits}"/></td>
            <td><c:out value="${course.startDate}"/></td>
            <td><c:out value="${course.endDate}"/></td>
            
            	<td>
				<a href='<c:url value="deletecou?code=${course.code}"/>' 
               class="delete-link" 
               onclick="return confirmDelete('${course.code}')">Delete</a>
				</td>
				
				<td>
						<form action="deletefaccou" method="post" style="margin: 0;">
							<!-- Pass the ID of the mapping to be deleted -->
							<input type="hidden" name="id" value="${fcm.id}" />
							<button type="submit" class="action-button">Delete</button>
						</form>
					</td>
        </tr>
    </c:forEach>
</table>
</main>
</body>
</html>
