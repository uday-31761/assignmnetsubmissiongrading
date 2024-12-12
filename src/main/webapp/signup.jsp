<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User SignUp</title>
    <link rel="stylesheet" type="text/css" href="/style.css"> <!-- If you have a global stylesheet, otherwise you can skip this -->
    
    <style>
    /* Login form container styling */
    .form-container {
        background: rgba(255, 255, 255, 0.9); /* Slightly transparent white background for the form */
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 1000px;  /* Increased horizontal size */
        margin: 0 auto;  /* Center the form horizontally */
        text-align: center;
    }

    /* Table styling */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    /* Table cell padding */
    td {
        padding: 10px 10px;
    }

    /* Label styling */
    label {
        font-size: 1.1rem;
        font-weight: bold;
        color: #333;
        display: block;
        margin-bottom: 8px;
    }

    /* Input fields styling */
    input[type="text"], input[type="email"], input[type="password"], select {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 1rem;
        box-sizing: border-box;
        transition: border 0.3s ease;
    }

    /* Focus state for input fields */
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
        border-color: #4caf50;
        outline: none;
    }

    /* Submit and Reset button styling */
    input[type="submit"], input[type="reset"] {
        padding: 12px;
        border-radius: 5px;
        border: none;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s ease;
        margin: 10px 5px;  /* Space between buttons */
        width: 45%;  /* Adjust width for side-by-side placement */
    }

    /* Submit button styling */
    input[type="submit"] {
        background-color: #4caf50;
        color: white;
    }

    /* Reset button styling */
    input[type="reset"] {
        background-color: #f44336;
        color: white;
    }

    /* Hover effects for buttons */
    input[type="submit"]:hover {
        background-color: #45a049;
    }

    input[type="reset"]:hover {
        background-color: #e53935;
    }

    /* Link styling */
    a {
        font-size: 0.9rem;
        color: #2196f3;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #1976d2;
    }

    /* Error message styling */
    h3 {
        color: red;
        margin-bottom: 20px;
    }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>
    <h1 style="text-align: center;"><i>User SignUp</i></h1>
    <br/>
    <h3 align="center" class="error-msg"><c:out value="${msg}"></c:out></h3>
    
    <div class="form-container">
        <form method="post" action="accountreg">
            <table align="center">
                <!-- Select Role -->
                <tr>
                    <td><label for="utype">Select Role</label></td>
                    <td><select id="utype" name="utype" required>
                            <option value="">---Select Role---</option>
                            <option value="FACULTY">Faculty</option>
                            <option value="STUDENT">Student</option>
                    </select></td>
                </tr>
                
                <!-- User ID -->
                <tr>
                    <td><label for="uid">User ID</label></td>
                    <td><input type="text" id="uid" name="uid" required /></td>
                </tr>
                
                <!-- Submit and Clear buttons -->
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Verify" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
