<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String user = request.getParameter("user");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF","root","saraah");
    String sql = "SELECT * from EECore WHERE SNO = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, user);
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
%>
<html>
    <head>
        <style>
        input[type="radio"] {
            font-size: 15px;
            font-family: sans-serif;
            padding: 2px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            border-style: none;
            margin-bottom: 10px;
            font-size: 15px;
            font-family: sans-serif;
        }

        textarea {
            border-style: none;
            font-size: 15px;
            font-family: sans-serif;
        }
        </style>
    </head>
<form action="EECoreEdit_success.jsp">
    <input type="text" id="SNO" name="SNO" size="1" value='<%=rs.getString("SNO") %>'>
       <textarea name="Question" placeholder="Enter your question"><%=rs.getString("Question") %></textarea><br><br>
        
        A <input type="radio" id="optionA" name="fav" value="1">
        <textarea name="OptionA" Placeholder="Option A"><%= rs.getString("OptionA") %></textarea><br><br>
        B <input type="radio" id="optionB" name="fav" value="2">
        <textarea name="OptionB" Placeholder="Option B"><%= rs.getString("OptionB") %></textarea><br><br>
        C <input type="radio" id="optionC" name="fav" value="3">
        <textarea name="OptionC" Placeholder="Option C"><%= rs.getString("OptionC") %></textarea><br><br>
        D <input type="radio" id="optionD" name="fav" value="4">
        <textarea name="OptionD" Placeholder="Option D"><%= rs.getString("OptionD") %></textarea><br><br>
        
        Answer: <input type="text" name="Answer" size="1" value='<%=rs.getString("Answer") %>'><br><br>
        
        <button type="submit">Submit</button><br><br><br>
    </form>
</html>
<%
    } else {
        out.println("Some error !");
    }
} catch(Exception e) {
    out.println(e);
}
%>