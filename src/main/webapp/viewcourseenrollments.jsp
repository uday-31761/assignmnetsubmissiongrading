<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Enrollment</title>
    <style>
               /* Basic reset */
        body, h3, p {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Container for the main content */
        main {
            padding: 20px;
            background-color: black;
        }

        /* Title styles */
        h3 {
            text-align: center;
            color: white;
        }

        /* Card container */
        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Individual card styles */
        .course-card {
            background: linear-gradient(180deg, #0a0c1a, #0b1b33, #0c2a4d);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 250px;
            padding: 15px;
            text-align: center;
            position: relative; /* For hover effect positioning */
            overflow: hidden; /* Ensure circle expansion doesn't go outside card */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            color: white; /* Updated for readability */
        }

        /* Hover effect for cards */
       .course-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 0;
            height: 0;
            background: #333333; /* Default color */
            border-radius: 50%;
            transition: width 1s ease, height 1s ease, background-color 1s ease;
            z-index: 0;
        }

        .course-card:hover::before {
            width: 300%;
            height: 300%;
            background-color: rgba(30, 30, 30, 0.9); /* Selective dark color */
        }

        .course-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .course-card * {
            position: relative;
            z-index: 1; /* Ensure text stays on top */
        }

        /* Button styles */
        .action-button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .action-button:hover {
            background-color: #0056b3;
        }

        /* Media queries for responsiveness */
        @media (max-width: 768px) {
            .course-card {
                width: 200px;
            }
        }

        @media (max-width: 480px) {
            .course-card {
                width: 180px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
    <main>
        <h3>Course Enrollment</h3><br/>
        <!-- Course cards container -->
        <div class="course-container">
            <c:forEach items="${courselist}" var="course">
                <div class="course-card">
                    <h3><c:out value="${course.name}" /></h3>
                    <p><strong>Course Code:</strong> <c:out value="${course.code}" /></p>
                    <p><strong>Credits:</strong> <c:out value="${course.credits}" /></p>
                    <p><strong>Start Date:</strong> <c:out value="${course.startDate}" /></p>
                    <p><strong>End Date:</strong> <c:out value="${course.endDate}" /></p>
                    <form method="post" action="checkfaculty" class="action-form">
                        <input type="hidden" name="courseCode" value="${course.code}">
                        <button type="submit" class="action-button">Register</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>
</body>
</html>
