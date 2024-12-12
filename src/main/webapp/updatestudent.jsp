<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <main>
        <h3 style="text-align: center;"><u>Update Student</u></h3>
        <div class="form-container">
            <form method="post" action="updatestu">
                <table align="center">
                    <tr>
                        <td><label for="sid">Student ID</label></td>
                        <td>
                            <input type="number" id="sid" name="sid" required 
                                   value="${student.id}" readonly />
                        </td>
                    </tr>

                    <tr>
                        <td><label for="sname">Enter Name</label></td>
                        <td>
                            <input type="text" id="sname" name="sname" required 
                                   value="${student.name}" />
                        </td>
                    </tr>

                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="sgender" value="MALE" 
                                   ${student.gender == 'MALE' ? 'checked' : ''} />
                            <label for="male">Male</label>
                            
                            <input type="radio" id="female" name="sgender" value="FEMALE" 
                                   ${student.gender == 'FEMALE' ? 'checked' : ''} />
                            <label for="female">Female</label>
                            
                            <input type="radio" id="others" name="sgender" value="OTHERS" 
                                   ${student.gender == 'OTHERS' ? 'checked' : ''} />
                            <label for="others">Others</label>
                        </td>
                    </tr>

                    <tr>
                        <td><label for="sage">Enter Age</label></td>
                        <td>
                            <input type="number" id="sage" name="sage" step="0.1" required 
                                   value="${student.age}" />
                        </td>
                    </tr>

                    <tr>
                        <td><label for="sdepartment">Select Department</label></td>
                        <td>
                            <select id="sdepartment" name="sdepartment" required>
                                <option value="CSE" ${student.department == 'CSE' ? 'selected' : ''}>CSE</option>
                                <option value="CSIT" ${student.department == 'CSIT' ? 'selected' : ''}>CSIT</option>
                                <option value="AIDS" ${student.department == 'AIDS' ? 'selected' : ''}>AIDS</option>
                                <option value="EEE" ${student.department == 'EEE' ? 'selected' : ''}>EEE</option>
                                <option value="ECE" ${student.department == 'ECE' ? 'selected' : ''}>ECE</option>
                                <option value="MECH" ${student.department == 'MECH' ? 'selected' : ''}>MECH</option>
                                <option value="CIVIL" ${student.department == 'CIVIL' ? 'selected' : ''}>CIVIL</option>
                                <option value="OTHER" ${student.department == 'OTHER' ? 'selected' : ''}>OTHER</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: center">
                            <input type="submit" value="Update Student" />&nbsp;&nbsp;&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
</body>
</html>
