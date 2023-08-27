<%-- 
    Document   : formInserirCurso
    Created on : 24/07/2023, 16:30:01
    Author     : Utilizador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <link rel="stylesheet" type="text/css" href="style.css" />
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
        
        
        <h1>Inserir Curso</h1>
        <form action="inserirCurso.jsp" method="POST" accept-charset="UTF-8">
            <label> Nome do Curso: </label><br>
            <input type="text" size="50" name="txtNome"><br><br>
            <label> Duração do Curso: </label><br>
            <input type="text" name="duracao"><br><br><!-- comment -->
            <input type="submit" value="Inserir">
        </form>
    </body>
</html>
