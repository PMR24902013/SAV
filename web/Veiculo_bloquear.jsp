<%--
    Document   : Estacionamento_bloquear
    Created on : 24/11/2013, 12:07:51
    Author     : hidden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar veiculo</title>
        <%@include file="headerOpSistema.html"%>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"><div id = "logo"></div></div>
            <div id="tudo">
                <div id="contentRight">



                    <%
                        Veiculos tn = new Veiculos();
                        Vector todosVeiculos = tn.pesquisarTodos();// procura ele na tabela
                        String actionanterior = "nada";
                        String action = "nada";
                        if (todosVeiculos == null || todosVeiculos.size() == 0) {

                    %> 
                    <form id="contentRight" action="Veiculos_menu.jsp">
                        Não há veículos cadastrados!
                    </form>
                    <%            }
                        if (action.equals("confirmar") != true) {
                    %>


                    <form  id="contentRight" action="Veiculo_bloquear.jsp" method="post">
                        <table>
                            <thead>
                                <tr>
                                    <th><strong>Placa</strong></th>
                                    <th><strong>Veículo</strong></th>
                                    <th><strong>Localização</strong></th>
                                    <th><strong>Estado</strong></th>
                                </tr>
                            </thead>

                            <tbody>



                                <%
                                    float soma = 0;
                                    for (int i = 0; i < todosVeiculos.size(); i++) {
                                        Modelos m = new Modelos();
                                        ModelosDO modeloDoVeiculo = new ModelosDO();
                                        int idModelo = ((VeiculosDO) (todosVeiculos.get(i))).getModeloID();
                                        modeloDoVeiculo = m.buscar(idModelo);
                                        Estacionamento local = new Estacionamento();
                                        VeiculosDO v = (VeiculosDO) (todosVeiculos.get(i));
                                        int idest = ((VeiculosDO) (todosVeiculos.get(i))).getEstacionamentoID();
                                        EstacionamentoDO localDoVeiculo = local.buscar(idest);
                                    int idv = ((VeiculosDO) (todosVeiculos.get(i))).getId();%>   

                                <tr>
                                    <td><%= ((VeiculosDO) (todosVeiculos.get(i))).getPlaca()%></td>
                                    <td><%= modeloDoVeiculo.getModelo()%></td>
                                    <td><%= localDoVeiculo.getNome()%></td>
                                    <td><%= ((VeiculosDO) (todosVeiculos.get(i))).getEstado()%></td>
                                    <td><a href=Veiculo_bloquear.jsp?action=showEditForm&id=<%= idv%>>Selecionar</a>
                                </tr>

                                <%}%> 

                            </tbody>

                        </table>
                    </form>


                    <form  id="contentRight" action="OperadorSistema_menu.html" method="post">


                        <input type="submit" name="Voltar" value="Voltar" />
                    </form>

                    <%
                        }
                        action = (String) (request.getParameter("action"));

                        if (null == action) {
                            action = "nada";
                        }
                        if (action.equals("showEditForm")) {
                            int id = Integer.parseInt(request.getParameter("id"));
                            VeiculosDO veiculoAtual = tn.buscar(id);
                            String estado = veiculoAtual.getEstado();
                            Modelos m = new Modelos();
                            ModelosDO modeloDoVeiculo = new ModelosDO();
                            int idModelo = veiculoAtual.getModeloID();

                            modeloDoVeiculo = m.buscar(idModelo);
                            if (estado.equals("bloqueado")) {
                                actionanterior = "desbloqueia";

                    %>

                    Deseja desbloquear o veículo <%= modeloDoVeiculo.getModelo()%>?


                    <form  id="contentRight" action="Veiculo_bloquear.jsp?action=confirmar&actionanterior=desbloqueia&iddoveiculoatual=<%= veiculoAtual.getId()%>" method="post">


                        <input type="submit" name="Confirmar" value="Confirmar" />
                    </form>
                    <%} else {
                        actionanterior = "bloqueia";
                    %>

                    Deseja bloquear o veículo <%= modeloDoVeiculo.getModelo()%>?


                    <form  id="contentRight" action="Veiculo_bloquear.jsp?action=confirmar&actionanterior=bloqueia&iddoveiculoatual=<%= veiculoAtual.getId()%>" method="post">


                        <input type="submit" name="Confirmar" value="Confirmar" />
                    </form>

                    <%

                            }
                        }

                        action = (String) (request.getParameter("action"));
                        actionanterior = (String) (request.getParameter("actionanterior"));
                        if (null == action) {
                            action = "nada";
                        }
                        if (action.equals("confirmar")) {

                            if (actionanterior.equals("bloqueia")) {

                                int idv = Integer.parseInt(request.getParameter("iddoveiculoatual"));
                                VeiculosDO veiculoAtual = tn.buscar(idv);
                                veiculoAtual.setEstado("bloqueado");
                                tn.atualizar(veiculoAtual);


                    %>    Carro bloqueado com sucesso!<%                        response.sendRedirect("Veiculo_bloquear.jsp");
                        }
                        if (actionanterior.equals("desbloqueia")) {

                            int idv = Integer.parseInt(request.getParameter("iddoveiculoatual"));
                            VeiculosDO veiculoAtual = tn.buscar(idv);
                            veiculoAtual.setEstado("disponivel");
                            tn.atualizar(veiculoAtual);
                    %>    Carro desbloqueado com sucesso!<%
                                                 response.sendRedirect("Veiculo_bloquear.jsp");
                                             }
                                         }
                    %>
                </div>
                <div id="contentLeft"></div>
                <div class="clear"> </div>

            </div>
        </div>
    </body>
</html>
