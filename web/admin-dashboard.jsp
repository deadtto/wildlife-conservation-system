<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Check if the user is logged in as staff
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("role") == null || !"staff".equals(sessionObj.getAttribute("role"))) {
        response.sendRedirect("login-page.jsp");
        return;
    }

    String staffUsername = (String) sessionObj.getAttribute("username");

    // Initialize variables
    int totalDonation = 0;
    int visitorCount = 0;
    int animalCount = 0;

    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL driver is loaded
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcs_db", "root", "");

        // 1. Calculate total donation
        stmt = conn.prepareStatement("SELECT SUM(donation) AS totalDonation FROM visitors");
        rs = stmt.executeQuery();
        if (rs.next()) {
            totalDonation = rs.getInt("totalDonation");
        }
        rs.close();
        stmt.close();

        // 2. Get visitor count
        stmt = conn.prepareStatement("SELECT COUNT(DISTINCT username) AS visitor_count FROM visitors");
        rs = stmt.executeQuery();
        if (rs.next()) {
            visitorCount = rs.getInt("visitor_count");
        }
        rs.close();
        stmt.close();

        // 3. Get animal count
        stmt = conn.prepareStatement("SELECT COUNT(*) AS animal_count FROM animal");
        rs = stmt.executeQuery();
        if (rs.next()) {
            animalCount = rs.getInt("animal_count");
        }
        rs.close();
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="css/admin-dashboard-styles.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<title>AdminHub</title>
</head>
<body>

<jsp:include page="admin-sidebar.jsp" />

<!-- CONTENT -->
<section id="content">
	<nav>
		<i class='bx bx-menu'></i>
	</nav>

	<main>
		<div class="head-title">
			<div class="left">
				<h1>Dashboard</h1>
				<ul class="breadcrumb">
					<li><a href="#">Dashboard</a></li>
					<li><i class='bx bx-chevron-right'></i></li>
					<li><a class="active" href="#">Home</a></li>
				</ul>
			</div>
		</div>

		<ul class="box-info">
			<li>
				<i class='bx bxs-calendar-check'></i>
				<span class="text">
					<h3><%= animalCount %></h3>
					<p>Animals</p>
				</span>
			</li>
			<li>
				<i class='bx bxs-group'></i>
				<span class="text">
					<h3><%= visitorCount %></h3>
					<p>Visitors</p>
				</span>
			</li>
			<li>
				<i class='bx bxs-dollar-circle'></i>
				<span class="text">
					<h3>$<%= String.format("%.2f", (double) totalDonation) %></h3>
					<p>Total Donation</p>
				</span>
			</li>
		</ul>

		<div class="table-data">
			<div class="order">
				<div class="head">
					<h3>Recent Projects</h3>
					<i class='bx bx-search'></i>
					<i class='bx bx-filter'></i>
				</div>
				<table>
					<thead>
						<tr>
							<th>Project Name</th>
							<th>Start Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							try {
								stmt = conn.prepareStatement("SELECT projectName, startDate FROM project");
								rs = stmt.executeQuery();
								while (rs.next()) {
						%>
									<tr>
										<td><%= rs.getString("projectName") %></td>
										<td><%= rs.getString("startDate") %></td>
									</tr>
						<%
								}
								rs.close();
								stmt.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</tbody>
				</table>
			</div>

			<div class="order">
				<div class="head">
					<h3>Team</h3>
					<i class='bx bx-filter'></i>
				</div>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<%
							try {
								stmt = conn.prepareStatement("SELECT u.name, u.email FROM users u RIGHT JOIN staff s ON u.username = s.username");
								rs = stmt.executeQuery();
								while (rs.next()) {
						%>
									<tr>
										<td><%= rs.getString("name") %></td>
										<td><%= rs.getString("email") %></td>
									</tr>
						<%
								}
								rs.close();
								stmt.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</main>
</section>

<script>
    const menuBar = document.querySelector('#content nav .bx.bx-menu');
    const sidebar = document.getElementById('sidebar');
    menuBar.addEventListener('click', function () {
        sidebar.classList.toggle('hide');
    });

    const switchMode = document.getElementById('switch-mode');
    switchMode.addEventListener('change', function () {
        if (this.checked) {
            document.body.classList.add('dark');
        } else {
            document.body.classList.remove('dark');
        }
    });
</script>

</body>
</html>

<%
    // Close connection
    if (conn != null) conn.close();
%>
