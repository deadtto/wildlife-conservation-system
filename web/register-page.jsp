<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/register-page-styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="register" id="register-section">
        <div class="top">
            <header>Visitor Register</header>
        </div>
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
        <%
            }
        %>
        <div class="two-forms">
            <form method="POST" action="register">
                <div class="input-box">
                    <input type="text" name="username" class="input-field" placeholder="Username" required>
                    <i class="bx bx-user"></i>
                </div>
                <div class="input-box">
                    <input type="text" name="name" class="input-field" placeholder="Full Name" required>
                    <i class="bx bx-id-card"></i>
                </div>
                <div class="input-box">
                    <input type="email" name="email" class="input-field" placeholder="Email Address" required>
                    <i class="bx bx-envelope"></i>
                </div>
                <div class="input-box">
                    <input type="password" name="password" class="input-field" placeholder="Password" required>
                    <i class="bx bx-lock-alt"></i>
                </div>
                <div class="input-box">
                    <input type="text" name="icNumber" class="input-field" placeholder="IC Number (optional)">
                    <i class="bx bx-id-card"></i>
                </div>
                <div class="input-box">
                    <input type="submit" class="submit" value="Register">
                </div>
            </form>
            <div class="register">Have an account? Click <a href="login-page.jsp">here</a> to login.</div>
        </div>
    </div>
    <script src="js/scripts.js"></script>
</body>
</html>
