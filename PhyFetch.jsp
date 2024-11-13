<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Fetching Data</title>
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
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ECETF", "root", "saraah");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Phy");
    int iterations = 26; // Number of iterations
    for (int i = 1; i <= iterations && rs.next(); i++) {
        String sno = rs.getString("SNO");
        String question = rs.getString("Question");
        String optionA = rs.getString("OptionA");
        String optionB = rs.getString("OptionB");
        String optionC = rs.getString("OptionC");
        String optionD = rs.getString("OptionD");
        String answer = rs.getString("Answer");
%>
        <p><%= sno %>&nbsp;<%= question %><br><br>

        <input type="radio" id="optionA<%= sno %>" name="answer<%= sno %>" value="1">
        <label for="optionA<%= sno %>">A</label>&nbsp;
        <%= optionA %><br><br>

        <input type="radio" id="optionB<%= sno %>" name="answer<%= sno %>" value="2">
        <label for="optionB<%= sno %>">B</label>&nbsp;
        <%= optionB %><br><br>

        <input type="radio" id="optionC<%= sno %>" name="answer<%= sno %>" value="3">
        <label for="optionC<%= sno %>">C</label>&nbsp;
        <%= optionC %><br><br>

        <input type="radio" id="optionD<%= sno %>" name="answer<%= sno %>" value="4">
        <label for="optionD<%= sno %>">D</label>&nbsp;
        <%= optionD %><br><br>

        <label for="css<%= sno %>">Answer</label>&nbsp;<%= answer %>&nbsp;<a href="PhyEdit.jsp?user=<%= sno %>">Edit</a>
       
<%
    }
    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
</body>
</html>
