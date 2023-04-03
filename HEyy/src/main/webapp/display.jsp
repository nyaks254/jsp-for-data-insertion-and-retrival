<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link rel>
</head>
<body>

    <center><h1>Login Successful Buddy</h1>
    <p>Here are some of the users who have successfully registered with us</p>
    <p>would you please check if you are one of them</p>
    <h1>User's List</h1>
    <table border="1">
        <tr>
            <th>Registration Number</th>
            <th>Full Name</th>
            <th>Email Address</th>
            <th>Phone Number</th>
            <th>Gender</th>
            <th>Role</th>
        </tr>
        <% 
        String jdbcUrl = "jdbc:mysql://localhost:3306/registration";
        String dbUsername = "root";
        String dbPassword = "Magangi203*#";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            String sql = "SELECT * FROM users";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String regno = resultSet.getString("Regno");
                String fullname = resultSet.getString("Full_name");
                String email = resultSet.getString("Email");
                String phone = resultSet.getString("Phone_number");
                String gender = resultSet.getString("Gender");
                String role = resultSet.getString("Role");

                out.println("<tr>");
                out.println("<td>" + regno + "</td>");
                out.println("<td>" + fullname + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + phone + "</td>");
                out.println("<td>" + gender + "</td>");
                out.println("<td>" + role + "</td>");
                out.println("</tr>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
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
        %>
    </table>
    </center>
</body>
</html>
