<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Records</title>
</head>
<body>
    <%
        // Connection parameters for your database
        String url = "jdbc:mysql://localhost:3306/ECETF";
        String username = "root";
        String password = "saraah";
        
        // Initialize variables
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int currentIndex = 0;
        
        try {
            // Establish the database connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            
            // Execute query to fetch records
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM Maths");
            
            // Move the cursor to the current record index
            if (request.getParameter("index") != null) {
                currentIndex = Integer.parseInt(request.getParameter("index"));
                resultSet.absolute(currentIndex + 1);
            } else {
                resultSet.next(); // Move to the first record
            }
            
            // Display the current record
            out.println("<h1>Record: " + resultSet.getString("column_name") + "</h1>");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
//        } finally {
//            // Close resources
//            if (resultSet != null) {
//                try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
//            }
//            if (statement != null) {
//                try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
//            }
//            if (connection != null) {
//                try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
//            }
//        }
    %>
    
    
    <%
        // Display "Next" button if there are more records
        if (resultSet != null && resultSet.next()) {
    %>
            <form action="yourjspfilename.jsp" method="get">
                <input type="hidden" name="index" value="<%= currentIndex + 1 %>">
                <input type="submit" value="START">
            </form>
    <%  
        }
    %>
</body>
</html>