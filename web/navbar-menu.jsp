<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/navbar-menu-styles.css">
</head>
<body>
<div class="navbar">
    <div class="icon">
        <h2 class="logo">WildHaven</h2>
    </div>

    <div class="menu">
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li class="dropdown">
                <a>Activities&#9662;</a>
                <ul class="dropdown-menu">
                    <li><a href="adopt.jsp">Adoption Program</a></li>
                    <li><a href="project.jsp">Conservation Project</a></li>
                </ul>
            </li>
            <li><a href="donate.jsp">Donate</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <!-- ✅ No Variable Declaration - Access Session Directly -->
            <%= (session.getAttribute("user") != null) 
                ? "<li><a href='LogoutServlet'>Logout</a></li>" 
                : "<li><a href='login-page.jsp'>Login</a></li>" %>
        </ul>
    </div>
</div>
</body>
</html>
