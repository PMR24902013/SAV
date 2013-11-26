

<%@page import="classes.data.UsuariosDO"%>
<%@page import="classes.transacoes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.transacoes.Estacao" %>
<%@ page import="classes.data.EstacionamentoDO" %>
<%@page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Estação Propria</title>
        <%@ include file="headerOpSistema.html" %>
    </head>

    <body>
        <div id="base">
            <div id="cima"><div id="logo"></div></div>
            <div id="tudo">
                <% if (null != request.getParameter("incluir")) {
                        String nome = request.getParameter("nome");
                        String endereco = request.getParameter("endereco");
                        String cep = request.getParameter("cep");
                        String telefone = request.getParameter("telefone");

                        EstacionamentoDO edo = new EstacionamentoDO();

                        String nomeatual = (String) session.getAttribute("user_name");

                        Usuarios tn = new Usuarios();
                        Vector es = tn.pesquisar(nomeatual);
                        UsuariosDO estacaocriada = new UsuariosDO();
                        estacaocriada = (UsuariosDO) es.get(0);

                        Estacao e = new Estacao();

                        if (e.isEmpty(nome) || e.isEmpty(endereco) || e.isEmpty(cep) || e.isEmpty(telefone)) {
                %>

                <form id="contentRight" action="Estacao_cadastrarDados.jsp" method="post">

                Preencha todos os campos!
                    <input type="submit" name="Prosseguir" value="Prosseguir">
                </form>

                <%            } else {
                    edo.setUsuario_Id(estacaocriada.getId());
                    edo.setNome(nome);
                    edo.setEndereco(endereco);
                    edo.setCEP(cep);
                    edo.setTelefone(telefone);

                    classes.transacoes.Estacao est = new classes.transacoes.Estacao();

                    est.incluir(edo);

                %>


                <form id="contentRight" action="Estacionamento_menu.html" method="post">
                Seus dados foram cadastrados com sucesso!
                    <input type="submit" name="Prosseguir" value="Prosseguir" />
                </form>
                <%            }
                    }

                    if (null != request.getParameter("Cancelar")) {
                %>
                <jsp:forward page="OperadorSistema_menu.html" />

                <%
                        return;
                    }
                %>

                <form id="contentRight" action="Estacao_cadastrarDados.jsp" method="post">

                    <table>
                        <tr> 
                            <td>Nome da Estação</td>
                            <td><input type="text" name="nome" />
                        </tr>
                        <tr>
                            <td>Endereço</td>
                            <td><input type="text" name="endereco" />
                        </tr>
                        <tr>
                            <td>CEP</td>
                            <td><input type="text" name="cep"/>
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone"/>
                        </tr>
                    </table>
                    <input style="margin-left: 30%;" type="submit" name="incluir" value="Finalizar" /> 
                    <input type="submit" name="Cancelar" value="Cancelar" />
                </form>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
