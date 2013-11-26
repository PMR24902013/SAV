<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="headerCliente.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">


                <% String user = (String) session.getAttribute("user_name");//pega o nome do user atual
                    Usuarios tn = new Usuarios();
                    Vector ps = tn.pesquisar(user);// procura ele na tabela
                    UsuariosDO useratual = new UsuariosDO();
                    if (ps == null || ps.size() == 0) {

                %> 
                <form id="contentRight" action="Cliente_menu.jsp">
                    Usuario naõ encontrado 
                </form>
                <%            }

                    useratual = (UsuariosDO) ps.get(0);
                    Reservas op = new Reservas();
                    Vector reservas = new Vector();
                    Clientes tf = new Clientes();

                    ClientesDO clienteatual = new ClientesDO();
                    clienteatual = tf.buscarPorUsuarioID(useratual.getId());// procura ele na tabela
                    reservas = op.pesquisarPorCliente(clienteatual.getId());
                    if (ps == null || ps.size() == 0) {

                %> 
                <form  id="contentRight" action="Cliente_menu.jsp">
                    Deu problema na pesquisa de operacao 
                </form>
                <%            }
                %>

                <form  id="contentRight" action="Cliente_visualizarHistorico.jsp" method="post">
                    <table>
                        <thead>
                            <tr>
                                <th><strong>Codigo da Reserva</strong></th>
                                <th><strong>Data da Reserva</strong></th>
                                <th><strong>Horário da Retirada</strong></th>
                                <th><strong>Estado</strong></th>
                                <th><strong>Codigo do veiculo</strong></th>
                                <th><strong>Valor</strong></th>
                            </tr>
                        </thead>

                        <tbody>



                            <%
                                for (int i = 0; i < reservas.size(); i++) {
                                    Operacoes_de_Caixa oper = new Operacoes_de_Caixa();
                                    Operacoes_de_CaixaDO operdo = new Operacoes_de_CaixaDO();
                                    ReservasDO r = (ReservasDO) (reservas.get(i));
                                    int opid = (r).getOperacoesDeCaixaID();
                                    operdo = oper.buscar(opid);
                            %>   

                            <tr>
                                <td><%= ((ReservasDO) (reservas.get(i))).getID()%></td>
                                <td><%= ((ReservasDO) (reservas.get(i))).getDataDeReserva()%></td>
                                <td><%= ((ReservasDO) (reservas.get(i))).getHorarioDeRetirada()%></td> 
                                <td><%= ((ReservasDO) (reservas.get(i))).getEstado()%></td> 
                                <td><%= ((ReservasDO) (reservas.get(i))).getVeiculoID()%></td>
                                <td><%= operdo.getValorDoPagamento()%></td>
                            </tr>
                            <% }%>


                        </tbody>

                    </table>
                </form>


                <div id="contentLeft"></div>
                <div class="clear"> </div>

            </div>
        </div>
    </body>
</html>
