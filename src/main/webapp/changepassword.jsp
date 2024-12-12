<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Updation</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>
        // Function to validate email
        function checkEmail() {
            let email = document.getElementById("email").value;
            fetch(`checkemail?email=${email}`)
                .then(response => response.json())
                .then(data => {
                    if (data.exists) {
                    	document.getElementById("emailMessage").innerText = "Email not found!";
                    } else {
                    	document.getElementById("emailSection").style.display = "none";
                        document.getElementById("passwordSection").style.display = "block";
                        document.getElementById("hiddenEmail").value = email; // Set the email to hidden field
                    }
                });
        }

        // Function to validate password
        function validatePassword() {
            let password = document.getElementsByName("newPassword")[0].value;
            let errorMessage = "";
            
            // Password validation pattern
            let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            
            // Check if the password matches the pattern
            if (!passwordPattern.test(password)) {
                errorMessage = "Password must be at least 8 characters long and include at least one lowercase letter, one uppercase letter, one number, and one symbol.";
            }

            // Display error message if validation fails
            if (errorMessage) {
                document.getElementById("errorMessage").innerText = errorMessage;
                return false; // Prevent form submission
            } else {
                document.getElementById("errorMessage").innerText = "";
                return true; // Allow form submission
            }
        }
    </script>
    <style>
    /* General page styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
    color: #333;
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-top: 30px;
}

h3 {
    color: #34495e;
    margin-bottom: 15px;
    text-align: center;
}

#emailSection, #passwordSection {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
    border-color: #3498db;
    outline: none;
}

button {
    width: 100%;
    padding: 12px;
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #2980b9;
}

#emailMessage {
    text-align: center;
    font-size: 14px;
    margin-top: 10px;
}

#passwordSection {
    display: none; /* Initially hidden */
}

#errorMessage {
    color: red;
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
}

    </style>
</head>
<body>
<%@ include file="mainnavbar.jsp" %>

<h2>Password Updation</h2>

<div id="emailSection">
    <h3>Enter Email to Update Password</h3>
    <input type="text" id="email" placeholder="Enter your email" required>
    <button onclick="checkEmail()">Check Email</button>
    <p id="emailMessage" style="color:red;"></p>
</div>

<div id="passwordSection" style="display:none;">
    <h3>Update Password</h3>
    <form action="updatepassword" method="post" onsubmit="return validatePassword()">
        <input type="hidden" id="hiddenEmail" name="email">
        <input type="password" name="newPassword" placeholder="Enter new password" required>
        <button type="submit">Update Password</button>
    </form>
    <p id="errorMessage"></p> <!-- Display error message here -->
</div>

</body>
</html>
