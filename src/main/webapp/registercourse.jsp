<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Course</title>
    <style>
        /* Add your styles here */
        .form-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            position: relative; /* This allows positioning of the back button at the bottom left */
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        /* Back button style */
        .back-button {
            padding: 10px 20px;
            background-color: greycolor; /* Grey color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: absolute;
            bottom: 10px;
            left: 10px; /* Align it to the left side at the bottom */
        }

        .back-button:hover {
            background-color: #6c6c6c; /* Darker grey on hover */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
    <div class="form-container" align="center">
        <h3 style="text-align: center;">Register for Course</h3>

        <!-- Form content -->
        <form method="post" action="registercourse">
        
            <input type="hidden" name="courseCode" value="${courseCode}">
            
            <input type="hidden" name="sid" value="<%=st.getId() %>">
            
            <div align="center">
                <label for="facultyId">Select Faculty:</label>
                <select id="facultyId" name="facultyId" required>
                    <option value="">---Select---</option>
                    
                    <c:forEach items="${facultylist}" var="faculty">
                        <option value="${faculty.id}">${faculty.id} - ${faculty.name}</option>
                    </c:forEach>
                </select>
            </div>
            
            <button type="submit">Submit</button>
        </form>

        <!-- Back Button positioned at the bottom left of the form -->
        <button class="back-button" onclick="window.location.href='viewcourseenrollments'">Back</button>
    </div>
</body>
</html>
