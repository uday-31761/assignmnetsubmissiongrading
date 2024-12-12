<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
  <%@include file="adminnavbar.jsp" %>
  <main>
    <h3 style="text-align: center;"><u>Student Registration</u></h3>
    <div class="form-container">
        <form method="post" action="insertstudent">
            <table>
                <tr>
                    <td><label for="sname">Enter Name</label></td>
                    <td><input type="text" id="sname" name="sname" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="sgender" value="MALE" required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="sgender" value="FEMALE" required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="sgender" value="OTHERS" required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="sage">Enter Age</label></td>
                    <td><input type="number" id="sage" name="sage" required/></td>
                </tr>
                <tr>
                    <td><label for="sdepartment">Select Department</label></td>
                    <td>
                        <select id="sdepartment" name="sdepartment" required>
                            <option value="">---Select---</option>
                            <option value="CSE">CSE</option>
                            <option value="CSIT">CSIT</option>
                            <option value="AIDS">AIDS</option>
                            <option value="EEE">EEE</option>
                            <option value="ECE">ECE</option>
                            <option value="MECH">MECH</option>
                            <option value="CIVIL">CIVIL</option>
                            <option value="OTHER">OTHER</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="semail">Enter Email ID</label></td>
                    <td><input type="email" id="semail" name="semail" required/></td>
                </tr>
                <tr>
          <td><label for="scontact">Enter Contact</label></td>
          <td><input type="text" id="scontact" name="scontact"
            pattern="[6-9][0-9]{9}"
            title="Contact number must start with 6, 7, 8, or 9 and be 10 digits long."
            required /></td>
        </tr>
                
                <tr align="center">
                    <td colspan="2" class="button-container" style="text-align: center">
                        <input type="submit" value="Register"/>&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </main>
</body>
</html>