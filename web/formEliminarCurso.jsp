<%-- 
    Document   : formEliminarCurso
    Created on : 25/07/2023, 10:23:48
    Author     : Utilizador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        String user = (String)session.getAttribute("txtUsername");
            
            if (user==null){
            response.sendRedirect("index.jsp");
            }
        %>
        
        <h3>Informações do Curso a Eliminar</h3>
        <form action="eliminarCurso.jsp" method="POST" accept-charset="UTF-8">
            <label> Código do Curso: </label><br>
            <input type="text"  name="id"
                   value="<%=request.getParameter("id")%>"><br><br>
            <label> Nome do Curso: </label><br>
            <input type="text" size="50" name="txtNome" decode_utf8
                   value="<%=request.getParameter("nome")%>"><br><br>
            <label> Duração do Curso: </label><br>
            <input type="text" name="duracao"
                   value="<%=request.getParameter("duracao")%>"><br><br>
            <input type="submit" value="Eliminar">
        </form>
    </body>
</html>
