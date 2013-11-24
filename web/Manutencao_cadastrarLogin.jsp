<%-- 
    Document   : IncluirFuncionarioManutencao
    Created on : 28/10/2013, 17:44:22
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Funcionário de Manutenção</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <%@ page import="classes.data.FuncionarioDO" %>
        <%@ page import="classes.data.UsuariosDO" %>
        <%@ page import="classes.transacoes.Funcionario" %>
        <%@ page import="java.util.Vector" %>

        <div id="base">
            <div id ="cima"></div>
            <! ------------------------------------------------------------>
            <!--   se for o request inicial, mostrar somente o formulario -->

            <%     if (null == request.getParameterValues("incluir")) {
            %>
            <form id="content" action="./Manutencao_cadastrarLogin.jsp" method="post">
                <b>Informações de login</b>
                <table>
                    <tr>
                        <td>Usuário</td>
                        <td><input type="text" name="user" />
                    </tr>       
                    <tr>
                        <td>Senha</td>
                        <td><input type="password" name="password" />
                    </tr>
                    <tr>
                        <td>Re-digite sua senha</td>
                        <td><input type="password" name="validaPassword">
                    </tr>
                </table>
                <input type="submit" name="incluir" value="Enviar" />
                <form action="./index.html" method="post">
                    <input type="submit" name="cancelar" value="Cancelar" />
                </form>
            </form>

            <%      } else {
            %>
            <! ------------------------------------------------------------------->
            <!--   se nao for o request inicial, acionar a transacao de negocio -->
            <%     String user = request.getParameter("user");
                String senha = request.getParameter("password");
                String senhaValidacao = request.getParameter("validaPassword");

                if (!senha.equals(senhaValidacao)) {
            %>
            As senhas digitadas não conferem!            
            <form action="./Manutencao_cadastrarLogin.jsp" method="post">
                <input type="submit" name="retry" value="Repetir" />
            </form>
            <%       }
                classes.transacoes.Usuarios tu = new classes.transacoes.Usuarios();
                classes.data.UsuariosDO usuario = new classes.data.UsuariosDO();
                usuario.setLogin(user);
                usuario.setSenha(senha);
                usuario.setTipo("OpManut");
                if (!tu.incluir(usuario)) {

            %>
            Erro ao adicionar usuário. Verifique os campos.
            <form action="./Manutencao_cadastrarLogin.jsp" method="post">
                <input type="submit" name="retry" value="Repetir" />
            </form>
            <%     } else {
                session.setAttribute("user_name", user);
            %>
            Usuário criado com sucesso. 
            <form action="./FuncManut_cadastrarDados.jsp" method="post">
                <input type="submit" name="continuar" value="Continue" />
            </form>
            <%     }
                }
            %>
        </div>
    </body>
</html>
