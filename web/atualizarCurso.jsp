<%-- 
    Document   : atualizarCurso
    Created on : 25/07/2023, 12:05:39
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
            curso.setNome_curso(request.getParameter("txtNome"));
            curso.setDuracao_curso(Integer.parseInt(request.getParameter("duracao")));
            
            CursoDAO cursodao = new CursoDAO();
            cursodao.atualizar(curso);
            }
            catch(Exception e){
            
            }
            %>
        
        
    </body>
</html>
