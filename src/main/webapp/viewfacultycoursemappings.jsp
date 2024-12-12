<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Faculty Course Mapping</title>
<style>
body {
    background-color: white;
    font-family: Arial, sans-serif;
}

.success-message {
    display: none;
    margin: 20px auto;
    width: 80%;
    text-align: center;
    color: green;
    border: 1px solid green;
    border-radius: 5px;
    padding: 10px;
    background-color: #d4edda;
}

.search-form button {
    padding: 10px 15px;
    font-size: 14px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.search-form button:hover {
    background-color: #45a049;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.action-button {
    display: inline-block;
    padding: 8px 15px;
    font-size: 14px;
    color: white;
    background-color: red;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.action-button:hover {
    background-color: #c40000;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
</style>

<script>
function confirmDelete(id) {
    if (confirm("Are you sure you want to delete the Mapping: " + id + "?")) {
        // Make an AJAX call to delete the mapping
        fetch('deletefaccou?id=' + id, {
            method: 'GET'
        })
        .then(response => {
            if (response.ok) {
                // Display success message
                const messageBox = document.getElementById('success-message');
                messageBox.innerText = 'Mapping deleted successfully!';
                messageBox.style.display = 'block';

                // Remove the corresponding row from the table
                document.getElementById('row-' + id).remove();
            } else {
                alert('Failed to delete the mapping.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while deleting the mapping.');
        });

        return false; // Prevent default link action
    }
    return false; // Prevent default link action if cancelled
}
</script>

</head>
<body>
    <%@include file="adminnavbar.jsp"%>
    <main>
        <h3 style="text-align: center; color: white	">VIEW FACULTY COURSE MAPPINGS</h3>
        <div id="success-message" class="success-message"></div>
        <br>
        <table align="center" border="3" width="80%" cellpadding="5px">
            <tr bgcolor="lightblue">
                <th>ID</th>
                <th>FACULTY DETAILS</th>
                <th>COURSE DETAILS</th>
                <th>DATE REGISTERED</th>
                <th>ACTION</th>
            </tr>
            <c:forEach items="${fcmapping}" var="fcm">
                <tr id="row-${fcm.id}" bgcolor="white" align="center">
                    <td><c:out value="${fcm.id}" /></td>
                    
                    <td><c:out value="${fcm.faculty.id}" /> &nbsp;&nbsp; - &nbsp;&nbsp; <c:out value="${fcm.faculty.name}" /></td>
                    
                    <td><c:out value="${fcm.course.code}" /> &nbsp;&nbsp; - &nbsp;&nbsp;<c:out value="${fcm.course.name}" /></td>
                    
                    <td><c:out value="${fcm.assignedDate}" /></td>
                    
                    <td>
                        <a href="#" class="action-button" onclick="return confirmDelete('${fcm.id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </main>
</body>
</html>
