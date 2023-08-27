<%-- 
    Document   : index
    Created on : 24/07/2023, 14:34:57
    Author     : Utilizador
--%>

<%@page import="DAO.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Escola</title>
    </head>
    <body>
        <h1>Sistema de Autenticação</h1>
        <form action="index.jsp" method="POST" >
        <label> Username:</label><br>
        <input type="text" name="txtUsername"><br>
        <label> Password: </label><br>
        <input type="password" name="txtPassword"><br><br>
        <input type="submit" value="Entrar">
        <input type="button" value="Criar conta" onClick="window.location.href='formCriarUser.jsp'">
    </form>
        
        <%
        String user = request.getParameter("txtUsername");
        String pass = request.getParameter("txtPassword");
        

        if(user!=null && pass!=null && !user.isEmpty() && !pass.isEmpty()){
            LoginDAO logindao = new LoginDAO();
            if (logindao.autenticar(user, pass)==true){
            session.setAttribute("txtUsername", user);
            response.sendRedirect("Principal.jsp");
            
            }
            else
            out.println("Autenticação falhou");
        }

            


        %>




</body>
</html>
