<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de motorista</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"></div>
            <%@ page import="java.util.Vector" %>
            <%@ page import="java.util.Date" %>
            <%@ page import="java.text.*" %>
            <%@page import="classes.transacoes.*"  %>
            <%@page import="classes.data.*" %>
            <p class="titulo">Informações de login</p>
            <form id="content" style="margin-left: 25%;" method="post" action=Motorista_cadastrarLogin.jsp>
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
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form>

            <!--    "Cancelar"  volta pro inicio -->
            <%     if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="./index.html" />
            <%        return;
                }
            %>
            <%
                if (request.getParameter("enviar") != null) {
                    // login a ser criado  
                    String user = request.getParameter("login");
                    // senha a ser criada
                    String passwd = request.getParameter("senha");
                    // senha a ser criada
                    String passwd2 = request.getParameter("senha2");
                    // metodo verifica se jah existe tal login
                    Usuarios tn = new Usuarios();
                    Vector usuarios = tn.pesquisar(user);
                    //se existir avisar usuario
                    Funcionario m = new Funcionario();
                    if (m.isEmpty(passwd) || m.isEmpty(user) || (!passwd.equals(passwd2))) {
            %>
            <p style="text-align: center; color: red;">Login ou senha inválida</p>
            <%	   } else if ((usuarios != null) && (usuarios.size() > 0)) {
            %>
            <p style="text-align: center; color: red;">Usuário já cadastrado</p>
            <%        } else {
//                UsuariosDO musuario = new UsuariosDO();
//                // cria um novo usuario
//                musuario.setLogin(user);
//                musuario.setSenha(passwd);
//                musuario.setTipo("Motorista");
//                tn.incluir(musuario);
                session.setAttribute("user_name", user);
                session.setAttribute("passwd", passwd);
                
            %>
            <jsp:forward page="Motorista_cadastrarDados.jsp" />
            <%                   }
                }
            %>
        </div>      
    </body>
</html>
