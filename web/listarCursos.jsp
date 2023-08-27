<%-- 
    Document   : listarCursos
    Created on : 25/07/2023, 09:53:43
    Author     : Utilizador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="Classes.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Listagem de Cursos</h3>
        
        <%
        String user = (String)session.getAttribute("txtUsername");
            
            if (user==null){
            response.sendRedirect("index.jsp");
            }
        %>
        
        
        <%
         try{
            //int duracao = Integer.parseInt(request.getParameter("duracao"));
            CursoDAO cursodao = new CursoDAO();
            ArrayList<Curso> listacursos = cursodao.listarCursos();
            
            for(int i=0; i < listacursos.size(); i++){
            out.print("Código do Curso: "+listacursos.get(i).getId_curso()+"<br>");
            out.print("Nome do Curso:"+listacursos.get(i).getNome_curso()+"<br>");
            out.print("Duração:" +listacursos.get(i).getDuracao_curso()+"<br>");
            
            out.print("<a href='formEliminarCurso.jsp?id=" + listacursos.get(i).getId_curso() +
            "&nome=" + listacursos.get(i).getNome_curso() +
            "&duracao=" + listacursos.get(i).getDuracao_curso() + "'>Eliminar</a>");
            
            out.print("<a href='formAtualizarCurso.jsp?id=" + listacursos.get(i).getId_curso() +
            "&nome=" + listacursos.get(i).getNome_curso() +
            "&duracao=" + listacursos.get(i).getDuracao_curso() + "'>Atualizar</a>");    

        %> <br><br> 
            <%
          
            }
            }
            catch(Exception e){
            
            }
               
            %>
    </body>
</html>
