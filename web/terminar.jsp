<%
    //Termina ou destr�i a sess�o
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
