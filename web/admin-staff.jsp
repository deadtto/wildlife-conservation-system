<%@ page import="java.sql.*, java.util.List, model.Staff, dao.StaffDAO" %>


<%
    StaffDAO staffDAO = new StaffDAO((Connection) application.getAttribute("DBConnection"));
    List<Staff> staffList = staffDAO.getAllStaff();
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
                    <h1>Team</h1>
                </div>
                <div class="right">
                    <a href="add-staff.jsp" class="btn-add-staff">ADD STAFF</a>
                </div>
            </div>

            <div class="form-container">
                <div class="display-section" id="display-section">
                    <h2>Staff</h2>

                    <div class="table-data">
                        <div class="order">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Department</th>
                                        <th>Manager ID</th>
                                        
                                        <th>Position</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    if (staffList != null && !staffList.isEmpty()) {
                                        for (Staff staff : staffList) {
                                    %>
                                    <tr>
                                        <td><%= staff.getUsername() %></td>
                                        <td><%= staff.getName() %></td>
                                        <td><%= staff.getEmail() %></td>
                                        <td><%= staff.getManagerID() %></td>
                                        <td><%= staff.getDepartment() %></td>
                                        <td><%= staff.getPosition() %></td>
                                        <td>
                                            <a href="edit-staff.jsp?username=<%= staff.getUsername() %>" class='bx bx-edit'></a>
                                            <a href="delete-staff.jsp?username=<%= staff.getUsername() %>" class='bx bx-trash' onclick="return confirm('Are you sure you want to delete?')"></a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr><td colspan="7">No records found</td></tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </section>

    <script>
        const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

        allSideMenu.forEach(item => {
            const li = item.parentElement;
            item.addEventListener('click', function () {
                allSideMenu.forEach(i => i.parentElement.classList.remove('active'));
                li.classList.add('active');
            });
        });

        const menuBar = document.querySelector('#content nav .bx.bx-menu');
        const sidebar = document.getElementById('sidebar');
        menuBar.addEventListener('click', function () {
            sidebar.classList.toggle('hide');
        });
    </script>
</body>

</html>
