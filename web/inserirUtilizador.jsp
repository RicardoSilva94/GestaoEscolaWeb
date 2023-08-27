<%-- 
    Document   : inserirUtilizador
    Created on : 26/07/2023, 15:42:01
    Author     : Utilizador
--%>

<%@page import="DAO.LoginDAO"%>
<%@page import="Classes.Utilizador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String pass_confirm = request.getParameter("password_confirmation");

    if (!user.isEmpty()==true && !pass.isEmpty()==true && !pass_confirm.isEmpty()==true && pass.equals(pass_confirm)) {
        
        
            Utilizador utilizador = new Utilizador();
            utilizador.setNome(user);
            utilizador.setPass(pass);
            
            LoginDAO logindao = new LoginDAO();
            logindao.inserirUtilizador(utilizador);
            
            response.sendRedirect("index.jsp");
        
            
        }
    
%>
    </body>
</html>
