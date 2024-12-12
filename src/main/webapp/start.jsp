<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<title>Assignment Submission System</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
body {
	background-color: #f4f5f7;
}

.navbar {
	background-color: #0b131b; /* Change navbar color */
}

.navbar-brand img {
	height: 50px;
}

.navbar-dark .navbar-nav .nav-link {
	color: white; /* Change navbar link color to white */
}

.navbar-dark .navbar-nav .nav-link:hover {
	color: #d0d0d0; /* Change hover color for links */
}

.carousel {
	height: 500px;
	overflow: hidden;
}

.carousel-inner img {
	height: 100%;
	width: 100%;
	object-fit: cover;
}

.feature-section {
	padding: 60px 0;
}

.feature-section img {
	max-height: 200px;
	width: auto;
	object-fit: cover;
	margin-bottom: 15px;
}

.call-to-action {
	background-color: #007bff;
	color: white;
	padding: 50px 0;
	text-align: center;
}

.call-to-action h2 {
	margin-bottom: 20px;
	font-size: 36px;
	font-weight: 700;
}

.call-to-action p {
	margin-bottom: 30px;
	font-size: 18px;
}

footer {
	background-color: #343a40;
	color: rgba(255, 255, 255, 0.7);
	padding: 10px 0;
	text-align: center;
	font-size: 16px;
}

.feature-img {
	height: 200px;
	object-fit: cover;
	width: 100%;
}
/* Feature Section - Hover Effect */
.card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	/* Smooth transition for transform and box-shadow */
}

.card:hover {
	transform: translateY(-10px); /* Slightly raise the card */
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	/* Add shadow for raised effect */
}
</style>
</head>
<body>
	<h2 style="color: darkblue">Assignment Submission & Grading System</h2>
	<%@include file="mainnavbar.jsp"%>


	<!-- Carousel Section -->
<div id="featureCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000" style="margin-top: 20px;">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <a href="login">
                <img src="images/im1.jpg" class="d-block w-100" alt="Easy Submission">
            </a>
        </div>
        <div class="carousel-item">
            <a href="login">
                <img src="images/im6.jpg" class="d-block w-100" alt="Instant Feedback">
            </a>
        </div>
        <div class="carousel-item">
            <a href="login">
                <img src="images/im3.jpg" class="d-block w-100" alt="Organized Grading">
            </a>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#featureCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#featureCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>




	<!-- Feature Section -->
	<div class="container feature-section">
		<div class="row text-center">
			<!-- Feature 1 -->
			<div class="col-md-4">
				<div class="card shadow-sm mb-4">
					<img src="images/p1.jpg" alt="Feature 1"
						class="card-img-top img-fluid feature-img">
					<div class="card-body">
						<h4 class="card-title">Simple User Interface</h4>
						<p class="card-text">A user-friendly interface for both
							teachers and students.</p>
					</div>
				</div>
			</div>

			<!-- Feature 2 -->
			<div class="col-md-4">
				<div class="card shadow-sm mb-4">
					<img src="images/p2.png" alt="Feature 2"
						class="card-img-top img-fluid feature-img">
					<div class="card-body">
						<h4 class="card-title">Secure Data</h4>
						<p class="card-text">Keep your assignments and grades safe
							with top-notch security.</p>
					</div>
				</div>
			</div>

			<!-- Feature 3 -->
			<div class="col-md-4">
				<div class="card shadow-sm mb-4">
					<img src="images/p3.jpeg" alt="Feature 3"
						class="card-img-top img-fluid feature-img">
					<div class="card-body">
						<h4 class="card-title">Timely Notifications</h4>
						<p class="card-text">Get notified of assignment deadlines and
							grade updates instantly.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Call to Action -->
	<div class="call-to-action">
		<div class="container">
			
			<p>Join us today and streamline your assignment submissions and
				grading process.</p>
			<a href="login" class="btn btn-light btn-lg">Get Started</a>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 Online Assignment Submission and Grading System.
			All Rights Reserved.</p>
	</footer>

</body>
</html>
