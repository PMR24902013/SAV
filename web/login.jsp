<%-- 
    Document   : login
    Created on : 05/11/2013, 18:29:29
    Author     : hidden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        
    <%@ page import="classes.data.UsuariosDO"%>
    <%@ page import="classes.data.UsuariosData"%>
    <%@ page import="java.util.*"%>
        
<%

    if ( request.getParameter("campo_controle") != null ) {
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
       
        
       
        classes.transacoes.Usuarios loginDigitado = new classes.transacoes.Usuarios();
       
                
        Vector usuarios = loginDigitado.pesquisar(user);
         if ( (usuarios == null) || (usuarios.size() == 0)) {
         // avisar usuario que nao ha' contatos com este nome
%>
          Este usuário não existe!<br><br>
          <form action="index.html" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     }
         else{
        UsuariosDO usuario = new UsuariosDO();
        usuario = (UsuariosDO)usuarios.get(0);
        String senha = usuario.getSenha();

        boolean v = senha.equals(passwd);
        if (v) {
           session.setAttribute("user_name", user);
           
          if(usuario.getTipo().equals("Cliente")){
          
           pageContext.forward("Cliente_menu.html");
          }
           if(usuario.getTipo().equals("OpSist")){
          
           pageContext.forward("OperadorSistema_menu.html");
          }
            if(usuario.getTipo().equals("Motorista")){
          
           pageContext.forward("Motorista_menu.html");
          }
             if(usuario.getTipo().equals("OpManut")){
          
           pageContext.forward("Manutencao_menu.html");
          }
              if(usuario.getTipo().equals("Estacionamento")){
          
           pageContext.forward("Estacionamento_menu.html");
          }
               if(usuario.getTipo().equals("Posto")){
          
           pageContext.forward("Posto_menu.html");
          }
           
        } else {
   %>
           Usuario ou Senha invalidos!
   <%
        }
         }
    }
    // show login form
%>
    <form method="post" action=login.jsp>
       Usuário <input type="text" name="usuario" />
       Senha <input type="password" name="senha" />
       <input type="submit" name="enviar" value="Enviar" />
       <input type="hidden" name="campo_controle" />
    </form>
    </body>
</html>
