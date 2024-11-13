<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if(username != null && password != null && username.equals("EEE") && password.equals("sbsp@"))
    {
        session.setAttribute("user", username);
        response.sendRedirect("EE_Intro.html");
    } 
    else
    {
        out.print("Validation failed..!");
    }   
%>
