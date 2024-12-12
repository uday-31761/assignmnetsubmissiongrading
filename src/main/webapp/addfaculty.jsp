<!DOCTYPE html>
<html>
<head>
<title>Faculty Registration</title>
</head>
<%@include file="adminnavbar.jsp"%>
<body>
<main>
	<h3 style="text-align: center;">
		<u>Faculty Registration</u>
	</h3>
	<div class="form-container">
		<form method="post" action="insertfaculty">
			<table align="center">
				<tr>
					<td><label for="fname">Enter Name</label></td>
					<td><input type="text" id="fname" name="fname" required /></td>
				</tr>
				
				<tr>
					<td><label>Select Gender</label></td>
					<td>
					<input type="radio" id="male" name="fgender" value="MALE"required /> 
					<label for="male">Male</label> 
					<input type="radio" id="female" name="fgender" value="FEMALE" required /> 
					<label for="female">Female</label> 
					<input type="radio" id="others" name="fgender" value="OTHERS" required /> 
					<label for="others">Others</label>
					</td>
				</tr>
				
				<tr>
					<td><label for="fdob">Enter Date of Birth</label></td>
					<td><input type="date" id="fdob" name="fdob" required /></td>
				</tr>
				
				<tr>
					<td><label for="fdepartment">Select Department</label></td>
					<td><select id="fdepartment" name="fdepartment" required>
							<option value="">---Select---</option>
                            <option value="CSE">CSE</option>
                            <option value="CSIT">CSIT</option>
                            <option value="AIDS">AIDS</option>
                            <option value="EEE">EEE</option>
                            <option value="ECE">ECE</option>
                            <option value="MECH">MECH</option>
                            <option value="CIVIL">CIVIL</option>
                            <option value="OTHER">OTHER</option>
					</select></td>
				</tr>
			
				<tr>
					<td><label for="fsalary">Enter Salary</label></td>
					<td><input type="number" id="fsalary" name="fsalary"
						step="0.01" required /></td>
				</tr>
				<tr>
					<td><label for="femail">Enter Email-ID</label></td>
					<td><input type="email" id="femail" name="femail" required /></td>
				</tr>
				<tr>
					<td><label for="flocation">Enter Location</label></td>
					<td><input type="text" id="flocation" name="flocation"
						required /></td>
				</tr>
				<tr>
          <td><label for="fcontact">Enter Contact</label></td>
          <td><input type="text" id="fcontact" name="fcontact"
            pattern="[6-9][0-9]{9}"
            title="Contact number must start with 6, 7, 8, or 9 and be 10 digits long."
            required /></td>
        </tr>
				
				
				<tr>
					<td colspan="2" class="button-container" style="text-align: center">
					<input type="submit" value="Register" /> &nbsp;&nbsp;&nbsp;
					<input type="reset" value="Clear" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	</main>
</body>
</html>