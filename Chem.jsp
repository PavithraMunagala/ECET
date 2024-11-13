<%@page import="java.sql.*"%>
<%
   // Retrieve form data
   String SNO = request.getParameter("SNO");
   String Question = request.getParameter("Question");
   String OptionA = request.getParameter("OptionA");
   String OptionB = request.getParameter("OptionB");
   String OptionC = request.getParameter("OptionC");
   String OptionD = request.getParameter("OptionD");
   String Answer = request.getParameter("Answer");

   // Database connection and data insertion
   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");

       // Using a PreparedStatement to avoid SQL injection
       String sql = "INSERT INTO Chem(SNO,Question,OptionA,OptionB,OptionC,OptionD,Answer) VALUES (?,?,?,?,?,?,?)";
       PreparedStatement pstmt = con.prepareStatement(sql);
       pstmt.setString(1, SNO);
       pstmt.setString(2, Question);
       pstmt.setString(3, OptionA);
       pstmt.setString(4, OptionB);
       pstmt.setString(5, OptionC);
       pstmt.setString(6, OptionD);
       pstmt.setString(7, Answer);

       int rowsAffected = pstmt.executeUpdate();

       if (rowsAffected > 0) {
           out.print("Data inserted successfully.");
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


