<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Validation Result</title>
</head>
<body>
<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        String url = "jdbc:mysql://localhost:3306/ECETF";
        String username = "root";
        String password = "saraah";

        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String countQuery = "SELECT COUNT(*) AS totalQuestions FROM Maths";
        preparedStatement = connection.prepareStatement(countQuery);
        resultSet = preparedStatement.executeQuery();

        int numberOfQuestions = 0;
        if (resultSet.next()) {
            numberOfQuestions = resultSet.getInt("totalQuestions");
        }

        for (int i = 1; i <= numberOfQuestions; i++) {
            String selectedAnswer = request.getParameter("answer" + i); // Ensure parameter name matches
            String sql = "SELECT Answer FROM Maths WHERE SNO = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, i);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String dbAnswer = resultSet.getString("Answer");
                if (dbAnswer != null && selectedAnswer != null && dbAnswer.equalsIgnoreCase(selectedAnswer)) {
                    out.println("<p>Correct answer for question " + i + "</p>");
                } else {
                    out.println("<p>Incorrect answer for question " + i + "</p>");
                }
            } else {
                out.println("<p>Answer not found for question " + i + "</p>");
            }
        }

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Database error occurred</p>");
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<div id="resultContainer"></div> <!-- Container for displaying validation results -->

<script>
    function submitForm() {
        var selectedOptions = document.querySelectorAll('input[name^="answer"]:checked');
        if (selectedOptions.length === 0) {
            alert('Please select answers for all questions.');
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'validate.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            var formData = '';
            selectedOptions.forEach(function(option) {
                formData += option.name + '=' + option.value + '&';
            });
            formData = formData.slice(0, -1); // Remove the trailing '&' character
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        document.getElementById('resultContainer').innerHTML = xhr.responseText;
                    } else {
                        console.error('Validation request failed.');
                    }
                }
            };
            
            xhr.send(formData);
        }
    }
</script>
<button type="button" onclick="submitForm()">Submit Answers</button>
</body>
</html>
