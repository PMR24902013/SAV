<%-- 
    Document   : login
    Created on : 28/10/2013
    Author     : Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
<%
    if ( request.getParameter("campo_controle") != null ) {
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
        // metodo valida deve ser implementado
        //boolean v = valida(user, passwd);
        // simulacao: deve ser 123

        classes.data.UsuariosData loginDigitado = new classes.data.UsuariosData();
        classes.data.UsuariosDO usuario = loginDigitado.pesquisarPorLogin(user);
        String senha = usuario.getParameter("senha");

        boolean v = senha.equals(passwd);
        if (v) {
           session.setAttribute("user_name", user);
           pageContext.forward("main.jsp");
        } else {
   %>
           Usuario ou Senha invalidos!
   <%
        }
    }
    // show login form
%>
    <form method="post" action=index.jsp>
       Usuário <input type="text" name="usuario" />
       Senha <input type="password" name="senha" />
       <input type="submit" name="enviar" value="Enviar" />
       <input type="hidden" name="campo_controle" />
    </form>
    </body>
</html>
