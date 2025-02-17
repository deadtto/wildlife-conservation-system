<%-- 
    Document   : project
    Created on : Feb 14, 2025, 4:24:22 AM
    Author     : NUR ANESHA ARMAN
--%>

<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Project" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve session user details
    HttpSession userSession = request.getSession(false);
    String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;
    String name = (userSession != null) ? (String) userSession.getAttribute("name") : "";

    String loginLogoutLink = (username != null) 
        ? "<li><a href='logout.jsp'>Logout</a></li>" 
        : "<li><a href='login-page.jsp'>Login</a></li>";

    // ✅ Retrieve project list from request (set by ProjectServlet)
    List<Project> projects = (List<Project>) request.getAttribute("projects");

    // 🚀 Redirect to ProjectServlet if no data is available
    if (projects == null) {
        response.sendRedirect("projects"); // Call the servlet to get project data
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven - Projects</title>
    <link rel="stylesheet" href="css/project-styles.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
</head>

<body>
    <div class="project">
        <jsp:include page="navbar-menu.jsp" />

        <!-- Main Content Section -->
        <div class="project-container">
            <h2 class="title">Conservation Projects</h2>
    
            <div class="card-container">
                <% if (projects.isEmpty()) { %>
                     <p style="color: red;">⚠️ No projects available.</p>
                <% } else { %>
                    <% for (Project project : projects) { %>
                        <div class="card">
                            <p><strong>Project Name:</strong> <%= project.getProjectName() %></p>
                            <p><strong>Start Date:</strong> <%= project.getStartDate() %></p>
                            <p><strong>End Date:</strong> <%= project.getEndDate() %></p>
                            <p><strong>Location:</strong> <%= project.getLocationName() %></p>
                            <p><strong>Region:</strong> <%= project.getLocationRegion() %></p>
                            <p><strong>Location Type:</strong> <%= project.getLocationType() %></p>
                            <p><strong>Description:</strong> <%= project.getProjectDesc() %></p>
                        </div>
                    <% } %>
                <% } %>
            </div>
         </div>
    <script src="js/scripts.js"></script>
</body>
</html>
