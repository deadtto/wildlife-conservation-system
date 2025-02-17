<%@ page import="java.sql.*, java.time.LocalDate" %>
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
    <link rel="stylesheet" href="css/donatenow-styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="donate">
        <div class="navbar">
            <%@ include file="navbar-menu.jsp" %> <!-- Include the navbar -->
        </div>

        <!-- Donation Form -->
        <div class="donation-form">
            <h2>Make a Donation</h2>

            <% if (request.getParameter("success") != null) { %>
                <p style="color: green;">Donation successful! Thank you for your contribution.</p>
            <% } %>

            <form action="DonationServlet" method="POST">
                <label for="donation">Donation Amount (RM)</label>
                <input type="number" id="donation" name="donation" required placeholder="Enter amount" min="1">

                <label for="payment-method">Payment Method</label>
                <select id="payment-method" name="payment-method" required>
                    <option value="credit-card">Credit Card</option>
                    <option value="tng">TNG</option>
                    <option value="bank-transfer">Bank Transfer</option>
                </select>

                <button type="submit" class="donate-submit">Donate Now</button>
            </form>
        </div>
    </div>
</body>
</html>
