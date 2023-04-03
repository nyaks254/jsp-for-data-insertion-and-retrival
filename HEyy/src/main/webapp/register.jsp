<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>

</head>
<body>

   
    
    <% 
    String regno = request.getParameter("regno");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    String role = request.getParameter("role");

    if (regno != null && fullname != null && email != null && password != null && phone != null && gender != null && role != null) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/registration";
        String dbUsername = "root";
        String dbPassword = "Magangi203*#";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            String sql = "INSERT INTO users (Regno, Full_name, Email, Password, Phone_number, Gender, Role) VALUES (?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, regno);
            statement.setString(2, fullname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, phone);
            statement.setString(6, gender);
            statement.setString(7, role);
            statement.executeUpdate();

            out.println("<p>Registration successful</p>");
            // redirect to success page
            response.sendRedirect("index.html");
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
            	e.printStackTrace();
            	
            }
            }
            }
            %>

            </body>
            </html>
