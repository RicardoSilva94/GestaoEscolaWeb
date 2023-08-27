<%-- 
    Document   : inserirCurso
    Created on : 24/07/2023, 17:02:49
    Author     : Utilizador
--%>

<%@page import="DAO.CursoDAO"%>
<%@page import="Classes.Curso"%>
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
            try{
            int duracao = Integer.parseInt(request.getParameter("duracao"));
            String nome = request.getParameter("txtNome");
            Curso curso = new Curso();
            curso.setNome_curso(request.getParameter("txtNome"));
            curso.setDuracao_curso(duracao);
            
            CursoDAO cursodao = new CursoDAO();
            cursodao.inserirCurso(curso);
            //response.sendRedirect("Principal.jsp");
            }
            catch(Exception e){
            
            }
            
            %>
    </body>
</html>
