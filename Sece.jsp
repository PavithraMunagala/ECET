<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if(username != null && password != null && username.equals("student") && password.equals("sbsp@"))
    {
        session.setAttribute("user", username);
        response.sendRedirect("SEC_Intro.html");
    } 
    else
    {
        out.print("Validation failed..!");
    }   
%>
