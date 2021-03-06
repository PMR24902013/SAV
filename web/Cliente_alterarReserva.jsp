<%-- 
    Document   : Cliente_alterarReserva
    Created on : 09/11/2013, 21:54:19
    Author     : Bruna Louzada
    Descriçao  : O cliente altera dados da reserva de veículos
    Entradas   : A primeira tela busca as reservas em estado "aguardo"
                   do cliente e exibe por data.
                 A segunda tela exibe todos os dados da reserva escolhida
                   e permite as alterações dos dados.
    Saída      : O sistema altera os dados e avisa o cliente.
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Reserva</title>
        <%@ include file="headerCliente.html" %>


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
                        action = "showSearchResults";
                %>

                <%
                    // VERIFICACAO MANUAL DO LOGIN
                    if (session.getAttribute("user_name") == null) {
                        pageContext.forward("index.jsp");
                    }

                    classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                    classes.transacoes.Usuarios tr = new classes.transacoes.Usuarios();
                    classes.transacoes.Estacionamento te = new classes.transacoes.Estacionamento();
                    String nome = (String) session.getAttribute("user_name");
                    int idCliente = tr.buscarID(nome);
                    String estado = "aguardando";
                    Vector reserva = tn.pesquisar(idCliente, estado);
                    if ((reserva == null) || (reserva.size() == 0)) {
                        // avisar usuario que nao ha' reserva
                %>
                <p  id="contentRight">
                    Nenhuma reserva em aguardo foi encontrada
                </p>
                <%     } else {
                %>
                <form  id="contentRight" action="./Cliente_alterarReserva.jsp" method="post">
                    <table>
                        <tr>
                            <td>Data </td>
                            <td>Origem </td>
                        </tr>
                        <%           for (int i = 0; i < reserva.size(); i++) {
                                classes.data.ReservasDO r = (classes.data.ReservasDO) reserva.elementAt(i);
                                String nomeEst = te.buscarNome(r.getEstacionamentoID());
                        %>              <tr>
                            <td><%= r.getDataDeReserva()%></td>
                            <td><%= nomeEst%></td>
                            <td><a href=Cliente_alterarReserva.jsp?action=showEditForm&id=<%= r.getID()%>>Alterar</a>
                        </tr>        
                        <%           } // for i      
                        %>
                    </table>            
                </form>
                <%     } // reservas retornados
                    } // pesquisar
                %>

                <! ------------------------------------------------------------------->
                <!--   mostra formulario para atualizacao                           -->
                <%     if (action.equals("showEditForm")) {
                        int id = Integer.parseInt(request.getParameter("id"));

                        classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                        classes.transacoes.Modelos tm = new classes.transacoes.Modelos();
                        classes.transacoes.Veiculos tv = new classes.transacoes.Veiculos();
                        classes.transacoes.Estacionamento te = new classes.transacoes.Estacionamento();

                        classes.data.ReservasDO reserva = tn.buscar(id);
                        int estacionamentoID = reserva.getEstacionamentoID();
                        int veiculoID = reserva.getVeiculoID();
                        classes.data.EstacionamentoDO estacionamento = te.buscar(estacionamentoID);
                        classes.data.VeiculosDO veiculos = tv.buscar(veiculoID);
                        Vector todosEstacionamento = te.pesquisarTodos();
                %>        
                <form  id="contentRight" action="./Cliente_alterarReserva.jsp" method="post">
                    <table>
                        <tr>
                            <td>Data da Reserva</td>
                            <td><input type="date" name="data de reserva" value=<%= reserva.getDataDeReserva()%> />
                        </tr>
                        <tr>
                            <td>Horário da Retirada</td>
                            <td><input type="time" name="horario de reserva" value=<%= reserva.getHorarioDeRetirada()%> />
                        </tr>
                        <tr>
                            <td>Horário da Devolução</td>
                            <td><input type="time" name="horario de devolucao" value=<%= reserva.getHorarioDeDevolucao()%> />
                        </tr>
                        <tr>
                            <td>Estacionamento</td>
                            <td><select name="loadEstacionamento">
                                    <option><%=estacionamento.getNome()%></option>
                                    <%
                                        for (int i = 0; i < todosEstacionamento.size(); i++) {
                                            classes.data.EstacionamentoDO e = (classes.data.EstacionamentoDO) todosEstacionamento.elementAt(i);

                                    %> 
                                    <option><%= e.getNome()%></option>   
                                    <%
                                        } // for
                                    %>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Placa</td>
                            <td><select name="loadPlaca">
                                    <option><%=veiculos.getPlaca()%></option>
                                    <%
                                        Vector veiculo = tv.buscarPorEstacionamento(estacionamentoID);
                                        for (int i = 0; i < veiculo.size(); i++) {
                                            classes.data.VeiculosDO v = (classes.data.VeiculosDO) veiculo.elementAt(i);

                                    %> 
                                    <option><%= v.getPlaca()%></option>   
                                    <%
                                        } // for
                                    %>
                                </select></td>
                        </tr>
                    </table>
                    Não sabe qual veículo escolher? Confira nossa <a href="./Cliente_visualizarFrota.jsp">frota disponível</a>!<br>
                    <input type="submit" name="atualizar" value="atualizar" />
                    <input type="submit" name="cancelar" value="desistir" />
                    <input type="hidden" name="id" value=<%= id%> /> 
                    <input type="hidden" name="action" value="updateValues" />
                </form>
                <%
                    } // showEditForm
                %>
                <! ------------------------------------------------------------------->
                <!--   atualizar valores -->
                <%
                    if (action.equals("updateValues")) {
                        String Placa = request.getParameter("loadPlaca");
                        String DataDeReserva = request.getParameter("data de reserva");
                        String HorarioDeRetirada = request.getParameter("horario de reserva");
                        String HorarioDeDevolucao = request.getParameter("horario de devolucao");

                        classes.transacoes.Veiculos tv = new classes.transacoes.Veiculos();
                        classes.data.VeiculosDO veiculos = new classes.data.VeiculosDO();

                        veiculos = tv.buscarPorPlaca(Placa);
                        classes.transacoes.Usuarios tr = new classes.transacoes.Usuarios();

                        String nome = (String) session.getAttribute("user_name");
                        int idCliente = tr.buscarID(nome);
                        classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                        classes.data.ReservasDO reservas = new classes.data.ReservasDO();

                        int id = Integer.parseInt(request.getParameter("id"));

                        try {
                            SimpleDateFormat hora = new SimpleDateFormat("hh:mm");
                            SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd");
                            reservas.setDataDeReserva(data.parse(DataDeReserva)); 
                            reservas.setHorarioDeRetirada(hora.parse(HorarioDeRetirada));
                            reservas.setHorarioDeDevolucao(hora.parse(HorarioDeDevolucao));
                        } catch (ParseException e) {
                        }
                        reservas.setVagaID(veiculos.getVagaID());
                        reservas.setModeloID(veiculos.getModeloID());
                        reservas.setVeiculoID(veiculos.getId());
                        reservas.setEstacionamentoID(veiculos.getEstacionamentoID());
                        reservas.setClienteID(idCliente);
                        reservas.setID(id);
                        reservas.setEstado("aguardando");


                        if (null != request.getParameter("cancelar")) {
                            reservas.setEstado("cancelado");
                            reservas.setClienteID(0);
                        }

                        boolean result = false;
                        try {
                            result = tn.atualizar(reservas);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%                   }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form  id="contentRight" action="./Cliente_menu.html" method="post">
                    Transação realizada com sucesso!
                </form>
                <%     } else {
                %>
                <form  id="contentRight" action="./Cliente_alterarReserva.jsp" method="post">
                    Erro ao atualizar dados do contato
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    } // updateValues
%>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
</body>
</html>
