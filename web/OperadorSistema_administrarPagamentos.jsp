<%-- 
    Document   : OperadorSistema_administrarPagamentos
    Created on : 12/11/2013, 08:59:00
    Author     : Flavio Jose
    Descriçao  : O operador do sistema avalia os pagamentos
    Entradas   : A primeira tela busca os cadastros em estado "Aberto".
                 A segunda tela exibe os dados do pagamento e a opção de Validar
                 ou rejeitar o Pagamento.
    Saída      : O sistema muda ou nao os dados e avisa o operador.
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Pagamentos</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>

        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">

                <! ------------------------------------------------------------------->
                <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

                <%
                    String action = request.getParameter("action");
                    if (null == action) {
                        action = "showSearchForm";
                %>

                <form id="contentRight" action="./OperadorSistema_administrarPagamentos.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                    %>

                    <%
                        classes.transacoes.Operacoes_de_Caixa tn = new classes.transacoes.Operacoes_de_Caixa();
                        String estado = "Aberto";
                        Vector pagamentos = tn.buscarPorEstado(estado);
                        if (((pagamentos == null) || (pagamentos.size() == 0))) {
                            // avisar usuario que nao ha' reserva
                    %>
                    <form id="contentRight" action="./OperadorSistema_menu.jsp" method="post">
                        Nenhum pagamento em aberto.
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>
                    <%     } else {
                    %>
                    <table>
                        <tr>
                            <td>Cliente</td>
                            <td>Data </td>
                            <td>Valor </td>
                        </tr>
                        <%           for (int i = 0; i < pagamentos.size(); i++) {
                                classes.data.Operacoes_de_CaixaDO op = (classes.data.Operacoes_de_CaixaDO) pagamentos.elementAt(i);
                                classes.transacoes.Clientes tn_c = new classes.transacoes.Clientes();
                                int usuario = op.getUsuarioID();
                                classes.data.ClientesDO cliente = tn_c.buscarPorUsuarioID(usuario);
                        %>              <tr>
                            <td><%=cliente.getNome()%></td>
                            <td><%= op.getDataDoPagamento()%></td>
                            <td><%= op.getValorDoPagamento()%></td>
                            <td><a href=OperadorSistema_administrarPagamentos.jsp?action=updateStatusPagamento&id=<%= op.getID()%>> Validar pagamento</a>
                        </tr>        
                        <%           } // for i Cliente     
                        %>       
                        <td></td>
                        <td></td>
                        <td><form id="contentRight" action="./OperadorSistema_menu.html" method="post">
                                <input type="submit" name="cancelar" value="cancelar" />
                            </form>
                    </table>   
                </form>         
                <%     } // reservas retornados
                    }
                %>

                <! ------------------------------------------------------------------->

                <!--   atualizar valores -->
                <%
                    if (action.equals("updateStatusPagamento")) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        classes.data.Operacoes_de_CaixaDO op = new classes.data.Operacoes_de_CaixaDO();
                        classes.transacoes.Operacoes_de_Caixa tn = new classes.transacoes.Operacoes_de_Caixa();
                        boolean result = false;
                        try {
                            op = tn.buscar(id);
                            op.setEstado("Pago");
                            result = tn.atualizar(op);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form id="contentRight" action="./OperadorSistema_administrarPagamentos.jsp" method="post">
                    Pagamento Atualizado
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                <form id="contentRight" action="./OperadorSistema_administrarPagamentos.jsp" method="post">
                    Erro ao atualizar pagamento
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
            } // updateStatusPagamento
%>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
