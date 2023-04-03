<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

</head>
<body>
    
    <%
    String regno = request.getParameter("regno");
    String password = request.getParameter("password");
    
    if (regno != null && password != null){
    	String jdbcUrl = "jdbc:mysql://localhost:3306/registration";
        String dbUsername = "root";
        String dbPassword = "Magangi203*#";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            
            String sql = " SELECT * FROM users WHERE Regno=? AND Password=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, regno);
            statement.setString(2, password);
            result = statement.executeQuery();
            
            if (result.next()) {
                // User is verified, redirect to success page
                out.println("login successful");
                response.sendRedirect("display.jsp");
            } else {
                // User is not verified, redirect to error page
                out.print("<p>Login failed. Please check your username and password.</p>");
            }
            
        }catch (ClassNotFoundException | SQLException e) {
            // If an error occurs, display error message
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close database resources
            if (result != null) result.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

    }
    
    %>
</body>
</html>