<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Courses</title>
    <link rel="stylesheet" href="path-to-your-css-file.css">
</head>
<body>
  <%@include file="studentnavbar.jsp" %>
  <main>
    <div class="ag-format-container">
        <div class="ag-courses_box">
            <c:forEach var="course" items="${courselist}">
                <div class="ag-courses_item">
                    <a href="viewstudentcoursedetails?id=${course.code}" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>
                        <div class="ag-courses-item_title">
                            <c:out value="${course.name}" />
                        </div>
                        <div class="ag-courses-item_date-box">
                           Credits : <c:out value="${course.credits}" />
                        </div>
                        <div class="ag-courses-item_date-box">
                           Start Date : <c:out value="${course.startDate}" />
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <c:if test="${empty courselist}">
            <p>No courses available.</p>
        </c:if>
    </div>
  </main>
</body>
</html>
