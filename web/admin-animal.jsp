<%@ page import="java.util.List, java.util.ArrayList, model.Animal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    
     // Restrict access to staff
    String role = (String) session.getAttribute("role");
    if (role == null || !"staff".equals(role)) {
        response.sendRedirect("login-page.jsp");
        return;
    }
    
    List<Animal> animals = (List<Animal>) request.getAttribute("animals");
    Animal editAnimal = (Animal) request.getAttribute("editAnimal");

    // If accessed directly, redirect to servlet
    if (animals == null) {
         System.out.println("🚨 'animals' is NULL in JSP. Redirecting to AnimalServlet...");
        response.sendRedirect("AnimalServlet");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin-animal-styles.css">
   <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    
    <title>AdminHub</title>
</head>
<body>
    
    <%@include file = "admin-sidebar.jsp" %>

    <section id="content">
        <nav>
            <i class='bx bx-menu'></i>
        </nav>

        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Animal</h1>
                </div>
            </div>

            <div class="container">
          

                <!-- Animal List Container -->
                <div class="animal-list-container">
                    <div class="card-container">
                        <% if (!animals.isEmpty()) { %>
                            <% for (Animal a : animals) { %>
                                <div class='animal-card'>
                                    <img src='uploads/<%= a.getAnimalImage() %>' alt='Animal Image' width='100'>
                                    <div class='animal-info'>
                                        <h3><%= a.getAnimalName() %> (<%= a.getCommonName() %>)</h3>
                                        <p><strong>Scientific Name:</strong> <%= a.getScientificName() %></p>
                                        <p><strong>Conservation Status:</strong> <%= a.getConsStatus() %></p>
                                        <p><strong>Age:</strong> <%= a.getAnimalAge() %> years</p>
                                        <p><strong>Gender:</strong> <%= a.getAnimalGender().equals("M") ? "Male" : "Female" %></p>
                                        <p><strong>Health Status:</strong> <%= a.getHealthStatus() %></p>
                                        <p><strong>Adoption:</strong> <%= a.isAdoption() ? "Open" : "Closed" %></p>
                                    </div>
                                    <div class='card-actions'>
                                        <a href='AnimalServlet?id=<%= a.getAnimalID() %>' class='edit-btn'>Edit</a>
                                        <a href='AnimalServlet?delete_id=<%= a.getAnimalID() %>' class='delete-btn' onclick='return confirm("Are you sure?")'>Delete</a>
                                    </div>
                                </div>
                            <% } %>
                        <% } else { %>
                            <p class="no-data">No animals available</p>
                        <% } %>
                    </div>
                </div>

                <!-- Add/Edit Animal Form -->
                <div class="form-container">
                    <h2><%= (editAnimal != null) ? "Edit Animal" : "Add New Animal" %></h2>
                    
                    <form action="AnimalServlet" method="post" enctype="multipart/form-data">
        
                        <input type="hidden" name="animal_id" value="<%= (editAnimal != null) ? editAnimal.getAnimalID() : "" %>">

                        <label for="common_name">Common Name:</label>
                        <input type="text" id="common_name" name="common_name" value="<%= (editAnimal != null) ? editAnimal.getCommonName() : "" %>" required>
                        <label for="scientific_name">Scientific Name:</label>
                        <input type="text" id="scientific_name" name="scientific_name" value="<%= (editAnimal != null) ? editAnimal.getScientificName() : "" %>" required>

                        <label for="cons_status">Conservation Status:</label>
                        <input type="text" id="cons_status" name="cons_status" value="<%= (editAnimal != null) ? editAnimal.getConsStatus() : "" %>" required>

                        <label for="animal_name">Animal Name:</label>
                        <input type="text" id="animal_name" name="animal_name" value="<%= (editAnimal != null) ? editAnimal.getAnimalName() : "" %>" required>

                        <label for="animal_age">Animal Age:</label>
                        <input type="number" id="animal_age" name="animal_age" value="<%= (editAnimal != null) ? editAnimal.getAnimalAge() : "" %>" required>

                        <label for="animal_gender">Animal Gender:</label>
                        <select id="animal_gender" name="animal_gender" required>
                            <option value="M" <%= (editAnimal != null && "M".equals(editAnimal.getAnimalGender())) ? "selected" : "" %>>Male</option>
                            <option value="F" <%= (editAnimal != null && "F".equals(editAnimal.getAnimalGender())) ? "selected" : "" %>>Female</option>
                        </select>

                        <label for="health_status">Health Status:</label>
                        <input type="text" id="health_status" name="health_status" value="<%= (editAnimal != null) ? editAnimal.getHealthStatus() : "" %>" required>

                        <label for="animal_image">Animal Image:</label>
                        <%
                        if (editAnimal != null && editAnimal.getAnimalImage() != null && !editAnimal.getAnimalImage().isEmpty()) { 
                        %>
                        <!-- Display the existing animal image -->
                        <img src="<%= request.getContextPath() %>/uploads/<%= editAnimal.getAnimalImage() %>" 
                        alt="Animal Image" width="100">
                        <% } %>

                        <!-- File input for new image upload -->
                       <input type="file" id="animal_image" name="img" accept="image/*">


                        
                        
                        <label for="adoption">Open for Adoption?</label>
                        <input type="checkbox" id="adoption" name="adoption" <%= (editAnimal != null && editAnimal.isAdoption()) ? "checked" : "" %>>

                        <button type="submit"><%= (editAnimal != null) ? "Update Animal" : "Add Animal" %></button>
                    </form>
                </div>
            </div>
        </main>
    </section>
</body>
</html>