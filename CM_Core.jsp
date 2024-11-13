<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%! int fontSize; %>
<html>
<head>
    <title>FOR LOOP Example</title>
    <style>
        input[type="radio"]{
            font-size: 15px;
            font-family: sans-serif;
            padding: 2px;
            margin-bottom: 5px;
        }
            input[type="text"]{
            border-style: none;
            margin-bottom: 10px;
            font-size: 15px;
            font-family: sans-serif;
        }
            textarea{
            border-style:none;
            font-size: 15px;
            font-family: sans-serif;
        }
    </style>
</head>
<body>
<form action="CM_Coree.jsp">
    <input type="text" id="SNO" name="SNO" size="1"><textarea name="Question" placeholder="Enter your question "></textarea><br><br>
    <input type="radio" id="optionA"<%= fontSize %>" name="fav_language" value="1">
    <label for="optionA<%= fontSize %>">A</label> <span><textarea name="OptionA" placeholder="Enter option"></textarea><br><br><!-- comment -->
    <input type="radio" id="optionB<%= fontSize %>" name="fav_language" value="2">
    <label for="optionB<%= fontSize %>">B</label> <span><textarea name="OptionB" placeholder="Enter option"></textarea><br><br>
    <input type="radio" id="optionC<%= fontSize %>" name="fav_language" value="3">
    <label for="optionC<%= fontSize %>">C</label><span><textarea name="OptionC" placeholder="Enter option"></textarea><br><br>
    <input type="radio" id="optionD<%= fontSize %>" name="fav_language" value="4">
    <label for="optionD<%= fontSize %>">D</label><span><textarea name="OptionD" placeholder="Enter option"></textarea><br><br>
        <label for="css">Answer</label><span>&nbsp;<input type="text" name="Answer" size="1"><br><br>
            <button type="submit">Submit</button><br><br><br>
</form>
</body>
</html>
