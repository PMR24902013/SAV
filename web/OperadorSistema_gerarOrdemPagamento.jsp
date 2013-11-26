<%-- 
    Document   : OperadorSistema_gerarOrdemPagamento
    Created on : Nov 26, 2013, 1:01:22 AM
    Author     : Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerar ordem de pagamento</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
                <% 
                    String action = request.getParameter("action");
                if (null == request.getParameter("posto") && null == request.getParameter("cliente") && null == request.getParameter("estacionamento") && null==request.getParameter("action")) {%>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post">
                    Selecione o tipo de usuário cuja ordem deve ser emitida:
                    <table>
                        <tr>
                            <td>Posto</td>
                            <td><input type="submit" name="posto" value="Selecionar" /> </td>
                        </tr>
                        <tr>
                            <td>Cliente</td>
                            <td><input type="submit" name="cliente" value="Selecionar" /> </td>
                        </tr>
                        <tr>
                            <td>Estacionamento</td>
                            <td><input type="submit" name="estacionamento" value="Selecionar" /> </td>
                        </tr>

                    </table>
                </form>
                <%  }
                else if (null != request.getParameter("posto")) {
                        Posto tn_p = new Posto();
                        Vector postos = tn_p.pesquisarTodos();
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                        </tr>   
                        <%
                            for (int i = 0; i < postos.size(); i++) {
                                PostoDO posto = (PostoDO) postos.elementAt(i);
                        %>
                        <tr>
                            <td><%= posto.getNome()%></td>
                            <td><a href=OperadorSistema_gerarOrdemPagamento.jsp?action=calcularValorPosto&id=<%=posto.getID()%>>Calcular</a></td>                   
                        </tr>       
                        <%
                            }

                        %>
                    </table>
                </form>
                <% }
                    else if (null != request.getParameter("cliente")) {
                        Clientes tn_c = new Clientes();
                        Vector clientes = tn_c.pesquisarTodos();
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                        </tr>   
                        <%
                            for (int i = 0; i < clientes.size(); i++) {
                                ClientesDO cliente = (ClientesDO) clientes.elementAt(i);
                        %>
                        <tr>
                            <td><%= cliente.getNome()%></td>
                            <td><a href=OperadorSistema_gerarOrdemPagamento.jsp?action=calcularValorCliente&id=<%=cliente.getId()%>>Calcular</a></td>                   
                        </tr>       
                        <%
                            }

                        %>
                    </table>
                </form>
                <% }
                    else if (null != request.getParameter("estacionamento")) {
                        Estacionamento tn_e = new Estacionamento();
                        Vector estacionamentos = tn_e.pesquisarTodos();
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                        </tr>   
                        <%
                            for (int i = 0; i < estacionamentos.size(); i++) {
                                EstacionamentoDO estacionamento = (EstacionamentoDO) estacionamentos.elementAt(i);
                        %>
                        <tr>
                            <td><%= estacionamento.getNome()%></td>
                            <td><a href=OperadorSistema_gerarOrdemPagamento.jsp?action=calcularValorEstacionamento&id=<%=estacionamento.getId()%>>Calcular</a></td>                   
                        </tr>       
                        <%
                            }

                        %>
                    </table>
                </form>
                <%} else if (request.getParameter("action").equals("calcularValorPosto")) {
                    int posto_id = Integer.parseInt(request.getParameter("id"));
                    Consumo_de_Combustivel tn_consumo = new Consumo_de_Combustivel();
                    Vector consumos = tn_consumo.pesquisarPorPostoID(posto_id);
                    Posto tn_p = new Posto();
                    PostoDO posto = tn_p.buscar(posto_id);
                    
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post"> 
                        <%
                    float soma = 0;
                    for (int i = 0; i < consumos.size(); i++) {
                                Consumo_de_CombustivelDO consumo = (Consumo_de_CombustivelDO) consumos.elementAt(i);
                                soma += consumo.getPrecoTotal();
                        
                        }
                        Operacoes_de_Caixa tn_op = new Operacoes_de_Caixa();
                        Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
                        operacao.setUsuarioID(posto.getUsuariosID());
                        operacao.setValorDoPagamento(soma);
                        operacao.setEstado("Aberto");
                        boolean result;
                        result = tn_op.incluir(operacao);
                        if(result){
                        %>
                        Incluido nas operações de caixa
                        <% } else {
                        %>
                        Ocorreu algum erro.
                        <% }
                        %>
                </form>
                <% } else if (request.getParameter("action").equals("calcularValorEstacionamento")) {
                    int estacionamento_id = Integer.parseInt(request.getParameter("id"));
                    Estacionamento tn_e = new Estacionamento();
                    EstacionamentoDO estacionamento = tn_e.buscar(estacionamento_id);
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post"> 
                        <%
                    float soma = estacionamento.getVagas()*(float)50.00;
                        Operacoes_de_Caixa tn_op = new Operacoes_de_Caixa();
                        Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
                        operacao.setUsuarioID(estacionamento.getUsuario_Id());
                        operacao.setValorDoPagamento(soma);
                        operacao.setEstado("Aberto");
                        boolean result;
                        result = tn_op.incluir(operacao);
                        if(result){
                        %>
                        Incluido nas operações de caixa
                        <% } else {
                        %>
                        Ocorreu algum erro.
                        <% }
                        %>
                </form>
                <% } else if (request.getParameter("action").equals("calcularValorCliente")) {
                    int estacionamento_id = Integer.parseInt(request.getParameter("id"));
                    Estacionamento tn_e = new Estacionamento();
                    EstacionamentoDO estacionamento = tn_e.buscar(estacionamento_id);
                %>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post"> 
                        <%
                    float soma = estacionamento.getVagas()*(float)50.00;
                        Operacoes_de_Caixa tn_op = new Operacoes_de_Caixa();
                        Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
                        operacao.setUsuarioID(estacionamento.getUsuario_Id());
                        operacao.setValorDoPagamento(soma);
                        operacao.setEstado("Aberto");
                        boolean result;
                        result = tn_op.incluir(operacao);
                        if(result){
                        %>
                        Incluido nas operações de caixa
                        <% } else {
                        %>
                        Ocorreu algum erro.
                        <% }
                        %>
                </form>
                <% } %>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
