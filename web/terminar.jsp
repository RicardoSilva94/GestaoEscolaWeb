<%
    //Termina ou destrói a sessão
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
