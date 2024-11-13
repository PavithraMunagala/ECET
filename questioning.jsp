<!--<%! int fontSize; %>
<html>
   <head>
      <title>FOR LOOP Example</title>
   </head>
   <body>
      <%for ( fontSize = 1; fontSize <= 200; fontSize++){ %>
<form action="/action_page.php">
    <%out.print(fontSize);%><textarea style="border-style:none;"} id="id" name="name"></textarea><br><br>
    <input type="radio" id="optionA" name="fav_language" value="1">
      <label for="css">A</label> <span><input style="border-style:none;"}type="text" id="fname" name="fname"></span><br><br>
    <input type="radio" id="optionB" name="fav_language" value="2">
  <label for="css">B</label> <span><input style="border-style:none;"}type="text" id="fname" name="fname"></span><br><br>
  <input type="radio" id="optionC" name="fav_language" value="3">
  <label for="css">C</label><span>  <input style="border-style:none;"}type="text" id="fname" name="fname"></span><br><br>
    <input type="radio" id="optionD" name="fav_language" value="4">
  <label for="css">D</label><span>  <input style="border-style:none;"}type="text" id="fname" name="fname"></span><br>
      <label for="css">Answer</label><span> 
          <input style="border-style:none;"}type="text" id="Answer" name="fav_language" placeholder="Enter ur correct option here"><br><br>
      
          <%}%>
   </body>
</html>-->
          <!DOCTYPE html>
<html>
 
<head>
    <title>
        How to check whether a radio button
        is selected with JavaScript ?
    </title>
</head>
 
<body> 
     
    <h1 style="color:green;">
        GeeksforGeeks
    </h1>
     
    <h3>
        Click on the button to check whether<br>
        a radio button is selected or not
    </h3>
     
    <form>
        <input type="radio" name="GFG" id="GFG"
            value="GeeksforGeeks">GeeksforGeeks<br>
         
        <input type="radio" name="GFG" id="HTML"
            value="HTML">HTML<br>
         
        <input type="radio" name="GFG" id="JS"
            value="JavaScript">JavaScript<br><br>
     
        <button type="button" onclick="display()">
            Submit
        </button>
    </form>
    <br>
    <div id="disp" style=
        "color:green; font-size:18px; font-weight:bold;">
    </div> 
</body> 
    <script>
        function display() { 
            if(document.getElementById('GFG').checked) {
                document.getElementById("disp").innerHTML
                    = document.getElementById("GFG").value
                    + " radio button checked";
            }
            else if(document.getElementById('HTML').checked) {
                document.getElementById("disp").innerHTML
                    = document.getElementById("HTML").value
                    + " radio button checked";  
            }
            else if(document.getElementById('JS').checked) {
                document.getElementById("disp").innerHTML
                    = document.getElementById("JS").value
                    + " radio button checked";  
            }
            else {
                document.getElementById("disp").innerHTML
                    = "No one selected";
            }
        }
    </script>
</html>