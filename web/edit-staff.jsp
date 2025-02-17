<%@ page import="java.sql.*, model.Staff, dao.StaffDAO, database.DBConfig" %>

<%
    Connection conn = DBConfig.getConnection(); // ? Get connection from DBConfig
    StaffDAO staffDAO = new StaffDAO(conn); // ? Pass it to StaffDAO
    String username = request.getParameter("username");
    Staff staff = staffDAO.getStaffByUsername(username);
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/admin-team-styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>AdminHub</title>
    
    <style>
        /* Custom CSS for Add Staff Form */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="email"]{
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-container input[type="submit"]:active {
            background-color: #3e8e41;
        }

        .form-container .error {
            color: red;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <h2>Edit Staff</h2>
    <form action="StaffServlet" method="POST">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="username" value="<%= staff.getUsername() %>">

        <label>Full Name:</label>
        <input type="text" name="name" value="<%= staff.getName() %>" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= staff.getEmail() %>" required><br>

        <label>Password:</label>
        <input type="password" name="password" placeholder="Leave empty to keep current password"><br>

        <label>Manager ID:</label>
        <input type="text" name="managerID" value="<%= staff.getManagerID() %>"><br>

        <label>Department:</label>
        <input type="text" name="department" value="<%= staff.getDepartment() %>" required><br>

        <label>Position:</label>
        <input type="text" name="position" value="<%= staff.getPosition() %>" required><br>

        <input type="submit" value="Update Staff">
    </form>
        </div>
</body>
</html>
