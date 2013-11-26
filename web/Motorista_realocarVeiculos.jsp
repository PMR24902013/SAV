<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realocar Veículos</title>
        <%@ include file="headerMotorista.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.text.*" %>
        <%@ page import="classes.transacoes.*"  %>
        <%@ page import="classes.data.*" %>

        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <%  String action = request.getParameter("action");
                    if (null == action) {
                        action = "showSearchForm";
                        if (null == request.getParameterValues("selecao")) {
                %>
                <form id="contentRight" action="./Motorista_realocarVeiculos.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                        classes.transacoes.Estacionamento listaEstacionamentos = new classes.transacoes.Estacionamento();
                        classes.data.EstacionamentoDO listagemEstacionamentos = new classes.data.EstacionamentoDO();
                        listagemEstacionamentos = listaEstacionamentos.buscar(1);
                    %>
                    Escolha o estacionamento em que se encontra o veículo atualmente.
                    <table>
                        <tr>
                            <td>Nome Do Estacionamento</td>
                            <td><select id="selecionaEstacao" name="selecionaEstacionamento">
                                    <option selected value="null">Selecione o nome da estação</option>
                                    <% for (int i = 1; listagemEstacionamentos != null; i++) {
                                    %>
                                    <option value="<%=listagemEstacionamentos.getId()%>"><%=listagemEstacionamentos.getNome()%></option>
                                    <% listagemEstacionamentos = listaEstacionamentos.buscar(i);
                                        }
                                    %>
                                </select>
                        </tr>
                        <tr>
                            <td><input type="submit" name="selecao" value="Selecionar"/>
                            <td><input type="submit" name="cancelarProcura" value="Cancelar"/>
                        </tr>
                    </table>
                </form>
                <%}
                    }
                    if (request.getParameter("cancelarProcura") != null) {
                        String redirectURL = "./Motorista_menu.html";
                        response.sendRedirect(redirectURL);
                    }
                    if (null != request.getParameterValues("selecao") && request.getParameter("selecionaEstacionamento").equals("null")) {
                %>
                Selecione um estacionamento!
                <form action="./Motorista_realocarVeiculos.jsp">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%
                    }
                    if (null != request.getParameter("selecao") && !request.getParameter("selecionaEstacionamento").equals("null")) {
                        int IDEstacionamento = Integer.parseInt(request.getParameter("selecionaEstacionamento"));
                        classes.data.VeiculosDO veiculo = new classes.data.VeiculosDO();
                        classes.data.ModelosDO modelo = new classes.data.ModelosDO();
                        classes.transacoes.Veiculos buscaVeiculo = new classes.transacoes.Veiculos();
                        classes.transacoes.Modelos buscaModelo = new classes.transacoes.Modelos();
                        Vector listaVeiculos = buscaVeiculo.buscarPorEstacionamento(IDEstacionamento);

                %>
                <form id="contentRight" action="./Motorista_realocarVeiculos.jsp" method="post">
                    <table>
                        <tr>
                            <td>Placa</td>
                            <td>Modelo</td>
                            <td>Marca</td>
                        </tr>

                        <%                           for (int i = 0; i < listaVeiculos.size(); i++) {
                                veiculo = (VeiculosDO) listaVeiculos.get(i);
                                modelo = buscaModelo.buscar(veiculo.getModeloID());
                        %>
                        <tr>
                            <td><%=veiculo.getPlaca()%></td>
                            <td><%=modelo.getModelo()%></td>
                            <td><%=modelo.getMarca()%></td>
                            <td><a href=Motorista_realocarVeiculos.jsp?action=showEditForm&id=<%= veiculo.getId()%>>Realocar</a>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td><input type="submit" name="cancelarRealocar" value="Cancelar"/>
                        </tr>
                    </table>
                </form>
                <%
                    }

                    if (action.equals("showEditForm")) {
                        classes.data.VeiculosDO veiculoRealocado = new classes.data.VeiculosDO();
                        classes.transacoes.Veiculos buscaVeiculo = new classes.transacoes.Veiculos();
                        veiculoRealocado = buscaVeiculo.buscar(Integer.parseInt(request.getParameter("id")));
                        classes.transacoes.Estacionamento listaEstacionamentos = new classes.transacoes.Estacionamento();
                        classes.data.EstacionamentoDO listagemEstacionamentos = new classes.data.EstacionamentoDO();
                        listagemEstacionamentos = listaEstacionamentos.buscar(1);
                        if (request.getParameter("cancelarRealocar") == null && request.getParameter("selecaoDestino") == null) {
                %>

                <form id="contentRight" action="#" method="post">
                    Escolha o estacionamento destino.
                    <table>
                        <tr>
                            <td>Nome Do Estacionamento</td>
                            <td><select id="selecionaEstacaoDestino" name="selecionaEstacionamentoDestino">
                                    <option selected value="null">Selecione o nome da estação</option>
                                    <% for (int i = 1; listagemEstacionamentos != null; i++) {
                                    %>
                                    <option value="<%=listagemEstacionamentos.getId()%>"><%=listagemEstacionamentos.getNome()%></option>
                                    <% listagemEstacionamentos = listaEstacionamentos.buscar(i);
                                        }
                                    %>
                                </select>
                        </tr>
                        <tr>
                            <td><input type="submit" name="selecaoDestino" value="Selecionar Estacionamento"/>
                            <td><input type="submit" name="cancelarRealocar" value="Cancelar"/>
                        </tr>
                    </table>
                </form>
                <%}
                    if (request.getParameter("cancelarRealocar") != null) {
                        String redirectURL = "./Motorista_menu.html";
                        response.sendRedirect(redirectURL);
                    }

                    if (request.getParameter("selecaoDestino") != null) {
                        int estacionamentoID = Integer.parseInt(request.getParameter("selecionaEstacionamentoDestino"));
                        veiculoRealocado.setEstacionamentoID(estacionamentoID);
                        if (buscaVeiculo.realocar(veiculoRealocado)) {
                %>
                Transação realizada com sucesso!
                <form id="contentRight" action="./Motorista_menu.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%} else {
                %>
                Erro ao atualizar informações           
                <form id="contentRight" action="./Motorista_realocarVeiculos.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%
                            }
                        }
                    }

                %>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
