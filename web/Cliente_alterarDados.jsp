<%-- 
    
    
/**
* Data:27/10/2013
* Autor: Rafael
* Descricao:altera os dados cadastrais do cliente
* Entradas:

    
    
    email CHAR(30) NULL,
    Endereco CHAR(30) NULL,
    Telefone CHAR(30) NULL,
    
    Estado CHAR(30) NULL,
* Saidas:confirmação da atualização e disposicao do botao para voltar a tela inicial

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
        <title>Alterar dados Cadastrais</title>
        <%@ include file="headerCliente.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <%     if (null == request.getParameter("alterar")) { %>
                <form  id="contentRight" action="Cliente_alterarDados.jsp" method="post">
                    <%
                        classes.transacoes.Clientes c = new classes.transacoes.Clientes();
                        Vector tn = new Vector();

                        UsuariosDO usuariologado = new UsuariosDO();
                        Usuarios users = new Usuarios();
                        tn = users.pesquisar((String) session.getAttribute("user_name"));
                        usuariologado = (UsuariosDO) tn.get(0);

                        ClientesDO clientelogado = new ClientesDO();
                        clientelogado = c.buscarPorUsuarioID(usuariologado.getId());%>

                        <p id="contentRight">Bem vindo <%= session.getAttribute("user_name")%></p>
                    <!-- mostra os valores atuais -->
                    <table>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" value=<%=clientelogado.getEmail()%> name="email" />
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" value="<%=clientelogado.getEndereco()%>" name="endereco" />
                        </tr>

                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" value=<%=clientelogado.getTelefone()%> name="telefone" />
                        </tr>
                    </table>
                    <input type="submit" name="alterar" value="Alterar" />
                    <input type="submit" name="cancelar" value="cancelar" />
                </form>

                <% } %>
                <!--   se apertar  "cancelar" volta para o menu do cliente -->

                <%     if (null != request.getParameter("cancelar")) {
                %>        <jsp:forward page="Cliente_menu.html" />
                <%
                    }
                    //se apertar alterar
                    if (null != request.getParameterValues("alterar")) {
                        // se tiver campo vazio
                        Posto p = new Posto();
                        if (p.isEmpty(request.getParameter("endereco")) || p.isEmpty(request.getParameter("email")) || p.isEmpty(request.getParameter("telefone"))) {
                %>
                <p id="contentRight">Preencha todos os campos, por favor.</p>
                <form  id="contentRight" action="Cliente_alterarDados.jsp" method="post">
                    <input type="submit" name="voltar" value="voltar" />
                </form>
                <%
                } else {//se nao tiver

                    classes.transacoes.Clientes c = new classes.transacoes.Clientes();
                    Vector tn = new Vector();

                    UsuariosDO usuariologado = new UsuariosDO();
                    Usuarios users = new Usuarios();
                    tn = users.pesquisar((String) session.getAttribute("user_name"));
                    usuariologado = (UsuariosDO) tn.get(0);

                    ClientesDO clientelogado = new ClientesDO();
                    clientelogado = c.buscarPorUsuarioID(usuariologado.getId());
                    String email = request.getParameter("email");
                    String endereco = request.getParameter("endereco");
                    String telefone = request.getParameter("telefone");

                    clientelogado.setEmail(email);
                    clientelogado.setEndereco(endereco);
                    clientelogado.setTelefone(telefone);
                    clientelogado.setEstado("Aguardando");
                    c.atualizar(clientelogado);
                %>   
                <p id="contentRight">Dados alterados com sucesso!</p>
                <!--cria botao voltar-->
                <form  id="contentRight" action="Cliente_menu.html" method="post">
                    <input type="submit" name="voltar" value="voltar" />
                </form>
                <%
                        }
                    }
                %>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
</body>
</html>
