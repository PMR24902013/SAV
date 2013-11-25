<%-- 
    Document   : Cliente_retirarVeiculo
    Created on : Nov 25, 2013, 9:15:21 AM
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retirar Veículo</title>
        <%@ include file="headerCliente.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@ page import="classes.transacoes.*"  %>
        <%@ page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <form id="contentRight" action="./Cliente_retirarVeiculo.jsp" method="post">
        <%
            if (null == request.getParameter("selecao") && request.getParameter("cancelarProcura") == null && request.getParameter("retirar") == null) {
                // VERIFICACAO MANUAL DO LOGIN
                if (session.getAttribute("user_name") == null) {
                    pageContext.forward("index.jsp");
                }
                String user = (String)session.getAttribute("user_name");
                classes.transacoes.Reservas listaReservas = new classes.transacoes.Reservas();
                classes.transacoes.Usuarios buscaCliente = new classes.transacoes.Usuarios();
                int clienteID;
                classes.data.ReservasDO listagemReservas = new classes.data.ReservasDO();
                
                clienteID = buscaCliente.buscarID(user);
                String estado;
                Vector vetorReservas = listaReservas.pesquisar(clienteID, "aguardando");
        %>
        
        Escolha a reserva.
        <table>
            <tr>
                <td>Número da Reserva</td>
                <td><select id="selecionaReserva" name="selecionaReserva">
                        <option selected value="null" disable>Selecione o número da reserva</option>
                        <% for (int i = 0; i<vetorReservas.size(); i++) {
                            listagemReservas = (ReservasDO)vetorReservas.get(i);
                            estado=listagemReservas.getEstado(); 
                            if(estado.equals("aguardando")){ 
                        %>
                        <option value="<%=listagemReservas.getID()%>"><%=listagemReservas.getID()%></option>
                        <% }
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
    <%
        }
            if(request.getParameter("cancelarProcura") != null){
                    String redirectURL = "./Cliente_menu.html";
                    response.sendRedirect(redirectURL);
            }
            if(request.getParameter("selecao")!=null){
                int reservaID = Integer.parseInt(request.getParameter("selecionaReserva"));
                session.setAttribute("reservaID", request.getParameter("selecionaReserva")); 
                classes.transacoes.Reservas buscaReserva = new classes.transacoes.Reservas();
                classes.transacoes.Estacionamento buscaEstacionamento = new classes.transacoes.Estacionamento();
                classes.transacoes.Veiculos buscaVeiculo = new classes.transacoes.Veiculos();
                classes.transacoes.Modelos buscaModelo = new classes.transacoes.Modelos();
                classes.data.ReservasDO reserva = new classes.data.ReservasDO();
                classes.data.ModelosDO modelo = new classes.data.ModelosDO();
                classes.data.EstacionamentoDO estacionamento = new classes.data.EstacionamentoDO();
                classes.data.VeiculosDO veiculo = new classes.data.VeiculosDO();
                reserva = buscaReserva.buscar(reservaID);  
                int IDnomeEstacionamento = reserva.getEstacionamentoID();
                int IDveiculo = reserva.getVeiculoID();
                estacionamento = buscaEstacionamento.buscar(IDnomeEstacionamento);
                veiculo = buscaVeiculo.buscar(IDveiculo);
                modelo = buscaModelo.pesquisarModelo(veiculo.getModeloID());
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date();
                Date diaAntes = new Date(date.getYear(), date.getMonth(), date.getDate()-1, 0, 0, 0);
                Date diaDepois = new Date(date.getYear(), date.getMonth(), date.getDate()+1, 0, 0, 0);
                Date hora = new Date(70, 0, 1, date.getHours(), date.getMinutes(), date.getSeconds());  
                
    %>
    <form id="contentRight" action="./Cliente_retirarVeiculo.jsp" method="post">
        Informações da reserva de <%=reserva.getDataDeReserva()%>
        <table>
            <tr>
                <td>Horário da Retirada:</td>
                <td><%=reserva.getHorarioDeRetirada()%></td>
            </tr>
                <tr>
                <td>Horário de Devolução:</td>
                <td><%=reserva.getHorarioDeDevolucao()%></td>
            </tr>
            <tr>
                <td>Estacionamento:</td>
                <td><%=estacionamento.getNome()%></td>
            </tr>
            <tr>
                <td>Endereço:</td>
                <td><%=estacionamento.getEndereco()%></td>
            </tr>
            <tr>
                <td>Veículo:</td>
                <td><%=modelo.getModelo() + " " + modelo.getMarca()%></td>
            </tr>
            <tr>
                <%if(diaDepois.after(reserva.getDataDeReserva()) && diaAntes.before(reserva.getDataDeReserva()) &&
                        hora.after(reserva.getHorarioDeRetirada()) && hora.before(reserva.getHorarioDeDevolucao())) {%>
                <td><input type="submit" name="retirar" value="Retirar"/>
                <%}else{%>
                <td>A Retirada somente pode ser feita no período estipulado na reserva.</td>
                <%}%>
                <td><input type="submit" name="cancelarRetirada" value="Cancelar"/>
            </tr>
        </table>
    </form>
                <%}
            if(request.getParameter("retirar") != null){
                String Sid = (String)session.getAttribute("reservaID");
                int id = Integer.parseInt(Sid);
                classes.transacoes.Reservas buscaReserva = new classes.transacoes.Reservas(); 
                classes.data.ReservasDO reserva = buscaReserva.buscar(id); 
                reserva.setEstado("Em uso");
                if(buscaReserva.atualizarEstado(reserva)){
                            %>
                
                <form id="contentRight" action="./Motorista_menu.html" method="post">
                    Transação realizada com sucesso!<br>
                    Lembre-se sempre de utilizar o cinto de segurança.<br>
                    Se beber, não dirija.<br>
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                            <%
                }else{ %>
                           
                <form id="contentRight" action="./Cliente_retirarVeiculo.jsp" method="post">
                    Erro ao atualizar informações
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%
            }
            }
            %>
            <div id="contentLeft"></div>    
            <div class="clear"></div>
            </div>
         </div>
</body>
</html>
