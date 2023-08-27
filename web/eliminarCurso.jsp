<%-- 
    Document   : eliminarCurso
    Created on : 25/07/2023, 10:56:22
    Author     : Utilizador
--%>

<%@page import="DAO.CursoDAO"%>
<%@page import="Classes.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            int id= Integer.parseInt(request.getParameter("id"));
            Curso curso = new Curso();
            curso.setId_curso(id);
            
            CursoDAO cursodao = new CursoDAO();
            cursodao.eliminar(curso);
            }
            catch(Exception e){
            
            }
            %>
        
        
       
    </body>
</html>
