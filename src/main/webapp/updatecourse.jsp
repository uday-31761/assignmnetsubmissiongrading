<!DOCTYPE html>
<html>
<head>
<title>Update Course</title>
</head>
<body>
	<%@include file="adminnavbar.jsp"%>
	<main>
		<h3 style="text-align: center;">
			<u>Update Course</u>
		</h3>
		<div class="form-container">
			<form method="post" action="updatec">
				<table align="center">
					<tr>
						<td><label for="ccode">Course Code</label></td>
						<td><input type="text" id="ccode" name="ccode" required
							value="${course.code}" readonly /></td>
					</tr>

					<tr>
						<td><label for="cname">Course Name</label></td>
						<td><input type="text" id="cname" name="cname" required
							value="${course.name}" /></td>
					</tr>

					<tr>
						<td><label for="ccredits">Credits</label></td>
						<td><input type="number" id="ccredits" name="ccredits"
							required value="${course.credits}" /></td>
					</tr>

					<tr>
						<td><label for="cstart_date">Start Date</label></td>
						<td><input type="date" id="cstart_date" name="cstart_date"
							value="${course.startDate}" /></td>
					</tr>

					<tr>
						<td><label for="cend_date">End Date</label></td>
						<td><input type="date" id="cend_date" name="cend_date"
							value="${course.endDate}" /></td>
					</tr>

					<tr>
						<td colspan="2" class="button-container"
							style="text-align: center"><input type="submit"
							value="Update Course" />&nbsp;&nbsp;&nbsp; 
					    </td>
					</tr>
				</table>
			</form>
		</div>
	</main>
</body>
</html>
