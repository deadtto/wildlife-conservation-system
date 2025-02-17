<%@ page import="java.util.List, model.Animal, dao.AdoptionDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HttpSession sessionScope = request.getSession();
    String username = (String) sessionScope.getAttribute("username");
    String message = (String) sessionScope.getAttribute("message");
    String messageType = (String) sessionScope.getAttribute("messageType"); // Message type (success or error)
    sessionScope.removeAttribute("message");
    sessionScope.removeAttribute("messageType");

    AdoptionDAO adoptionDAO = new AdoptionDAO();
    List<Animal> adoptableAnimals = adoptionDAO.getAllAdoptableAnimals();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/adopt-styles.css">
    <script src="js/scripts.js" defer></script>

    <style>
        .adpt-container .adopt-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Always 3 items per row */
    gap: 2rem;
}

.adopt{
	width:100%;
	background: linear-gradient(to top, rgba(0,0,0,0.5)50%, rgba(0,0,0,0.5)50%),url(img/slide2.jpg);
	background-size: cover;
	height: 100%;
        background-position: center center; /* Ensure the background is centered */
    background-attachment: scroll; /* Makes the background scroll with the content */
    height: auto; /* Adjust the height to be dynamic and based on the content */
    min-height: 100vh; /* Ensure it takes up at least the full viewport height */
}

.adpt-container .adopt-container .adoption img{
	height: 10rem;
 }
 
        .adopting {
            background-color: #EAEAEA;
            color: black;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            text-align: center;
            font-weight: bold;
            width: auto;
        }

        .adopting:hover {
            background-color: #45a049;
            color: white;
            transform: scale(1.1);
        }

        .adopt-preview .preview img{
	height: 10rem;
 }
        .adopting:active {
            background-color: #388e3c;
        }

        .message {
            padding: 15px 30px;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin: 20px auto;
            max-width: 80%;
            box-sizing: border-box;
        }

        /* Success message style */
        .message.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        /* Error message style */
        .message.error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
         .adopt-preview .preview{
	display: none;
	padding:2rem;
	text-align: center;
	background: #fff;
	position: relative;
	margin:2rem;
	width: 50%;
	max-width: 40rem; /* Constrain maximum width */
    max-height: 80vh;
	overflow-y:auto;
	box-sizing: border-box;
 }
    </style>
</head>
<body>

<body>
    

<% if (message != null) { %>
    <p class="message"><%= message %></p>
<% } %>

<div class="adopt">
    
     <%@include file = "/navbar-menu.jsp" %>
     
    <div class="adpt-container">
        <h3 class="title">Adoption Program</h3>

        <% if (adoptableAnimals.isEmpty()) { %>
            <p style="color: red; text-align: center;">No animals available for adoption at the moment.</p>
        <% } else { %>
            <div class="adopt-container">
                <% for (Animal animal : adoptableAnimals) { %>
                    <div class="adoption" data-name="a-<%= animal.getAnimalID() %>">
                        <img src="<%= request.getContextPath() %>/uploads/<%= animal.getAnimalImage() %>" 
                        alt="<%= animal.getCommonName() %>" width="150">

                        <h3><%= animal.getCommonName() %></h3>
                        <div class="name"><%= animal.getAnimalName() %></div>
                    </div>
                <% } %>
            </div>

            <div class="adopt-preview">
                <% for (Animal animal : adoptableAnimals) { %>
                    <div class="preview" data-target="a-<%= animal.getAnimalID() %>">
                        <i class="fas fa-times"></i>
                        <img src="<%= request.getContextPath() %>/uploads/<%= animal.getAnimalImage() %>" 
                        alt="<%= animal.getCommonName() %>" width="150">

                        <h3><%= animal.getCommonName() %></h3>
                        <div class="name"><%= animal.getAnimalName() %></div>
                        <p>A cute, loving <%= animal.getCommonName() %></p>
                        <div class="details">
                            <p><strong>Scientific Name:</strong> <%= animal.getScientificName() %></p>
                            <p><strong>Gender:</strong> <%= animal.getAnimalGender() %></p>
                            <p><strong>Age:</strong> <%= animal.getAnimalAge() %> years</p>
                        </div>

                        <div class="buttons">
                            <form action="AdoptionServlet" method="POST">
                                <input type="hidden" name="animalID" value="<%= animal.getAnimalID() %>">
                                <button type="submit" class="adopting">Adopt Now</button>
                            </form>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>
</div>

<script>
let previewContainer = document.querySelector('.adopt-preview'); 
let previewBox = previewContainer.querySelectorAll('.preview'); 

document.querySelectorAll('.adopt-container .adoption').forEach(adoption => { 
    adoption.onclick = () => { 
        previewContainer.style.display = 'flex'; 
        let name = adoption.getAttribute('data-name'); 
        previewBox.forEach(preview => { 
            let target = preview.getAttribute('data-target'); 
            if(name === target){ 
                preview.classList.add('active'); 
            } 
        }); 
    }; 
});

previewBox.forEach(close => { 
    close.querySelector('.fa-times').onclick = () => { 
        close.classList.remove('active'); 
        previewContainer.style.display = 'none'; 
    }; 
});
</script>

</body>
</html>