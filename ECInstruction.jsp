<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Engineering Diploma Exam Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .float-left {
            float: left;
        }

        .float-right {
            float: right;
        }

        .submit-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Engineering Diploma Exam Details</h2>
    <p>1. You will be given 180 minutes to attempt 200 questions.</p>
    <p>2. The Question Paper consists of objective type questions only.</p>
    <p>3. There will be no negative marks for wrong answers.</p>
    <p>4. To save your response, click on Save & Next after answering each question. Otherwise, your response will not be saved.</p>
    <p>5. Do not forget to click on Save & Next after answering the last question before the countdown timer reaches zero.</p>
    <p>6. The questions will be displayed on the screen one at a time in English language only.</p>
    <p>7. Each question will have 4 options, out of which one will be the correct answer and the candidate has to select one option.</p>
    <p>8. Details of the Question Paper:</p>
    <table>
        <tr>
            <th>S. No.</th>
            <th>Section Name</th>
            <th>No. of Objective Type Questions</th>
            <th>Marks</th>
            <th>Marks per Question</th>
            <th>Remarks</th>
        </tr>
        <tr>
            <td>1.</td>
            <td>Mathematics</td>
            <td>50</td>
            <td>50</td>
            <td>1</td>
            <td>Common to all branches</td>
        </tr>
        <tr>
            <td>2.</td>
            <td>Physics</td>
            <td>25</td>
            <td>25</td>
            <td>1</td>
            <td>Common to all branches</td>
        </tr>
        <tr>
            <td>3.</td>
            <td>Chemistry</td>
            <td>25</td>
            <td>25</td>
            <td>1</td>
            <td>Common to all branches</td>
        </tr>
        <tr>
            <td>4.</td>
            <td>Electronics&Communication Engineering</td>
            <td>100</td>
            <td>100</td>
            <td>1</td>
            <td>Separate question paper for Each Branch of Diploma Engineering</td>
        </tr>
        <tr>
            <td></td>
            <td>Total</td>
            <td>200</td>
            <td>200</td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <br>
    <button id="previousButton" class="float-left submit-button">Previous</button>
    <button id="nextButton" class="float-right submit-button">Next</button>

    <script type="text/javascript">
        document.getElementById("previousButton").onclick = function () {
            location.href = "SEC_Intro.html";
        };

        document.getElementById("nextButton").onclick = function () {
            location.href = "yourjspfilename.jsp";
        };
    </script>
</body>
</html>
