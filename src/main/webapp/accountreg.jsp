<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Account Registration</title>
    
    <style>
    /* Login form container styling */
    .form-container {
        background: rgba(255, 255, 255, 0.9); /* Slightly transparent white background for the form */
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 700px;  /* Increased horizontal size */
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
    input[type="text"], input[type="email"], input[type="password"] {
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
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
        border-color: #4caf50;
        outline: none;
    }

    /* Submit and Reset button styling */
    input[type="submit"], input[type="reset"] {
        padding: 10px;
        border-radius: 5px;
        border: none;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s ease;
        margin: 10px 5px;  /* Space between buttons */
        width: 35%;  /* Adjust width for side-by-side placement */
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

    /* Error message styling */
    h3 {
        color: red;
        margin-bottom: 20px;
    }
    </style>
</head>
<body>
<%@ include file="mainnavbar.jsp" %>
<br/><br/>
    <div class="form-container">
        
        <h3 align="center">Account Registration</h3>
        <form method="post" action="addaccount">
            <table align="center">
                <!-- User ID -->
                <tr>
                    <td><label for="uid">User ID</label></td>
                    <td><input type="text" id="uid" name="uid" value="${user.id}" readonly required /></td>
                </tr>
                
                <!-- User Type -->
                <tr>
                    <td><label for="role">User Type</label></td>
                    <td><input type="text" id="role" name="role" value="${role}" readonly required /></td>
                </tr>
                
                <!-- Email -->
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" id="email" name="email" value="${user.email}" readonly required /></td>
                </tr>
                
                <!-- Password -->
                <tr>
                    <td><label for="password">Password</label></td>
                    <td><input type="password" id="password" name="upwd" required
                        minlength="8"
                        pattern="(?=.*[A-Z])(?=.*[aeiouAEIOU])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]|\\:;,.<>?/-]).{8,}"
                        title="Password must be at least 8 characters long, include at least one uppercase letter, one vowel, one number, and one special character." />
                    </td>
                </tr>

                <!-- Submit and Reset buttons -->
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Register" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
