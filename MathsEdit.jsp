<%@ page import="java.sql.*, java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("user");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");
        String sql = "SELECT * from Maths WHERE Question = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
%>
            <form method="POST" action="Maths.jsp">
                <input type="text" name="SNO" value="<%=rs.getString("SNO") %>"><br><br>
                <textarea name="Question"><%=rs.getString("Question") %></textarea><br><br>
            
                <input type="radio" id="optionA" name="fav_language" value="1">
                <label for="optionA">A</label>
                <textarea name="OptionA"><%=rs.getString("OptionA") %></textarea><br><br>
            
                <input type="radio" id="optionB" name="fav_language" value="2">
                <label for="optionB">B</label>
                <textarea name="OptionB"><%=rs.getString("OptionB") %></textarea><br><br>
            
                <input type="radio" id="optionC" name="fav_language" value="3">
                <label for="optionC">C</label>
                <textarea name="OptionC"><%=rs.getString("OptionC") %></textarea><br><br>
            
                <input type="radio" id="optionD" name="fav_language" value="4">
                <label for="optionD">D</label>
                <textarea name="OptionD"><%=rs.getString("OptionD") %></textarea><br><br>
            
                <label for="css">Answer</label>
                <input type="text" name="Answer" value="<%=rs.getString("Answer") %>"><br><br>
            
                <button type="submit">Submit</button><br><br><br>
            </form>
<%
        } else {
            out.println("No data found for the specified SNO.");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace(new PrintWriter(out));
    }
%>

<%--<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String user = request.getParameter("user");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF","root","saraah");
    String sql = "SELECT * from Maths WHERE SNO = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, user);
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
%>
    <form method="POST" action="Maths.jsp">
    <input type="text" name="SNO" value="'<%=rs.getString("SNO") %>'"><textarea name="Question" value="'<%=rs.getString("Question") %>'"></textarea><br><br>
    <input type="radio" id="optionA" value="1">
    <label for="optionA">A</label> <span><textarea name="OptionA" value="'<%=rs.getString("OptionA") %>'"></textarea><br><br><!-- comment -->
    <input type="radio" id="optionB" name="fav_language" value="2">
    <label for="optionB">B</label> <span><textarea name="OptionB" value="'<%=rs.getString("OptionB") %>'"></textarea><br><br>
    <input type="radio" id="optionC" name="fav_language" value="3">
    <label for="optionC">C</label><span><textarea name="OptionC" value="'<%=rs.getString("OptionC") %>'></textarea><br><br>
    <input type="radio" id="optionD" name="fav_language" value="4">
    <label for="optionD">D</label><span><textarea name="OptionD" value="'<%=rs.getString("OptionD") %>'></textarea><br><br>
        <label for="css">Answer</label><span>&nbsp;<input type="text" name="Answer" value="'<%=rs.getString("Answer") %>'><br><br>
            <button type="submit">Submit</button><br><br><br>
<%
    } else {
        out.println("Some error !");
    }
} catch(Exception e) {
    out.println(e);
}
%>--%>