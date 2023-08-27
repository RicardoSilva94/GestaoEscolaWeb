<%-- 
    Document   : Principal
    Created on : 24/07/2023, 14:57:31
    Author     : Utilizador
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <link rel="stylesheet" type="text/css" href="style.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Principal</title>
    </head>
    <header>
        <h1>Gestão da Escola</h1>
    </header>
    <body>
        <%
            String user = (String)session.getAttribute("txtUsername");
            
            if (user==null){
            response.sendRedirect("index.jsp");
            }
            else
            out.println("Bem-vindo, "+user+"<br>");
            %>
                    
            <nav>
            <a href="formInserirCurso.jsp" target="omeuiframe"> Inserir Curso</a>
            <a href="listarCursos.jsp"target="omeuiframe" >Listar Curso</a>
            <a href="formInserirFormando.jsp" targer="omeuIframe">Inserir Formando</a>
            <a href="listarFormandos.jsp" target="omeuIframe">Listar Formandos</a>
            <a href="terminar.jsp">Terminar Sessão</a>
        </nav>     
            <section >
                <iframe src="" name="omeuiframe">
            </iframe>
            </section>
    </body>
</html>
