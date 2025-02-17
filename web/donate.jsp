<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    String name = (String) session.getAttribute("name"); // Get the user's name from session
    String loginLogoutLink;
    String welcomeMessage = "";

    if (username != null) {
        loginLogoutLink = "<li><a href='logout.jsp'>Logout</a></li>";
    } else {
        loginLogoutLink = "<li><a href='login-page.jsp'>Login</a></li>";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/donation-styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="donate">
        <div class="navbar">
            <%@ include file="navbar-menu.jsp" %> <!-- Include navbar -->
        </div>
        <div class="donate-content">
            <h1>WildHaven.</h1>
            <p class="par">
                Partner with us to preserve the natural world we all depend on. Your donation directly supports vital conservation efforts, protects endangered species, and restores critical habitats.<br> 
                Together, we can create a thriving planet where wildlife and people coexist in harmony. <br>
                Every contribution matters—join the WildHaven mission today.
            </p>
            <button class="donate">
    <a href="<%= (username != null) ? "donatenow.jsp" : "login-page.jsp" %>">DONATE NOW</a>
</button>

        </div>
    </div>
</body>
</html>
