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
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"></div>
            <form id="content" method="post" action=Motorista_cadastrarLogin.jsp>
                login <input type="text" name="login" />
                senha <input type="password" name="senha" />
                Confirmação de senha <input type="password" name="senha2" />
                <input type="submit" name="enviar" value="Enviar" />
                <input type="hidden" name="campo_controle" />
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form>

            <!--    "Cancelar"  volta pro inicio -->
            <%     if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }
                if (request.getParameter("campo_controle") != null) {
                    // login a ser criado  
                    String user = request.getParameter("login");
                    // senha a ser criada
                    String passwd = request.getParameter("senha");
                    String passwd2 = request.getParameter("senha2");
                    if (!passwd.equals(passwd2)) { %>
            Senhas não conferem!
            <form action="./Motorista_cadastrarLogin.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
            </form>
            <% }
                // metodo verifica se jah existe tal login
                classes.transacoes.Usuarios tn = new classes.transacoes.Usuarios();
                Vector usuarios = tn.pesquisar(user);
                if ((usuarios != null) && (usuarios.size() > 0) || passwd==null || passwd2==null || user==null) {
            %>
            login ou senha inválida
            <form action="./Motorista_cadastrarLogin.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
            </form>
            <%	   } else {
                UsuariosDO motorista = new UsuariosDO();
                // cria um novo usuario
                motorista.setLogin(user);
                motorista.setSenha(passwd);
                motorista.setTipo("Motorista");
                tn.incluir(motorista);
                session.setAttribute("user_name", user);
            %>
            <jsp:forward page="./Motorista_cadastrarDados.jsp" />
            <%                   }
                }
            %>
        </div>
    </body>
</html>
