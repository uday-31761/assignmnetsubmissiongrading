<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .assignment-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        table th {
            background-color: #f4f4f4;
            color: #333;
        }

        .submit-btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 60%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .overlay .form-container {
            background: white;
            margin: 5% auto;
            padding: 20px;
            max-width: 600px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close-btn {
            display: block;
            text-align: right;
            font-size: 1.5rem;
            color: #333;
            cursor: pointer;
            margin-bottom: 15px;
        }

        .close-btn:hover {
            color: #ff0000;
        }
    </style>
</head>
<body>

<%@include file="studentnavbar.jsp" %>
<main>
    <h1>Course Details</h1>

    <!-- Table to display assignments -->
    <div class="assignment-container">
        <h2>Assignments</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Start Date</th>
                    <th>Due Date</th>
                    <th>File</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assignment" items="${assignments}">
                    <tr>
                        <td>${assignment.id}</td>
                        <td>${assignment.title}</td>
                        <td>${assignment.description}</td>
                        <td>${assignment.startDate}</td>
                        <td>${assignment.dueDate}</td>
                        <td>
                            <a href="displaypdf?id=${assignment.id}" target="_blank">Download</a>
                        </td>
                        <td>
                            <button class="submit-btn" onclick="showSubmitForm(${assignment.id})">Submit</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Overlay Form for Submission -->
    <div class="overlay" id="submitFormOverlay">
        <div class="form-container">
            <span class="close-btn" onclick="hideSubmitForm()">×</span>
            <form action="addsubmission" method="post" enctype="multipart/form-data">
                <input type="hidden" id="assignmentId" name="assignmentId" av>
                <input type="hidden" id="assignmentId" name="assignmentId">
                <div>
                    <label for="files">Upload File:</label>
                    <input type="file" id="files" name="files" required>
                </div>
                <button type="submit" onclick="submitAssignment()">Submit Assignment</button> <!-- Change to type="button" -->
            </form>
        </div>
    </div>
</main>

<script>
    function showSubmitForm(assignmentId) {
        document.getElementById('assignmentId').value = assignmentId;
        document.getElementById('submitFormOverlay').style.display = 'block';
    }

    function hideSubmitForm() {
        document.getElementById('submitFormOverlay').style.display = 'none';
    }
    
    function submitAssignment() {
        setTimeout(function() {
            alert("${message}");
        }, 500); 
    }
</script>
</body>
</html>
