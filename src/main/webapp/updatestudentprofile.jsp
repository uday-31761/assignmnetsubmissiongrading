<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>
</head>
<body>
	<%@include file="studentnavbar.jsp"%>
	<main>
		<h3 style="text-align: center; color: white">
			<u>Student Registration</u>
		</h3>
		<div class="form-container">
			<form method="post" action="updatestudentpro">
				<table>

					<input type="hidden" name="stid" value="<%=st.getId()%>" />
					<tr>
						<td><label for="sname">Enter Name</label></td>
						<td><input type="text" id="stname" name="sname" required
							value=<%=st.getName()%> /></td>
					</tr>
					<tr>
						<td><label>Select Gender</label></td>
						<td><input type="radio" id="male" name="stgender"
							value="MALE" <%="MALE".equals(st.getGender()) ? "checked" : ""%>
							required /> <label for="male">Male</label> <input type="radio"
							id="female" name="stgender" value="FEMALE"
							<%="FEMALE".equals(st.getGender()) ? "checked" : ""%> required />
							<label for="female">Female</label> <input type="radio"
							id="others" name="stgender" value="OTHERS"
							<%="OTHERS".equals(st.getGender()) ? "checked" : ""%> required />
							<label for="others">Others</label></td>
					</tr>

					<tr>
						<td><label for="stage">Age</label></td>
						<td><input type="number" id="stage" name="stage" required
							value="<%=st.getAge()%>" /></td>
					</tr>
					<tr>
						<td><label for="stdepartment">Select Department</label></td>
						<td><select id="sdepartment" name="stdepartment" required>
								<option value=""
									<%=st.getDepartment() == null || st.getDepartment().isEmpty() ? "selected" : ""%>>---Select---</option>
								<option value="CSE"
									<%="CSE".equals(st.getDepartment()) ? "selected" : ""%>>CSE</option>
								<option value="CSIT"
									<%="CSIT".equals(st.getDepartment()) ? "selected" : ""%>>CSIT</option>
								<option value="AIDS"
									<%="AIDS".equals(st.getDepartment()) ? "selected" : ""%>>AIDS</option>
								<option value="EEE"
									<%="EEE".equals(st.getDepartment()) ? "selected" : ""%>>EEE</option>
								<option value="ECE"
									<%="ECE".equals(st.getDepartment()) ? "selected" : ""%>>ECE</option>
								<option value="MECH"
									<%="MECH".equals(st.getDepartment()) ? "selected" : ""%>>MECH</option>
								<option value="CIVIL"
									<%="CIVIL".equals(st.getDepartment()) ? "selected" : ""%>>CIVIL</option>
								<option value="OTHER"
									<%="OTHER".equals(st.getDepartment()) ? "selected" : ""%>>OTHER</option>
						</select></td>
					</tr>



					<tr align="center">
						<td colspan="2" class="button-container"
							style="text-align: center"><input type="submit"
							value="Update" />&nbsp;&nbsp;&nbsp; <input type="reset"
							value="Clear" /></td>
					</tr>
				</table>
			</form>
		</div>
	</main>
</body>
</html>