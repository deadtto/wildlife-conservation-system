<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Visitor, dao.VisitorDAO" %>

<%
    // Restrict access to staff
    String role = (String) session.getAttribute("role");
    if (role == null || !"staff".equals(role)) {
        response.sendRedirect("login-page.jsp");
        return;
    }

    // Fetch visitor donation records
    VisitorDAO visitorDAO = new VisitorDAO();
    List<Visitor> donations = visitorDAO.getAllDonations();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/admin-donation-styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Admin Donation</title>
</head>
<body>
    <%@ include file="admin-sidebar.jsp" %> <!-- Include Sidebar -->

    <section id="content">
        <nav>
            <i class='bx bx-menu'></i>
        </nav>

        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Donation</h1>
                </div>
            </div>

            <div class="form-container">
                <div class="display-section" id="display-section">
                    <h2>Visitor</h2>

                    <!-- Table to display users and donation information -->
                    <div class="table-data">
                        <div class="order">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Donation Amount</th>
                                        <th>Payment Method</th>
                                        <th>Visit Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (donations != null && !donations.isEmpty()) { 
                                        for (Visitor visitor : donations) { %>
                                            <tr>
                                                <td><%= visitor.getUsername() %></td>
                                                <td><%= visitor.getName() %></td>
                                                <td><%= visitor.getEmail() %></td>
                                                <td><%= visitor.getDonation() != null ? visitor.getDonation() : "No Donation" %></td>
                                                <td><%= visitor.getPayment_Method() != null ? visitor.getPayment_Method() : "N/A" %></td>
                                                <td><%= visitor.getVisitDate() != null ? visitor.getVisitDate() : "N/A" %></td>
                                            </tr>
                                    <% } 
                                    } else { %>
                                        <tr><td colspan="6">No records found</td></tr>
                                    <% } %>
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
                allSideMenu.forEach(i => {
                    i.parentElement.classList.remove('active');
                })
                li.classList.add('active');
            })
        });

        // TOGGLE SIDEBAR
        const menuBar = document.querySelector('#content nav .bx.bx-menu');
        const sidebar = document.getElementById('sidebar');

        menuBar.addEventListener('click', function () {
            sidebar.classList.toggle('hide');
        })
    </script>
</body>
</html>
