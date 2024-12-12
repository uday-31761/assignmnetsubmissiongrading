<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Navbar</title>
    <link rel="stylesheet" href="style1.css">
    <!-- Include Bootstrap CSS for quick styling (for responsive navbar) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="body">

    <div class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid"> <!-- Keep this or replace with 'container' if needed -->
        <!-- Logo aligned to the left -->
        <a class="navbar-brand" href="/">
            <img src="images/logo2.jpg" alt="Logo" style="height: 50px; width: auto;">
            <b>GradeRush</b>
        </a>
        <!-- Navbar toggler for small screens -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar items aligned to the right -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Main Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup">Signup</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about">About us</a>
                </li>
            </ul>
        </div>
    </div>
</div>



</body>
</html>
