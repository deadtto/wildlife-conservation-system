<%@page import="database.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="model.Project"%>
<%@page import="dao.ProjectDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Connection conn = null;
    try {
        conn = DBConfig.getConnection();
        ProjectDAO projectDAO = new ProjectDAO();
        List<Project> projects = projectDAO.getAllProjects();
        request.setAttribute("projects", projects);
        Project editProject = (Project) request.getAttribute("editProject");
        request.setAttribute("editProject", editProject);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (conn != null) {
            conn.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Projects</title>
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/admin-dashboard-styles.css">
    <style>
    #form-container {
    display: flex;
    justify-content: space-between;
    align-items: stretch; /* Ensures both sections have equal height */
    gap: 20px;
    padding: 20px;
    min-height: 80vh; /* Ensures proper alignment even when content grows */
}

/* Left Side: Project List */
.display-section {
    flex: 2; /* Takes more space */
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow-y: auto; /* Enables scrolling if projects exceed space */
    max-height: 80vh; /* Prevents overflow issues */
}

/* Right Side: Project Form */
.form-section {
    flex: 1;
    background: #fff;
    padding: 30px; /* Increased padding for better spacing */
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    justify-content: center;
    min-height: 80vh;
}

/* Title Styling */
.form-section h2 {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px; /* Adds space below the title */
}

/* Input & Textarea Styling */
.form-group input,
.form-group textarea {
    padding: 4px;
    font-size: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%;
}

.form-group button {
    background: #007bff;
    color: white;
    padding: 10px 15px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    transition: background 0.3s ease;
}

    .project-card {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #fff;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .project-card img {
        width: 100px;
        height: auto;
        border-radius: 5px;
    }

    .project-info {
        flex: 1;
        margin-left: 15px;
    }

    .card-actions {
        display: flex;
        gap: 10px;
    }

    .edit-btn, .delete-btn {
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 5px;
        font-weight: bold;
    }

    .edit-btn {
        background-color: #28a745;
        color: white;
    }

    .delete-btn {
        background-color: #dc3545;
        color: white;
    }

    .edit-btn:hover {
        background-color: #218838;
    }

    .delete-btn:hover {
        background-color: #c82333;
    }
    
    .bx-edit { color: green; font-size: 20px; }
    .bx-trash { color: red; font-size: 20px; }
</style>
<body>
    <%@include file="admin-sidebar.jsp" %>
    
<section id="content">
    <nav>
        <i class='bx bx-menu' id="menu-toggle"></i>
    </nav>
    
    <main>
        <div class="head-title">
            <h1>Project Management</h1>
        </div>
<div id="form-container">
    <!-- Left Side: Project List -->
    <div class="display-section">
        <h2>Project Details</h2>
        <c:choose>
            <c:when test="${not empty projects}">
                <c:forEach var="project" items="${projects}">
                    <div class='project-card'>
                        <div class='project-info'>
                            <h3>${project.projectName}</h3>
                            <p><strong>Start Date:</strong> ${project.startDate}</p>
                            <p><strong>End Date:</strong> ${project.endDate}</p>
                            <p><strong>Location:</strong> ${project.locationName}, ${project.locationRegion}</p>
                            <p><strong>Location Type:</strong> ${project.locationType}</p>
                            <p><strong>Project Description:</strong> ${project.projectDesc}</p>
                        </div>
                       <div class="action-icons">
                            <a href="AdminProjectServlet?id=${project.projectID}">
                                <i class='bx bx-edit'></i>
                            </a>
                            <a href="AdminProjectServlet?delete_id=${project.projectID}" onclick="return confirm('Are you sure you want to delete this project?');">
                                <i class='bx bx-trash'></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-data">No projects available</p>
            </c:otherwise>
        </c:choose>
    </div>

   <!-- Right side: Project Form -->
                <div class="form-section">
                    <h2><c:if test="${editProject != null}">Edit Project</c:if><c:if test="${editProject == null}">Add New Project</c:if></h2>
                    
                   <form action="AdminProjectServlet" method="post">
                        <input type="hidden" name="action" value="update"> 
                        <input type="hidden" name="project_id" value="${editProject.projectID}">
                    
                    <div class="form-group">
                        <label for="project_name">Project Name:</label>
                        <input type="text" id="project_name" name="project_name" value="${editProject.projectName}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="start_date">Start Date:</label>
                        <input type="date" id="start_date" name="start_date" value="${editProject.startDate}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="end_date">End Date:</label>
                        <input type="date" id="end_date" name="end_date" value="${editProject.endDate}">
                    </div>
                    
                    <div class="form-group">
                        <label for="location_name">Location Name:</label>
                        <input type="text" id="location_name" name="location_name" value="${editProject.locationName}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="location_type">Location Type:</label>
                        <input type="text" id="location_type" name="location_type" value="${editProject.locationType}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="location_region">Location Region:</label>
                        <input type="text" id="location_region" name="location_region" value="${editProject.locationRegion}" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Project Description:</label>
                        <textarea name="project_desc" required>${editProject.projectDesc}</textarea>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit"> <c:if test="${editProject != null}">Update Project</c:if><c:if test="${editProject == null}">Submit</c:if></button>
                    </div>
                    </form>
                </div>
            </div>
        </main>
    </section>
</body>
</html> 