<%@ page import="java.util.ArrayList, java.util.Map, java.util.HashMap" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
try {
    // Establish database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");
    
    // Retrieve currentQuestionIndex parameter from the request
    int currentQuestionIndex = Integer.parseInt(request.getParameter("currentQuestionIndex"));
    
    // Prepare and execute SQL statement to fetch the next question
    String query = "SELECT * FROM Maths LIMIT ?, 1";  // Assuming "Maths" is your table name
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setInt(1, currentQuestionIndex);
    ResultSet rs = stmt.executeQuery();
    
    // Store the next question in a map
    Map<String, String> nextQuestionMap = new HashMap<String, String>();
    if (rs.next()) {
        nextQuestionMap.put("SNO", rs.getString("SNO"));
        nextQuestionMap.put("Question", rs.getString("Question"));
        nextQuestionMap.put("OptionA", rs.getString("OptionA"));
        nextQuestionMap.put("OptionB", rs.getString("OptionB"));
        nextQuestionMap.put("OptionC", rs.getString("OptionC"));
        nextQuestionMap.put("OptionD", rs.getString("OptionD"));
    }
    
    // Close database resources
    rs.close();
    stmt.close();
    con.close();
    
    // Generate HTML content for the next question
    out.println("<p>" + nextQuestionMap.get("SNO") + "&nbsp;" + nextQuestionMap.get("Question") + "<br><br>");
    out.println("<input type='radio' id='optionA' name='answer' value='A'>");
    out.println("<label for='optionA'>A</label>&nbsp;" + nextQuestionMap.get("OptionA") + "<br><br>");
    out.println("<input type='radio' id='optionB' name='answer' value='B'>");
    out.println("<label for='optionB'>B</label>&nbsp;" + nextQuestionMap.get("OptionB") + "<br><br>");
    out.println("<input type='radio' id='optionC' name='answer' value='C'>");
    out.println("<label for='optionC'>C</label>&nbsp;" + nextQuestionMap.get("OptionC") + "<br><br>");
    out.println("<input type='radio' id='optionD' name='answer' value='D'>");
    out.println("<label for='optionD'>D</label>&nbsp;" + nextQuestionMap.get("OptionD") + "<br><br>");
} catch (Exception e) {
    out.println(e);
}
%>
