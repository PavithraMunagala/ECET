<%@page import="java.sql.*"%>
<%
   String SNO = request.getParameter("SNO");
   String Question = request.getParameter("Question");
   String OptionA = request.getParameter("OptionA");
   String OptionB = request.getParameter("OptionB");
   String OptionC = request.getParameter("OptionC");
   String OptionD = request.getParameter("OptionD");
   String Answer = request.getParameter("Answer");
   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");
       Statement stmt = con.createStatement();
       int i = stmt.executeUpdate("insert into Maths(SNO,Question,OptionA,OptionB,OptionC,OptionD,Answer) values('" +SNO+ "' , '" + Question + "' , '" + OptionA + "' , '" + OptionB + "' , '" + OptionC + "' , '" + OptionD + "' , '" + Answer + "')");
       if (i > 0) {
           out.print("Registered");
       } else {
           out.print("not registered");
       }
       stmt.close();
       con.close();
   } catch (Exception e) {
       e.printStackTrace(); // Printing stack trace to console for debugging purposes
   }
%>
