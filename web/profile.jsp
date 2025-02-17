<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="model.User, model.Animal, dao.UserDAO, dao.AnimalDAO" %>
<%
    // Check if the user is logged in
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }

    String username = (String) sessionObj.getAttribute("username");

    // Handle profile update logic
    String name = request.getParameter("name");
    String email = request.getParameter("email");

  
    String updateMessage = "";
    if (name != null && email != null) {
        UserDAO userDAO = new UserDAO();
        boolean updateSuccess = userDAO.updateUserProfile(username, name, email);

        if (updateSuccess) {
            updateMessage = "<p id='updateMessage' class='update-message success'>Profile updated successfully!</p>";
        } else {
            updateMessage = "<p id='updateMessage' class='update-message error'>Failed to update profile.</p>";
        }
    }

    // Fetch user details and adopted animals
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByUsername(username);

    if (user == null) {
        out.println("User details not found.");
        return;
    }

    AnimalDAO animalDAO = new AnimalDAO();
    List<Animal> adoptedAnimals = animalDAO.getAdoptedAnimals(username);

    double monthlyDonations = userDAO.getMonthlyDonations(username);
    double yearlyDonations = userDAO.getYearlyDonations(username);
    double totalDonations = userDAO.getTotalDonations(username);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/profile-styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        .adopted-cards {
    display: flex;
    flex-wrap: wrap; /* Allow cards to wrap onto new lines */
    gap: 30px; /* Reduce space between cards */
    justify-content: space-evenly; /* Distribute cards evenly across the screen */
    padding: 20px; /* Add padding around the grid */
}

        /* Popup Style */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .popup-content {
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: 300px;
        }
        .popup input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .popup button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .popup button:hover {
            background: #45a049;
        }
        
        .update-message {
    font-size: 14px;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    text-align: center;
}

.update-message.success {
    background-color: #d4edda;
    color: #155724;
}

.update-message.error {
    background-color: #f8d7da;
    color: #721c24;
}

.no-adopted-message {
    text-align: center;  /* Centers the text */
    font-size: 18px;     /* Adjust the size to your preference, similar to an h7 font size */
    font-weight: bold;   /* Optional: make the text bold */
    color: #FFFFFF;         /* Optional: adjust text color */
    margin-top: 20px;    /* Optional: space from the previous content */
}

    </style>
</head>
<body>
    <div class="profile">
        <%@ include file="navbar-menu.jsp" %>
        <div class="user-container">
            <h3 class="title">User Details</h3>
            <div class="profile-container">
                
                <div class="profile-details">
                     <%= updateMessage %> <!-- Display the update message here -->
                    <p> <span>Username: </span> <%= user.getUsername() %> </p>
                    <p> <span>Name: </span> <%= user.getName() %> </p>
                    <p> <span>Email: </span> <%= user.getEmail() %> </p>
                     <p> <span>Total Donations: </span> $<%= String.format("%.2f", totalDonations) %></p> <!-- Total Donation -->
                    <p> <span>Donations (This Month): </span> $<%= String.format("%.2f", monthlyDonations) %></p>
                    <p> <span>Donations (This Year): </span> $<%= String.format("%.2f", yearlyDonations) %></p>
                    <p> <span>Visit Date: </span> <%= new java.text.SimpleDateFormat("MMMM dd, yyyy").format(new java.util.Date()) %> </p>
                    <div class="profile-actions">
                        <div class="edit-profile" id="editProfileButton">
                            <i class="fas fa-edit"></i> EDIT PROFILE
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h3 class="title">Adopted Animals</h3>
        <div class="adopted-container">
            <div class="adopted-cards">
                <% for (Animal animal : adoptedAnimals) { %>
                    <div class="card">
                        <h4><%= animal.getAnimalName() %></h4>
                        <img src="<%= request.getContextPath() %>/uploads/<%= animal.getAnimalImage() %>" alt="<%= animal.getAnimalName() %>" class="animal-image" />
                      
                        <p><strong>Common Name:</strong> <%= animal.getCommonName() %></p>
                        <p><strong>Scientific Name:</strong> <%= animal.getScientificName() %></p>
                        <p><strong>Gender:</strong> <%= animal.getAnimalGender() %></p>
                        <p><strong>Age:</strong> <%= animal.getAnimalAge() %> years</p>
                    </div>
                 <% } if (adoptedAnimals.isEmpty()) { %>
            <div class="no-adopted-message">
                No animals adopted yet.
            </div>
        <% } %>
            </div>
        </div>

        <div class="popup" id="popup">
            <div class="popup-content">
                <h3>Edit Profile</h3>
                <form method="POST" action="profile.jsp">
                    <input type="text" name="name" value="<%= user.getName() %>" required />
                    <input type="email" name="email" value="<%= user.getEmail() %>" required />
                    <button type="submit">Save Changes</button>
                    <button type="button" id="closePopup">Cancel</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("editProfileButton").onclick = function() {
            document.getElementById("popup").style.display = "flex";
        };
        document.getElementById("closePopup").onclick = function() {
            document.getElementById("popup").style.display = "none";
        };
        
        

    setTimeout(function() {
        var message = document.getElementById("updateMessage");
        if (message) {
            message.style.display = "none";
        }
    }, 2000); // 2000 milliseconds = 2 seconds


    </script>
    <script src="script.js"></script>
</body>
</html>
