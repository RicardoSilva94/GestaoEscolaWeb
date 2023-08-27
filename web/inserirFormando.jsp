<%-- 
    Document   : inserirFormando
    Created on : 28/07/2023, 09:12:21
    Author     : Utilizador
--%>

<%@page import="DAO.FormandoDAO"%>
<%@page import="Classes.Curso"%>
<%@page import="Classes.Formando"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
        int cc = Integer.parseInt(request.getParameter("txtCC"));
        String nome = request.getParameter("nomeFormando");
        String apelido = request.getParameter("apelidoFormando");
        String endereco = request.getParameter("enderecoFormando");
        int telefone =Integer.parseInt(request.getParameter("telefoneFormando"));
        int id_curso =Integer.parseInt(request.getParameter("comboCurso"));
       // out.print("O curso selecionado é:"+ curso);

       Formando formando = new Formando();
       formando.setCc_formando(cc);
       formando.setNome_formando(nome);
       formando.setApelido_formando(apelido);
       formando.setEndereco_formando(endereco);
       formando.setTelefone_formando(telefone);
       Curso curso = new Curso();
       curso.setId_curso(id_curso);
       formando.setId_curso(curso);

       FormandoDAO formandodao = new FormandoDAO();
       formandodao.inserirFormando(formando);



        %>
    </body>
</html>
