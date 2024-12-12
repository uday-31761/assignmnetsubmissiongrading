<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Profile</title>
<style>
    body {
        font-family: 'Roboto', Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    main {
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
        font-size: 28px;
        margin-bottom: 20px;
    }

    .profile-card {
        max-width: 500px;
        margin: 20px auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        overflow: hidden;
        padding: 20px;
    }

    .profile-header {
        text-align: center;
        position: relative;
        padding: 20px;
        background: linear-gradient(45deg, #007bff, #0056b3);
        color: white;
        border-bottom: 5px solid #007bff;
    }

    .profile-header .profile-icon {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 5px solid #fff;
        margin: 0 auto;
        background-image: url('https://via.placeholder.com/100'); /* Placeholder image */
        background-size: cover;
        background-position: center;
    }

    .profile-header h2 {
        margin-top: 10px;
        font-size: 20px;
        font-weight: bold;
    }

    .profile-header p {
        font-size: 14px;
        margin: 5px 0;
    }

    .profile-body {
        padding: 15px;
    }

    .detail {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #eaeaea;
    }

    .detail:last-child {
        border-bottom: none;
    }

    .label {
        font-weight: bold;
        color: #555;
    }

    .value {
        color: #333;
        font-weight: 500;
        text-align: right;
    }
</style>
</head>
<body>
<%@ include file="studentnavbar.jsp" %>
<main>
    <h1 style="color: white ">Student Profile</h1>
    <div class="profile-card">
        <!-- Profile Header with Image -->
        <div class="profile-header">
            <h2><%= st.getName().toUpperCase() %></h2>
            <p><%= st.getDepartment() %> Department</p>
        </div>
        <!-- Profile Details -->
        <div class="profile-body">
            <div class="detail"><span class="label">ID:</span> <span class="value"><%= st.getId() %></span></div>
            <div class="detail"><span class="label">Name:</span> <span class="value"><%= st.getName() %></span></div>
            <div class="detail"><span class="label">Gender:</span> <span class="value"><%= st.getGender() %></span></div>
            <div class="detail"><span class="label">Age:</span> <span class="value"><%= st.getAge() %></span></div>
            <div class="detail"><span class="label">Email ID:</span> <span class="value"><%= st.getEmail() %></span></div>
            <div class="detail"><span class="label">Contact:</span> <span class="value"><%= st.getContact() %></span></div>
        </div>
    </div>
</main>
</body>
</html>
