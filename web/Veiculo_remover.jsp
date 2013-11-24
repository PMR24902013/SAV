<%-- 
    Document   : Veiculo_remover
    Created on : 24/11/2013, 18:34:16
    Author     : Flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover veiculo</title>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
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
                        action = "./Veiculo_remover.jsp";
                %>

                <form id="contentRight" action="Veiculo_remover.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                    %>

                    <%
                        Veiculos tn = new Veiculos();
                        String estado = "Disponivel";
                        Vector veiculos = tn.buscarPorEstado(estado);
                        if (((veiculos == null) || (veiculos.size() == 0))) {
                            // avisar usuario que nao ha' reserva
                    %>
                    <form id="contentRight" action="Veiculo_remover.jsp" method="post">
                        Nenhum veículo pode ser excluído do sistema.
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>
                    <%     } else {
                    %>
                    <table>
                        <tr>
                            <td>Modelo</td>
                            <td>Marca</td>
                            <td>Ano</td>
                            <td>Quilometragem </td>
                            <td>Placa</td>
                        </tr>
                        <%           for (int i = 0; i < veiculos.size(); i++) {
                                System.out.println(i);
                                VeiculosDO veiculo = (VeiculosDO) veiculos.elementAt(i);
                                Modelos tn_mod = new Modelos();
                                int modeloid = veiculo.getModeloID();
                                ModelosDO modelo = tn_mod.pesquisarModelo(modeloid);
                        %>              <tr>
                            <td><%=modelo.getModelo()%></td>
                            <td><%=modelo.getMarca()%></td>
                            <td><%=modelo.getAno()%></td>
                            <td><%=veiculo.getQuilometragem()%></td>
                            <td><%=veiculo.getPlaca()%></td>
                            <td><a href=Veiculo_remover.jsp?action=removerVeiculo&id=<%=veiculo.getId()%>>Remover Veículo</a></td>
                        </tr>        
                        <%           } // for i Cliente     
                        %>       
                        <td><form id="contentRight" action="./OperadorSistema_administrarVeiculos.jsp" method="post">
                                <input type="submit" name="cancelar" value="cancelar" />
                            </form></td>
                    </table>   
                </form>         
                <%     } // reservas retornados
                    }
                %>

                <! ------------------------------------------------------------------->

                <!--   atualizar valores -->
                <%
                    if (action.equals("removerVeiculo")) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        VeiculosDO veiculo = new VeiculosDO();
                        Veiculos tn_v = new Veiculos();
                        boolean result = false;
                        try {
                            veiculo = tn_v.buscar(id);
                            result = tn_v.excluir(veiculo);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form id="contentRight" action="Veiculo_remover.jsp" method="post">
                    Veículo excluído
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                <form id="contentRight" action="Veiculo_remover.jsp" method="post">
                    Erro ao excluir veículo
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    } // removerVeiculo
                %>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>