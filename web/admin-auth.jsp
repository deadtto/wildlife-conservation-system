<%
    HttpSession adminSession = request.getSession(false);
    String loggedInStaff = (adminSession != null) ? (String) adminSession.getAttribute("staffUsername") : null;

    if (loggedInStaff == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }
%>
