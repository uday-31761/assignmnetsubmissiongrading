<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Assignments</title>
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f9f9f9;
}

h1 {
	text-align: center;
	color: #333;
}

.assignment-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
	margin-top: 20px;
}

.assignment-tile {
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 300px;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.assignment-info h3 {
	margin: 0;
	font-size: 1.2rem;
	color: #007BFF;
}

.assignment-info p {
	margin: 5px 0 0;
	font-size: 0.9rem;
	color: #555;
}

.assignment-actions a {
	text-decoration: none;
	font-size: 0.9rem;
	color: #007BFF;
	transition: color 0.3s;
}

.assignment-actions a:hover {
	color: #0056b3;
	text-decoration: underline;
}

/* Button styles */
.submit-btn {
	display: block;
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	margin: 20px auto;
}

.submit-btn:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}

.submit-btn:active {
	transform: scale(0.95);
}

/* Overlay Styles */
/* Updated overlay styles */
.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1000;
	overflow-y: auto; /* Enable scrolling */
	justify-content: center;
	align-items: flex-start; /* Align form at the top */
	padding: 20px; /* Prevent content from touching edges */
}

/* Updated form container styles */
.form-container {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	max-width: 600px;
	width: 100%; /* Full width for smaller screens */
	margin: 40px auto; /* Center content with margin */
	box-sizing: border-box;
}

/* Input field styling */
input, textarea, select, button {
	width: 100%; /* Full width for better responsiveness */
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	box-sizing: border-box; /* Include padding in width */
}

/* Update for submit button inside the form */
.form-container .submit-btn {
	width: auto; /* Adapt size to content */
	margin: 0; /* Remove margin auto from global styles */
}

/* Close button adjustments */
.close-btn {
	font-size: 1.5rem;
	color: #333;
	cursor: pointer;
	text-align: right;
	margin-bottom: 10px;
	float: right;
}

.close-btn:hover {
	color: red;
}
</style>
</head>
<body>

	<%@include file="facultynavbar.jsp"%>

	<main>
		<h1>Assignment Management</h1>

		<!-- Button to Show Form -->
		<button onclick="showForm()" class="submit-btn">Create
			Assignment</button>

		<div class="assignment-container">
			<c:forEach var="assignment" items="${assignments}">
				<div class="assignment-tile">
					<div class="assignment-info">
						<h3>${assignment.title}</h3>
						<p>Code: ${assignment.courseCode}</p>
					</div>
					<div class="assignment-actions">
						<a href="#" onclick="viewDetails(${assignment.id})">👁️ View
							Details</a> <a href="displaypdf?id=${assignment.id}">⬇️ Download</a>
						<a href="viewSubmissions?id=${assignment.id}">📂 View
							Submissions</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Overlay for Assignment Details -->
		<div class="overlay" id="assignmentDetailsOverlay">
			<div class="details-container">
				<span class="close-btn" onclick="hideDetails()">×</span>
				<h2 id="detailsTitle">Assignment Title</h2>
				<p>
					<strong>Code:</strong> <span id="detailsCode"></span>
				</p>
				<p>
					<strong>Description:</strong> <span id="detailsDescription"></span>
				</p>
				<p>
					<strong>Start Date:</strong> <span id="detailsStartDate"></span>
				</p>
				<p>
					<strong>Due Date:</strong> <span id="detailsDueDate"></span>
				</p>
				<p>
					<strong>Status:</strong> <span id="detailsStatus"></span>
				</p>
			</div>	
		</div>

		<!-- Overlay Form -->
		<div class="overlay" id="assignmentFormOverlay">
			<div class="form-container">
				<span class="close-btn" onclick="hideForm()">×</span>
				<form action="AddAssignment" method="post" enctype="multipart/form-data">
					<label for="title">Title:</label>
					<input type="text" id="title" name="title" required>

					<label for="description">Description:</label>
					<textarea id="description" name="description" rows="4"></textarea>

					<label for="startDate">Start Date:</label>
					<input type="date" id="startDate" name="startDate">

					<label for="dueDate">Due Date:</label>
					<input type="date" id="dueDate" name="dueDate">

					<label for="courseCode">Course Code:</label>
					<input type="text" id="courseCode" name="courseCode" value="${course.code}" readonly required>

					<label for="status">Status:</label>
					<select id="status" name="status">
						<option value="open">Open</option>
						<option value="close">Close</option>
					</select>

					<label for="maximumGrade">Maximum Grade:</label>
					<input type="number" id="maximumGrade" name="maximumGrade" required>

					<label for="files">Upload File:</label>
					<input type="file" id="files" name="files" accept=".pdf">

					<button type="submit" class="submit-btn">Add Assignment</button>
				</form>
			</div>
		</div>
	</main>

	<script>
    function showForm() {
        document.getElementById('assignmentFormOverlay').style.display = 'flex';
    }

    function hideForm() {
        document.getElementById('assignmentFormOverlay').style.display = 'none';
    }

    function viewDetails(id) {
        fetch(`getAssignmentDetails?id=${id}`)
            .then(response => response.json())
            .then(data => {
                document.getElementById('detailsTitle').textContent = data.title;
                document.getElementById('detailsCode').textContent = data.courseCode;
                document.getElementById('detailsDescription').textContent = data.description;
                document.getElementById('detailsStartDate').textContent = data.startDate;
                document.getElementById('detailsDueDate').textContent = data.dueDate;
                document.getElementById('detailsStatus').textContent = data.status;
                document.getElementById('assignmentDetailsOverlay').style.display = 'flex';
            })
            .catch(error => {
                console.error('Error fetching assignment details:', error);
                alert('Failed to load assignment details.');
            });
    }

    function hideDetails() {
        document.getElementById('assignmentDetailsOverlay').style.display = 'none';
    }
</script>

</body>
</html>
