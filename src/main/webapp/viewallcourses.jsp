<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Courses</title>
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
    background-color: blue;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.action-button:hover {
    background-color: #lightblue;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body bgcolor="white">
<%@include file="adminnavbar.jsp"%>
<main>
<h3 style="text-align: center; color:white">VIEW ALL COURSES</h3>
<form method="get" action="" align="right" class="search-form"
			style="text-align: center; margin-bottom: 20px;">
			<input type="text" name="searchId" placeholder="Enter Course Code"
				value="${param.searchId}">
			<button type="submit">Search</button>
		</form>

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
    <c:if test="${empty param.searchId || course.code == param.searchId}">
        <tr bgcolor="white" align="center">
            <td><c:out value="${course.code}"/></td>
            <td><c:out value="${course.name}"/></td>
            <td><c:out value="${course.credits}"/></td>
            <td><c:out value="${course.startDate}"/></td>
            <td><c:out value="${course.endDate}"/></td>
            
            <td>
			     <a href='<c:url value="updatecourse" />?ccode=${course.code}' class="action-button">Update Details</a>
			     
			     
			     
			</td>
        </tr>
        </c:if>
    </c:forEach>
</table>
</main>
</body>
</html>
