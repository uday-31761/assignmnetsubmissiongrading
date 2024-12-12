<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Submissions</title>
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

        .action-btn {
            padding: 8px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .action-btn:hover {
            background-color: #218838;
        }

        .form-container {
            margin-top: 20px;
        }

        .form-container input {
            margin: 5px 0;
            padding: 8px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="facultynavbar.jsp"%>
<main>
<h1 style="color: white">Submissions</h1>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Assignment ID</th>
            <th>Student ID</th>
            <th>Submitted On</th>
            <th>Grade</th>
            <th>File</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="submission" items="${submissions}">
            <tr>
                <td>${submission.id}</td>
                <td>${submission.assignmentId}</td>
                <td>${submission.studentId}</td>
                <td>${submission.submittedOn}</td>
                <td>${submission.grade}</td>
                <td><a href="displaysubmission?aid=${submission.assignmentId}&sid=${submission.studentId}" target="_blank">Download</a></td>

                <td>
                    <c:if test="${!submission.status}">
                        <button class="action-btn" onclick="showGradeForm(${submission.id})">Add Grade</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="form-container" id="gradeForm" style="display: none;">
    <form action="AddGrade" method="post">
    	<input type="hidden" id="assignmentId" name="assignmentId" value="${assignment.id}">
        <input type="hidden" id="submissionId" name="submissionId">
        <label for="grade">Grade:</label>
        <input type="number" id="grade" name="grade" min="0" max="${assignment.maximumGrade}" required>
        <button type="submit">Submit Grade</button>
    </form>
</div>

</main>

<script>
    function showGradeForm(submissionId) {
        document.getElementById('submissionId').value = submissionId;
        document.getElementById('gradeForm').style.display = 'block';
    }
</script>

</body>
</html>
