<%-- 
    Document   : cadastraComoPosto
    
/**
* Data:27/10/2013
* Autor:hidden
* Descricao:cadastra como posto
* Entradas:
Na primeira tela:cadastra login e senha. 
Na segunda tela: Nome do posto, string com até 200 caracteres.
 Local do posto, string com até 200 caracteres.
 Adicionar tipo de combustível vendido, string com até 20 caracteres.
 Adicionar preço cobrado pelo combustível, float.
 Nome do responsável pelo posto, string com até 200 caracteres.
 Documento de licenciamento do posto, upload de arquivo .jpeg
* Saidas:
O sistema mostra um aviso ao ator de que o cadastro foi enviado para análise e envia os dados do estacionamento para análise.
*/
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastra como Posto</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"></div>
            <div id="tudo">
                <form id="content" method="post" action=Posto_cadastrarLogin.jsp>
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
                        Posto p = new Posto();
                        if ((usuarios != null) && (usuarios.size() > 0) || p.isEmpty(passwd) || p.isEmpty(user)) {
                %>
                login ou senha inválida
                <form action="Posto_cadastrarLogin.jsp" method="post">
                    <input type="submit" name="Voltarr" value="Voltar" />
                </form>
                <%	   } else {
                    UsuariosDO pusuario = new UsuariosDO();
                    // cria um novo usuario
                    pusuario.setLogin(user);
                    pusuario.setSenha(passwd);
                    pusuario.setTipo("Posto");
                    tn.incluir(pusuario);
                    session.setAttribute("user_name", user);
                %>
                <jsp:forward page="Posto_cadastrarDados.jsp" />
                <%                   }
                    }
                %>
            </div>      
        </div>
    </body>
</html>
