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
                            <td>Horário da Reserva</td>
                            <td><input type="date" name="horario de reserva" value=<%= reserva.getHorarioDeRetirada()%> />
                        </tr>
                        <tr>
                            <td>Estacionamento</td>
                            <td><select name="selectName" onchange="goto_URL(this.form.selectName)">
                                    <option selected disabled><%=estacionamento.getNome()%></option>
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
                            <td><select name="selectName2" onchange="goto_URL(this.form.selectName)">
                                    <option selected disabled><%=veiculos.getPlaca()%></option>
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
                    <table>
                        <tr>
                            <td><strong>Modelo</strong></td>
                            <td><strong>Marca</strong></td>
                            <td><strong>Ano</strong></td>
                            <td><strong>Opcionais</strong></td>
                            <td><strong>Placa</strong></td>
                        </tr>
                        <%
                            for (int i = 0; i < veiculo.size(); i++) {
                                classes.data.VeiculosDO v = (classes.data.VeiculosDO) veiculo.elementAt(i);
                                classes.data.ModelosDO modelo = tm.buscar(v.getModeloID());

                                %> 
                                <tr>
                            <td><%=modelo.getModelo()%></td>
                            <td><%=modelo.getMarca()%></td>
                            <td><%=modelo.getAno()%></td>
                            <td>
                            <%
                            if(v.getArCondicionado()==true){
                                %>
                                Ar condicionado;
                                <%
                            }
                            if(v.getCambioAutomatico()==true){
                                %>
                                Cambio Automatico;
                                <%
                            }
                            if(v.getDirecaoHidraulica()==true){
                                %>
                                Direçao Hidráulica;
                                <%
                            }
                            if(v.getFreioABS()==true){
                                %>
                                Freio ABS;
                                <%
                            }
                            if(v.getGPS()==true){
                                %>
                                GPS;
                                <%
                            }
                            %>
                            </td>
                            <td><%=v.getPlaca()%></td>
                            </tr>
                        <%                                        } // for
                        %>
                    </table>

                    <input type="submit" name="atualizar" value="atualizar" />
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
                        String DataDeReserva = request.getParameter("data de reserva");
                        String HorarioDeRetirada = request.getParameter("horario de reserva");
                        int ModeloID = Integer.parseInt(request.getParameter("modelo"));
                        int EstacionamentoID = Integer.parseInt(request.getParameter("estacionamento"));
                        int id = Integer.parseInt(request.getParameter("id"));
                        classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                        classes.data.ReservasDO reservas = new classes.data.ReservasDO();
                        try {
                            SimpleDateFormat hora = new SimpleDateFormat("hh:mm:ss");
                            SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd");
                            reservas.setDataDeReserva(data.parse(DataDeReserva));
                            reservas.setHorarioDeRetirada(hora.parse(HorarioDeRetirada));
                        } catch (ParseException e) {
                        }

                        reservas.setModeloID(ModeloID);
                        reservas.setEstacionamentoID(EstacionamentoID);
                        reservas.setID(id);
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
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form  id="contentRight" action="./Cliente_alterarReserva.jsp" method="post">
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
