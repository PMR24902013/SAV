<%-- 
    Document   : Estacionamento_cadastrarLogin
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
        <title>Cadastro de estacionamento</title>
        <%@ include file="header.html" %>
    </head>
    <body>

        <div id="base">
            <div id ="cima"></div>
            <p class="titulo">Informações de login</p>
            <form id="content" style="margin-left: 25%;" method="post" action=Estacionamento_cadastrarLogin.jsp>
                <table>
                    <tr>
                        <td>login </td><td> <input type="text" name="login" /> </td>
                    </tr>
                    <tr>
                        <td>Senha </td><td> <input type="password" name="senha" /> </td>
                    </tr>
                    <tr>
                        <td>Re-digite sua senha </td><td> <input type="password" name="senha2" /> </td>
                    </tr>
                </table>
                <input style="margin-left: 10%;" type="submit" name="enviar" value="Enviar" />
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
                    // senha a ser criada
                    String passwd2 = request.getParameter("senha2");
                    // metodo verifica se jah existe tal login
                    classes.transacoes.Usuarios tn = new classes.transacoes.Usuarios();
                    Vector usuarios = tn.pesquisar(user);
                    //se existir avisar usuario
                    Estacionamento p = new Estacionamento();
                    if (p.isEmpty(passwd) || p.isEmpty(user) || (!passwd.equals(passwd2))) {
            %>
            <p style="text-align: center; color: red;">Login ou senha inválida</p>
            <%	   }

                    else if ((usuarios != null) && (usuarios.size() > 0)) {
            %>
            <p style="text-align: center; color: red;">Usuário já cadastrado</p>
            <%
            } else {
                session.setAttribute("user_name", user);
                session.setAttribute("passwd", passwd);
            %>
            <jsp:forward page="Estacionamento_cadastrarDados.jsp" />
            <%                   }
                }
            %>
        </div>
    </body>
</html>
