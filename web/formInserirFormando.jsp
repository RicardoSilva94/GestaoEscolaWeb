<%-- 
    Document   : formInserirFormando
    Created on : 26/07/2023, 18:06:15
    Author     : Utilizador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Curso"%>
<%@page import="DAO.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Formando</title>
    </head>
    <body>
        <h1>Inserir Formando</h1>
        <%
            String user = (String) session.getAttribute("txtUsername");

            if (user == null) {
                response.sendRedirect("index.jsp");
            }
        %>

        <form action="inserirFormando.jsp" method="GET" accept-charset="UTF-8">
            <label> CC do Formando </label><br>
            <input type="text" size="8" name="txtCC" required><br><br>
            <label> Nome </label><br><!-- comment -->
            <input type="text" name="nomeFormando" required><br><br><!-- comment -->
            <label> Apelido</label><br>
            <input type="text" name="apelidoFormando" required><br><br>
            <label> Endereço </label><br><!-- comment -->
            <input type="text" name="enderecoFormando" required><br><br><!-- comment -->
            <label> Telefone</label><br>
            <input type="text" name="telefoneFormando"><br><br>
            <label> Curso(Estática)</label>
            <select name="comboCurso2">
                <option value="-1">Selecione um Curso</option>
                <option> Programação JAVA </option>
                <option> Programação C </option>
                <option> Programação COBOL </option>
                <option> Programação PYTHON </option>
                <option> Programação HTML </option>

            </select><br><br>

            <label> Curso(Dinâmica)</label>
            <select name="comboCurso">
                <option value="-1">Selecione um Curso</option>
                <%
                    try {

                        CursoDAO cursodao = new CursoDAO();
                        ArrayList<Curso> listacursos = cursodao.listarCursos();

                        for (int i = 0; i < listacursos.size(); i++) {

                %>
                <option value="<%=listacursos.get(i).getId_curso()%>"><%=listacursos.get(i).getNome_curso()%></option>
                <%
                        }

                    } catch (Exception e) {

                    }


                %>

            </select><br><br>

            <input type="submit" value="Inserir">

        </form>

    </body>
</html>