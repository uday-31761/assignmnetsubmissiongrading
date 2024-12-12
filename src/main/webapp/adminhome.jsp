<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminnavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
    <style>
        /* Styling the dashboard container */
        .dashboard {
            text-align: center;
            margin: 50px auto;
            max-width: 1200px;
        }
        .dashboard h2 {
            font-size: 30px;
            margin-bottom: 30px;
            font-weight: bold;
        }
        
        /* Styling each card for counts */
        .dashboard .card {
            display: inline-block;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 200px;
            margin: 15px;
            padding: 30px 20px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .dashboard .card:hover {
            transform: translateY(-5px); /* Adds hover effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        /* Styling the labels and counts */
        .dashboard .card .count {
            font-size: 35px;
            font-weight: bold;
            color: #007BFF;
            margin-top: 10px;
        }

        .dashboard .card .label {
            font-size: 18px;
            color: #555;
            margin-top: 10px;
        }

        /* Optional: Adding a background color to cards */
        .dashboard .card.faculty {
            background-color: #f8f9fa;
        }

        .dashboard .card.student {
            background-color: #e9f7ef;
        }

        .dashboard .card.course {
            background-color: #f2e6ff;
        }

    </style>
</head>
<body>
    <div class="dashboard">
        <h2>Welcome to the Admin Home Page</h2>
        <div class="card faculty">
            <div class="count">${facultyCount}</div>
            <div class="label">Total Faculty</div>
        </div>
        <div class="card student">
            <div class="count">${studentCount}</div>
            <div class="label">Total Students</div>
        </div>
        <div class="card course">
            <div class="count">${courseCount}</div>
            <div class="label">Total Courses</div>
        </div>
    </div>
</body>
</html>
