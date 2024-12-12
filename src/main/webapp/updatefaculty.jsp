<!DOCTYPE html>
<html>
<head>
    <title>Update Faculty</title>
</head>
<body>
    <%@include file="adminnavbar.jsp"%>
    <main>
    <h3 style="text-align: center;">
        <u>Update Faculty Information</u>
    </h3>
    
    <div class="form-container">
        <form method="post" action="updatefac">
    <table align="center">
        <tr>
            <td><label for="fid">Faculty ID</label></td>
            <td>
                <input type="text" id="fid" name="fid" required 
                       value="${faculty.id}" readonly />
            </td>
        </tr>

        <tr>
            <td><label for="fname">Enter Name</label></td>
            <td>
                <input type="text" id="fname" name="fname" required 
                       value="${faculty.name}" />
            </td>
        </tr>

        <tr>
            <td><label>Select Gender</label></td>
            <td>
                <input type="radio" id="male" name="fgender" value="MALE" 
                       ${faculty.gender == 'MALE' ? 'checked' : ''} />
                <label for="male">Male</label>
                
                <input type="radio" id="female" name="fgender" value="FEMALE" 
                       ${faculty.gender == 'FEMALE' ? 'checked' : ''} />
                <label for="female">Female</label>
                
                <input type="radio" id="others" name="fgender" value="OTHERS" 
                       ${faculty.gender == 'OTHERS' ? 'checked' : ''} />
                <label for="others">Others</label>
            </td>
        </tr>

        <tr>
            <td><label for="fdob">Enter Date of Birth</label></td>
            <td>
                <input type="date" id="fdob" name="fdob" required 
                       value="${faculty.dateofbirth}" />
            </td>
        </tr>

        <tr>
            <td><label for="fdepartment">Select Department</label></td>
            <td>
                <select id="fdepartment" name="fdepartment" required>
                    <option value="CSE" ${faculty.department == 'CSE' ? 'selected' : ''}>CSE</option>
                    <option value="CSIT" ${faculty.department == 'CSIT' ? 'selected' : ''}>CSIT</option>
                    <option value="AIDS" ${faculty.department == 'AIDS' ? 'selected' : ''}>AIDS</option>
                    <option value="EEE" ${faculty.department == 'EEE' ? 'selected' : ''}>EEE</option>
                    <option value="ECE" ${faculty.department == 'ECE' ? 'selected' : ''}>ECE</option>
                    <option value="MECH" ${faculty.department == 'MECH' ? 'selected' : ''}>MECH</option>
                    <option value="CIVIL" ${faculty.department == 'CIVIL' ? 'selected' : ''}>CIVIL</option>
                    <option value="OTHER" ${faculty.department == 'OTHER' ? 'selected' : ''}>OTHER</option>
                </select>
            </td>
        </tr>

        <tr>
            <td><label for="fsalary">Enter Salary</label></td>
            <td>
                <input type="number" id="fsalary" name="fsalary" step="0.01" required 
                       value="${faculty.salary}" />
            </td>
        </tr>

        <tr>
            <td><label for="flocation">Enter Location</label></td>
            <td>
                <input type="text" id="flocation" name="flocation" required 
                       value="${faculty.location}" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center">
                <input type="submit" value="Update Faculty" />
                
            </td>
        </tr>
    </table>
</form>

    </div>
    </main>
</body>
</html>
