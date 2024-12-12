<%@ page import="com.klef.jfsd.oasgs.model.Registrations" %>
<%@ page import="com.klef.jfsd.oasgs.service.RegistrationsService" %>

<%
    Registrations registration = (Registrations) request.getAttribute("registrationStatus");
    boolean enrollmentStatus = registration != null && registration.isStatus();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Enrollment Status</title>
    <style>
        body {
        	align:center;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
        
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            padding: 20px;
            text-align: center;
        }
        .card h1 {
            font-size: 24px;
            color: #333333;
        }
        .status {
            font-size: 20px;
            font-weight: bold;
            color: <%= enrollmentStatus ? "#28a745" : "#dc3545" %>; /* Green for open, red for close */
            margin-bottom: 20px;
        }
        .radio-group {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
        }
        .radio-group label {
            font-size: 16px;
            color: #333333;
        }
        button {
            background: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        button:hover {
            background: #0056b3;
        }
        
    </style>
</head>
<body>
  <%@ include file="adminnavbar.jsp" %>
  <main align = center >
    <div class="card" align = center>
        <h1>Manage Enrollment Status</h1>
        <p>Current Status:</p>
        <div class="status"><%= enrollmentStatus ? "Open" : "Closed" %></div>

        <!-- Form to update the enrollment status -->
        <form method="POST" action="/enrollment/update">
            <div class="radio-group">
                <label>
                    <input type="radio" name="enrollmentStatus" value="true" <%= enrollmentStatus ? "checked" : "" %>>
                    Open
                </label>
                <label>
                    <input type="radio" name="enrollmentStatus" value="false" <%= !enrollmentStatus ? "checked" : "" %>>
                    Closed
                </label>
            </div>
            <button type="submit">Update Status</button>
        </form>
    </div>
  </main>
</body>
</html>
