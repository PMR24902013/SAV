<%-- 
    Document   : FuncManut_veiculosABuscar
    Created on : 24/11/2013
    Author     : Augusto
    Descriçao  : O funcionario de manuteção procura quais carros precisam ser verificados 
    Entradas   :
    Saída      :
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veiculos a Buscar</title>
        <%@ include file="headerManutencao.html" %>
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

                <form id="contentRight" action="./FuncManut_veiculosABuscar.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                    %>

                    <%
                        classes.transacoes.Manutencao tn = new classes.transacoes.Manutencao();
                        String estado = "Consertando";
                        Vector busca = tn.buscarPorEstado(estado);
                        if (((busca == null) || (busca.size() == 0))) {
                            // avisar usuario que nao ha' veiculos a buscar
                    %>
                   
                    <p>Nenhum veiculo a ser buscado.</p>
                        
                    <%     } else {
                    %>
                    <table>
                        <tr>
                            <td>Veiculo</td>
                            <td>Estacionamento</td>
                            <td>Estado </td>
                        </tr>
                        <%           for (int i = 0; i < busca.size(); i++) {
                                classes.data.ManutencaoDO op = (classes.data.ManutencaoDO) busca.elementAt(i);
                                classes.transacoes.Veiculos tn_u = new classes.transacoes.Veiculos();
                                int usuarioid = op.getVeiculoID();
                                //String tipo = tn_u.buscar(usuarioid);
                                String placa = null;
                                int estacionamentoID;
                                String estacionamentoNome;

                                // classes.transacoes.Veiculos tn_c = new classes.transacoes.Veiculos();
                                classes.data.VeiculosDO carro = tn_u.buscarPorVeiculoID(usuarioid);
                                placa = carro.getPlaca();
                                estacionamentoID = carro.getEstacionamentoID();
                                
                                classes.transacoes.Estacionamento estac = new classes.transacoes.Estacionamento();
                                estacionamentoNome = estac.buscarNome(estacionamentoID);
                                
                                
                                


                        %>              <tr>
                            <td><%=placa%></td>
                            <td><%= estacionamentoNome%></td>
                            <td><a href=FuncManut_veiculosABuscar.jsp?action=updateStatusManutencao&id=<%= op.getId()%>> Veiculo a buscar</a></td>
                            
                        </tr>        
                        <%           } // for i Cliente     
                        %>       
                        <td></td>
                        <td></td>
                    </table>   
                </form>         
                <%     } // reservas retornados
                    }
                %>

                <! ------------------------------------------------------------------->

                <!--   atualizar valores -->
                <%
                    if (action.equals("updateStatusManutencao")) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        classes.data.ManutencaoDO op = new classes.data.ManutencaoDO();
                        classes.transacoes.Manutencao tn = new classes.transacoes.Manutencao();
                        boolean result = false;
                        try {
                            op = tn.buscar(id);
                            op.setEstado("Buscado");
                            result = tn.atualizar(op);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form id="contentRight" action="./FuncManut_veiculosABuscar.jsp" method="post">
                    Veiculo buscado
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                <form id="contentRight" action="./FuncManut_veiculosABuscar.jsp" method="post">
                    Erro ao atualizar estado
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    } // updateStatusPagamento
                %>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
