<%-- 
    Document   : reservarVeiculo
    Created on : 07/11/2013, 23:17:29
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservar Veículo</title>
        <%@ include file="headerCliente.html" %>
        <%@ page import="classes.data.*"%>
        <%@ page import="classes.transacoes.*"%>
        <%@ page import="java.util.*"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.text.*" %>
        
        <%
            Estacionamento eTransacao = new Estacionamento();
            Veiculos vTransacao = new Veiculos();
            Vector estacionamentos = eTransacao.pesquisarTodos();
            Vector veiculos = vTransacao.pesquisarTodos();
        %>
        
        <script>
            
            var estacionamentoEscolhido;
            
            function onEstacionamentoSelect(chosen){
                var selbox = document.forms[0].carro;
                selbox.options.length = 0;
                estacionamentoEscolhido = chosen;
                <%
                    for (int i = 0; i < veiculos.size(); i++) {
                %>
                    if(estacionamentoEscolhido == <%=((VeiculosDO) veiculos.elementAt(i)).getEstacionamentoID()%>){
                        selbox.options[selbox.options.length] = new Option("<%=((VeiculosDO) veiculos.elementAt(i)).getPlaca()%>",<%=((VeiculosDO) veiculos.elementAt(i)).getModeloID()%>);
                    }
                <%
                }
                %>
            }
            
        </script>
        
    </head>

    <body>
        
        <%
                    if(null != request.getParameter("confirmar")){
                        classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                        classes.data.ReservasDO reservas = new classes.data.ReservasDO();
                        
                        String DataDeReserva = request.getParameter("data");
                        String HorarioDeRetirada = request.getParameter("horarioDeRetirada");
                        String HorarioDeDevolucao = request.getParameter("horarioDeDevolucao");
                        String estacionamento = request.getParameter("estacionamento");
                        String veiculoID = request.getParameter("carro");
                        
                        VeiculosDO veiculo = vTransacao.buscar(Integer.parseInt(veiculoID));

                        int estacionamentoID = Integer.parseInt(estacionamento);
                        Usuarios uTransacao = new Usuarios();
                        Vector usuario = uTransacao.pesquisar((String)session.getAttribute("user_name"));
                        Clientes cTransacao = new Clientes();
                        ClientesDO cliente = cTransacao.buscarPorUsuarioID(((UsuariosDO) usuario.elementAt(0)).getId());
                        int clienteID = cliente.getId();
                        
                        try {
                            SimpleDateFormat hora = new SimpleDateFormat("hh:mm");
                            SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd");
                            reservas.setDataDeReserva(data.parse(DataDeReserva));
                            reservas.setHorarioDeRetirada(hora.parse(HorarioDeRetirada));
                            reservas.setHorarioDeDevolucao(hora.parse(HorarioDeDevolucao));
                        } catch (ParseException e) {
                        }
                        reservas.setOperacoesDeCaixaID(0);
                        reservas.setVeiculoID(Integer.parseInt(veiculoID));
                        reservas.setEstacionamentoID(estacionamentoID);
                        reservas.setClienteID(clienteID);
                        reservas.setModeloID(veiculo.getModeloID());
                        reservas.setVagaID(veiculo.getVagaID());
                        reservas.setEstado("aguardando");

                        Reservas rTransacao = new Reservas();
                        rTransacao.incluir(reservas);
                    }
        %>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
                <div id="contentRight">
                    <form id="content" method="post">
                        <table>
                            <tr>
                                <th>
                                    Estacionamento
                                </th>
                                <th>
                                    <select id="estacionamento" name="estacionamento" onchange="onEstacionamentoSelect(this.options[this.selectedIndex].value);">
                                        <option selected="selected" disabled>Selecione</option>
                                        <%
                                            for (int i = 0; i < estacionamentos.size(); i++) {
                                                String nome = ((EstacionamentoDO) estacionamentos.elementAt(i)).getNome();
                                                int id = ((EstacionamentoDO) estacionamentos.elementAt(i)).getId();
                                        %><option value=<%=id%>><%=nome%></option><%
                                                    }
                                        %>
                                    </select>
                                </th>
                            </th>
                            <tr>
                                <th>
                                    Carro
                                </th>
                                <th>
                                    <select id="carro" name="carro">
                                        <option selected="selected" disabled>Selecione</option>
                                    </select>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Data de retirada
                                </th>
                                <th>
                                    <input id="data" name="data" type="date"/>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Horário de retirada
                                </th>
                                <th>
                                    <input id="horarioDeRetirada" name="horarioDeRetirada" type="time"/>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Horário de devolução
                                </th>
                                <th>
                                    <input id="horarioDeDevolucao" name="horarioDeDevolucao" type="time"/>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <input id="confirmar" name="confirmar" value="Confirmar" type="submit"/>
                                </th>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="contentLeft"></div>
                <div class="clear"></div>
            </div>

        </div>
    </body>
</html>
