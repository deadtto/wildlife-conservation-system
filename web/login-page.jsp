<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WildHaven</title>
    <link rel="stylesheet" href="css/login-page-styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    <style>
       @import url('https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap');
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Rubik', sans-serif;
}

body {
    background: linear-gradient(to top, rgba(0,0,0,0.5) 50%, rgba(0,0,0,0.5) 50%), url('img/tiger.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
    position: relative;
}

.title {
    padding-left: 20px;
    padding-bottom: 25px;
    font-family: 'Raleway';
    color: white;
    font-size: 60px;
    letter-spacing: 1.2px;
    line-height: 55px;
    font-weight: bold;
    z-index: 1;
}

.container .btn {
    width: 140px;
    height: 40px;
    font-weight: bold;
    background: rgb(246, 238, 197);
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: .3s ease;
    z-index: 1;
}

.container .btn:hover {
    background: rgb(112, 78, 37);
}

.hidden {
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.5s ease;
}

#title:not(.hidden), #login_btn:not(.hidden) {
    opacity: 1;
    pointer-events: auto;
    transition: opacity 0.5s ease;
}

.form-box {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 512px;
    height: 420px;
    overflow: hidden;
    z-index: 2;
    opacity: 0;
    transition: opacity 0.5s ease;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.form-box.active {
    opacity: 1;
}

.staff-container {
    position: absolute;
   left: 4px;
    width: 500px;
    display: flex;
    flex-direction: column;
    transition: .5s ease-in-out;
}

.staff-container a {
    color: rgb(225, 208, 82);
}


.ontop {
    color:white;
    text-align: center;
}

.register{
    color:white;
    text-align: center;
}

.top header {
    color: white;
    font-size: 30px;
    text-align: center;
    padding: 10px 0 30px 0;
}

.two-forms {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.input-box {
    position: relative;
}

.input-field {
    font-size: 15px;
    background: rgba(0, 0, 0, 0.219);
    color: white;
    height: 50px;
    width: 100%;
    padding: 0 10px 0 45px;
    border: none;
    border-radius: 30px;
    outline: none;
    transition: .2s ease;
}

.input-box i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: white;
}


.submit, .button {
    width: 140px;
    height: 40px;
    font-weight: bold;
    background: rgb(246, 238, 197);
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: .3s ease;
    color: black;
    margin-top: 10px;
    margin-right: 30px;
    margin-left: 30px;
}

.submit:hover, #returnButton:hover {
    background: rgb(112, 78, 37);
    color: white;
}
.input-box.flex {
    gap: 10px;
}

.register a{
    color: rgb(225, 208, 82);
}


    </style>
</head>
<body>
    <div class="container">
        <div id="title-section">
            <div class="title">WildHaven<br>Wildlife Conservation System</div>
            <button class="btn" id="login_btn">LOG IN</button>
        </div>

        <div id="login-section" class="hidden">
            <div class="form-box active">  
                <div class="top">
                    <header>Log In</header>
                </div>
                <div class="two-forms">
                    <form method="POST" action="LoginServlet">
                        <div class="input-box">
                            <input type="text" name="username" class="input-field" placeholder="Username" required>
                            <i class="bx bx-user"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" name="password" class="input-field" placeholder="Password" required>
                            <i class="bx bx-lock-alt"></i>
                        </div>
                        <div class="input-box flex justify-between items-center gap-4">
                            <input type="submit" class="submit" value="Login">
                            <button type="button" class="button" id="returnButton">Return</button>
                        </div>
                    </form>
                    <div class="register">Don't have an account? Click <a href="register-page.jsp">here</a> to register.</div>
                </div>
            </div>
        </div>
    </div>

    <%-- Display error message if login fails --%>
    <% if (error != null) { %>
        <script>
            alert("Login failed: Invalid username or password.");
        </script>
    <% } %>

     
    <script>document.getElementById('login_btn').addEventListener('click', function () {
    document.getElementById('title-section').classList.add('hidden');
    document.getElementById('login-section').classList.remove('hidden');
});

// Return Button Functionality
document.getElementById('returnButton').addEventListener('click', function () {
    document.getElementById('login-section').classList.add('hidden');
    document.getElementById('title-section').classList.remove('hidden');
});
</script>
</body>
</html>
