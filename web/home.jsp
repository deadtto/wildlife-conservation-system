<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession userSession = request.getSession(false);
    User user = (userSession != null) ? (User) userSession.getAttribute("user") : null;
    String username = (user != null) ? user.getUsername() : null;
    String role = (userSession != null) ? (String) userSession.getAttribute("role") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/home-styles.css">
</head>
<body>
   <div class="home">
       <%@ include file="navbar-menu.jsp" %> <!-- ✅ Include navbar dynamically -->
       
       <div class="content">
           <h1>WildHaven.</h1>
           <p class="par">At Wildhaven, we believe in the power of nature and the importance <br>
              of protecting the incredible wildlife that share our planet. Our mission is <br>
              simple yet powerful: to safeguard endangered species, restore vital <br>
              habitats, and inspire a deeper connection between people and the natural world.</p>
           <button class="explore"><a href="home.jsp">EXPLORE</a></button>
       </div>
   </div>
</body>
</html>
