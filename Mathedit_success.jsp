<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
int SNO = Integer.parseInt(request.getParameter("SNO"));
String Question = request.getParameter("Question");
String OptionA = request.getParameter("OptionA");
String OptionB = request.getParameter("OptionB");
String OptionC = request.getParameter("OptionC");
String OptionD = request.getParameter("OptionD");
String Answer = request.getParameter("Answer");

// Declare and initialize the rowsAffected variable
int rowsAffected = 0;

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");
    String sql = "UPDATE Maths SET Question=?, OptionA=?, OptionB=?, OptionC=?, OptionD=?, Answer=? WHERE SNO=?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, Question);
    pstmt.setString(2, OptionA);
    pstmt.setString(3, OptionB);
    pstmt.setString(4, OptionC);
    pstmt.setString(5, OptionD);
    pstmt.setString(6, Answer);
    pstmt.setInt(7, SNO);

    // Execute the SQL statement (UPDATE) and store the number of rows affected
    rowsAffected = pstmt.executeUpdate();

    // Check the number of rows affected
    if (rowsAffected > 0) {
        // The operation was successful, and rows were affected
       response.sendRedirect("MathsFetch.jsp");
    } else {
        // No rows were affected (e.g., no records matched the condition)
        out.println("No rows were affected.");
    }
} catch (Exception e) {
    out.println(e);
}
%>