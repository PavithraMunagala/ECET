<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if(username != null && password != null && username.equals("ECE") && password.equals("sbsp@"))
    {
        session.setAttribute("user", username);
        response.sendRedirect("EC_Intro.html");
    } 
    else
    {
        out.print("Validation failed..!");
    }   
%>
