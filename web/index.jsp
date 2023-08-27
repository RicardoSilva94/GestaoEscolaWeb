<%-- 
    Document   : index
    Created on : 26/07/2023, 14:04:15
    Author     : Utilizador
--%>

<%@page import="DAO.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="estiloLogin.css">
        <title>Sistema de Autenticação</title>
    </head>
    <body>
	<div id="login">
    <h3 class="text-center text-white pt-5">Autenticação do utilizador</h3>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="login-box col-md-12">
                    <form id="login-form" class="form" action="index.jsp" method="post">
                        <h3 class="text-center text-info">Login</h3>
                        <div class="form-group">
                            <label for="username" class="text-info">Nome do utilizador:</label><br>
                            <input type="text" name="txtUsername" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="txtPassword" id="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="remember-me" class="text-info"><span>Lembrar</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                            <input type="submit" name="submit" class="btn btn-info btn-md" value="Entrar">
                        </div>
                        <div id="register-link" class="text-right">
                            <a href="register.jsp" class="text-info">Criar Conta</a>
                        </div>
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
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
