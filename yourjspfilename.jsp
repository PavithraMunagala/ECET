<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your JSP File</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .logo {
            order: 1; /* Move the timerDisplay to the right */
        }

        nav {
            order: -1; /* Move the navigation menu to the left */
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav ul li {
            margin-right: 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

      .button-container {
    margin-top: 10px;
    white-space: nowrap; /* Prevent line break */
}

.button-container form {
    display: inline-block;
    margin-right: 10px; /* Add margin between buttons */
}

 input[type="submit"],
.button-container input[type="button"] {
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    display: inline-block; /* Display buttons inline */
    vertical-align: middle; /* Align buttons vertically */
}


        .question-container {
            display: none;
        }

        .current-question {
            display: block;
        }

        .result-container {
            margin-top: 20px;
        }

        .result-container table {
            width: 50%;
            border-collapse: collapse;
        }

        .result-container th, .result-container td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .result-container th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="#">Mathematics</a></li>
            <li><a href="#" onclick="loadSubject('Physics')">Physics</a></li>
            <li><a href="#">Chemistry</a></li>
            <li><a href="#">Core</a></li>
        </ul>
    </nav>
    <div id="timerDisplay" class="logo">
        Time Left: 1h 0m 0s
    </div>
</header>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    List<String[]> selectedLabelsList = new ArrayList<>();
    List<String[]> validatedResults = new ArrayList<>();
    boolean isSubmitted = false;
    boolean allowNavigation = false; // Flag to control navigation

    String indexParam = request.getParameter("index");
    int currentIndex = (indexParam != null && !indexParam.isEmpty()) ? Integer.parseInt(indexParam) : 1; // Assuming default index is 1

    try {
        String url = "jdbc:mysql://localhost:3306/ECETF";
        String username = "root";
        String password = "saraah";

        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String questionQuery = "SELECT SNO, Question, OptionA, OptionB, OptionC, OptionD, Answer FROM Maths WHERE SNO = ?";
        preparedStatement = connection.prepareStatement(questionQuery);
        preparedStatement.setInt(1, currentIndex);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            int sno = resultSet.getInt("SNO");
            String question = resultSet.getString("Question");
            String optionA = resultSet.getString("OptionA");
            String optionB = resultSet.getString("OptionB");
            String optionC = resultSet.getString("OptionC");
            String optionD = resultSet.getString("OptionD");
            String correctAnswer = resultSet.getString("Answer");

            request.setAttribute("sno", sno);
            request.setAttribute("question", question);
            request.setAttribute("optionA", optionA);
            request.setAttribute("optionB", optionB);
            request.setAttribute("optionC", optionC);
            request.setAttribute("optionD", optionD);
            request.setAttribute("correctAnswer", correctAnswer);

            // Retrieve past selected labels for this question
            for (int i = 1; i <= 50; i++) {
                String pastSelectedLabel = request.getParameter("answer" + i);
                if (pastSelectedLabel != null && !pastSelectedLabel.isEmpty()) {
                    String correctAnswerForPast = request.getParameter("correctAnswer" + i);
                    String[] pastLabelInfo = {String.valueOf(i), pastSelectedLabel, correctAnswerForPast};
                    selectedLabelsList.add(pastLabelInfo);
                }
            }
        }

        if (request.getMethod().equals("POST")) {
            isSubmitted = true;

            // Handle current selection if any
            String currentSelectedLabel = request.getParameter("answer" + currentIndex);
            if (currentSelectedLabel != null && !currentSelectedLabel.isEmpty()) {
                String correctAnswer = request.getParameter("correctAnswer" + currentIndex);
                String[] result = {String.valueOf(currentIndex), currentSelectedLabel, correctAnswer};
                validatedResults.add(result);
            }

            for (String[] label : selectedLabelsList) {
                if (label.length >= 3) { // Check array length
                    int sno = Integer.parseInt(label[0]);
                    String selectedLabel = label[1];
                    String correctAnswer = label[2];

                    boolean isCorrect = selectedLabel.equals(correctAnswer);
                    String[] result = {String.valueOf(sno), selectedLabel, correctAnswer, String.valueOf(isCorrect)};
                    validatedResults.add(result);
                }
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
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

<% if (request.getAttribute("question") != null) { %>
    <div class="question-container current-question">
        <form action="yourjspfilename.jsp" method="post">
            <p><%= request.getAttribute("sno") %><%= request.getAttribute("question") %><br><br>
                <input type="radio" id="optionA" name="answer<%= currentIndex %>" value="A" <% if ("A".equals(request.getAttribute("answer" + currentIndex))) { %>checked<% } %>>
                <label for="optionA">A</label>&nbsp;<%= request.getAttribute("optionA") %><br><br>
                <input type="radio" id="optionB" name="answer<%= currentIndex %>" value="B" <% if ("B".equals(request.getAttribute("answer" + currentIndex))) { %>checked<% } %>>
                <label for="optionB">B</label>&nbsp;<%= request.getAttribute("optionB") %><br><br>
                <input type="radio" id="optionC" name="answer<%= currentIndex %>" value="C" <% if ("C".equals(request.getAttribute("answer" + currentIndex))) { %>checked<% } %>>
                <label for="optionC">C</label>&nbsp;<%= request.getAttribute("optionC") %><br><br>
                <input type="radio" id="optionD" name="answer<%= currentIndex %>" value="D" <% if ("D".equals(request.getAttribute("answer" + currentIndex))) { %>checked<% } %>>
                <label for="optionD">D</label>&nbsp;<%= request.getAttribute("optionD") %><br><br>
                <input type="hidden" name="index" value="<%= currentIndex %>">
                <input type="hidden" name="correctAnswer<%= currentIndex %>" value="<%= request.getAttribute("correctAnswer") %>">
                <input type="submit" value="Submit" style="display: inline-block;">
            </p>
        </form>
    </div>
<% } %>


<div class="button-container">
    <form action="yourjspfilename.jsp" method="get" style="display: inline-block;">
        <!-- Previous button -->
        <input type="hidden" name="index" value="<%= currentIndex - 1 %>">
        <input type="submit" value="Previous" <% if (currentIndex <= 1) { %>disabled<% } %>>
    </form>
    <!-- Your existing Next and Submit buttons -->
    <form action="yourjspfilename.jsp" method="get" style="display: inline-block;">
        <!-- Next button -->
        <input type="hidden" name="index" value="<%= currentIndex + 1 %>">
        <input type="submit" value="Next" <% if (currentIndex >= 50) { %>disabled<% } %>>
    </form>
</div>

<% if (isSubmitted) { %>
    <div class="result-container">
        <h2>Validated Results</h2>
        <table border="1">
            <tr>
                <th>SNO</th>
                <th>Selected Label</th>
                <th>Correct Answer</th>
                <th>Is Correct?</th>
            </tr>
            <% for (String[] result : validatedResults) { %>
                <tr>
                    <%-- Add index bounds check before accessing array elements --%>
                    <% if (result.length >= 4) { %>
                        <td><%= result[0] %></td>
                        <td><%= result[1] %></td>
                        <td><%= result[2] %></td>
                        <td><%= result[3] %></td>
                    <% } else { %>
                        
                    <% } %>
                </tr>
            <% } %>
        </table>
    </div>
<% } %>


<script>
    function updateTimerDisplay() {
        var timerElement = document.getElementById("timerDisplay");
        var timeLeft = parseInt(sessionStorage.getItem("initialTimeLeft"));

        function padZero(number) {
            return (number < 10 ? "0" : "") + number;
        }

        function updateDisplay() {
            var hours = Math.floor(timeLeft / 3600);
            var minutes = Math.floor((timeLeft % 3600) / 60);
            var seconds = timeLeft % 60;

            timerElement.textContent = "Time Left: " + padZero(hours) + "h " + padZero(minutes) + "m " + padZero(seconds) + "s";

            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                timerElement.textContent = "Time's up!";
            } else {
                timeLeft--; // Decrement the time
                sessionStorage.setItem("initialTimeLeft", timeLeft); // Store updated time in session storage
            }
        }

        updateDisplay();
        var timerInterval = setInterval(updateDisplay, 1000); // Update every second
    }

    // Call the updateTimerDisplay function when the page loads
    window.onload = function () {
        if (sessionStorage.getItem("initialTimeLeft") === null) {
            // Set initial time if not already set
            sessionStorage.setItem("initialTimeLeft", 10800); // 3 hours in seconds
        }
        updateTimerDisplay();
    };
</script>
</body>
</html>
