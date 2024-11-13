<%@page import="java.sql.*"%>
<%
   // Retrieve form data
   String Name = request.getParameter("Name");
   String Email = request.getParameter("Email");
   String Message = request.getParameter("Message");

   // Database connection and data insertion
   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");

       // Using a PreparedStatement to avoid SQL injection
       String sql = "INSERT INTO Contact(Name,Email,Message) VALUES (?,?,?)";
       PreparedStatement pstmt = con.prepareStatement(sql);
       pstmt.setString(1, Name);
       pstmt.setString(2, Email);
       pstmt.setString(3, Message);
       

       int rowsAffected = pstmt.executeUpdate();

       if (rowsAffected > 0) {
             response.sendRedirect("Contact.html");
       } else {
           out.print("Failed to insert data.");
       }

       // Closing resources
       pstmt.close();
       con.close();
   } catch (ClassNotFoundException | SQLException e) {
       // Handle exceptions
       out.print("An error occurred: " + e.getMessage());
       e.printStackTrace(); // Print stack trace for debugging
   }
%>


