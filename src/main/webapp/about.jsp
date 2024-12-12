<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us - Online Assignment Submission and Grading
	System</title>
<style>
/* Container for the About section */
.about-content {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-top: 30px; /* Add some space between navbar and content */
}

/* Contact Information Section */
.contact-info {
	margin-top: 20px;
}

.contact-info p {
	font-size: 1.1em;
	line-height: 1.8;
}

/* Style for clickable email and mobile number */
.contact-info a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.contact-info a:hover {
	text-decoration: underline;
}

/* Footer style (fixed at the bottom) */
footer {
	background-color: #333;
	color: white;
	text-align: center;
	padding: 10px 0;
	position: fixed;
	width: 100%;
	bottom: 0;
	font-size: 0.9em;
}
</style>
</head>
<body>
	<%@ include file="mainnavbar.jsp"%>


	<section class="about-content">
		<h2>About Us</h2>
		<p>Welcome to the Online Assignment Submission and Grading System.
			This platform is designed to provide students and instructors with an
			efficient way to submit assignments, grade them, and provide
			feedback. Our goal is to make academic tasks more streamlined and
			effective, enabling seamless communication between students and
			educators.</p>

		<div class="contact-info">
			<h3>Contact Us</h3>

			<p>If you have any questions, need support, or would like to
				register, feel free to reach out to us:</p>
			<p>
				Email: <a href="mailto:assignmentsubmission@gmail.com">assignmentsubmission@gmail.com</a>
			</p>
			<p>Mobile: +91 9542868747</p>
			<p>To register for the platform, simply send us an email with
				your details, and we'll assist you with the process.</p>
		</div>

	</section>
	</div>

	<footer> &copy; 2024 Online Assignment Submission and Grading
		System. All Rights Reserved. </footer>
</body>
</html>
