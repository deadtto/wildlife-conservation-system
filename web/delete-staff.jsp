<%@ page import="java.sql.Connection, dao.StaffDAO, database.DBConfig" %>
<%
    // Get username from request parameter
    String username = request.getParameter("username");

    if (username != null && !username.isEmpty()) {
        // Establish database connection
        Connection conn = DBConfig.getConnection();
        StaffDAO staffDAO = new StaffDAO(conn);

        // Delete staff by username
        boolean deleted = staffDAO.deleteStaff(username);

        if (deleted) {
            response.sendRedirect("admin-staff.jsp?message=Staff deleted successfully");
        } else {
            response.sendRedirect("admin-staff.jsp?error=Failed to delete staff");
        }
    } else {
        response.sendRedirect("admin-staff.jsp?error=Invalid staff username");
    }
%>
