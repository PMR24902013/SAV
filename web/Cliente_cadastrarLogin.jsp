<%-- 
    Document   : Cliente_cadastrarLogin
    Created on : 21/11/2013, 12:07:51
    Author     : Rodrigo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="header.html" %>
    </head>
    <body>

        <div id="base">
            <div id ="cima"></div>
            <form id="content" method="post" action=Cliente_cadastrarLogin.jsp>
                <br>
                login <input type="text" name="login" />
                senha <input type="password" name="senha" />
                <input type="submit" name="enviar" value="Enviar" />
                <input type="hidden" name="campo_controle" />
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form>

            <!--    "Cancelar"  volta pro inicio -->
            <%     if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }
            %>
            <%
                if (request.getParameter("campo_controle") != null) {
                    // login a ser criado  
                    String user = request.getParameter("login");
                    // senha a ser criada
                    String passwd = request.getParameter("senha");
                    // metodo verifica se jah existe tal login
                    classes.transacoes.Usuarios tn = new classes.transacoes.Usuarios();
                    Vector usuarios = tn.pesquisar(user);
                    //se existir avisar usuario
                    Clientes p = new Clientes();
                    if (p.isEmpty(passwd) || p.isEmpty(user)) {
            %>
            login ou senha inválida
            <form action="Cliente_cadastrarLogin.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
            </form>
            <%	   }
                if ((usuarios != null) && (usuarios.size() > 0)) {
            %>
            usuário já cadastrado
            <form action="Cliente_cadastrarLogin.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
            </form>
            <%        } else {
                UsuariosDO pusuario = new UsuariosDO();
                // cria um novo usuario
                pusuario.setLogin(user);
                pusuario.setSenha(passwd);
                pusuario.setTipo("Cliente");
                tn.incluir(pusuario);
                session.setAttribute("user_name", user);
            %>
            <jsp:forward page="Cliente_cadastrarDados.jsp" />
            <%                   }
                }
            %>
        </div>      
    </body>
</html>
