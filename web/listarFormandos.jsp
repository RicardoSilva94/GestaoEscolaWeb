<%-- 
    Document   : listarFormandos
    Created on : 28/07/2023, 10:22:10
    Author     : Utilizador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Formando"%>
<%@page import="DAO.FormandoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Listagem de Formandos</h3>
        
                <%
        String user = (String)session.getAttribute("txtUsername");
            
            if (user==null){
            response.sendRedirect("index.jsp");
            }
        %>
        
        
        <%
         try{
            //int duracao = Integer.parseInt(request.getParameter("duracao"));
            FormandoDAO formandodao = new FormandoDAO();
            ArrayList<Formando> listaformandos = formandodao.listarFormandos();
            
            for(int i=0; i < listaformandos.size(); i++){
            out.print("Código: "+listaformandos.get(i).getId_formando()+"<br>");
            out.print("Nome:"+listaformandos.get(i).getNome_formando()+"<br>");
            out.print("Apelido:" +listaformandos.get(i).getApelido_formando()+"<br>");
            out.print("Endereco:" +listaformandos.get(i).getEndereco_formando()+"<br>");
            out.print("Curso:" +listaformandos.get(i).getId_curso().getNome_curso()+"<br>");
            
            out.print("<a href='formEliminarFormando.jsp?id=" + listaformandos.get(i).getId_formando() +
            "&nome=" + listaformandos.get(i).getNome_formando() +
            "&apelido=" + listaformandos.get(i).getApelido_formando() + "&endereco="
            + listaformandos.get(i).getEndereco_formando() +"&curso="
            +listaformandos.get(i).getId_curso().getId_curso()+ "'>Eliminar</a>");
            
            out.print("<a href='formAtualizarFormando.jsp?id=" + listaformandos.get(i).getId_formando() +
            "&nome=" + listaformandos.get(i).getNome_formando() +
            "&apelido=" + listaformandos.get(i).getApelido_formando() + "&endereco="
            + listaformandos.get(i).getEndereco_formando() +"&curso="
            +listaformandos.get(i).getId_curso().getId_curso()+ "'>Atualizar</a>");    

        %> <br><br> 
            <%
          
            }
            }
            catch(Exception e){
            
            }
               
            %>
        
    </body>
</html>
