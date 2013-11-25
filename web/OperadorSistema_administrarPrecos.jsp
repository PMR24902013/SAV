<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.util.Vector" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="classes.data.*" %>
        <%@ page import="java.util.Date" %>
        <title>Administrar Preços</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <div id="contentRight">
                    <h1>Selecione o veículo a consultar</h1>
                   
                    <table>
                        <tr>
                            <td><strong>Veículo</strong></td>
                            <td><strong>Ano</strong></td>
                        </tr>
                        
                        <%
                            String action = request.getParameter("action");
                            int i = 1;
                            int modeloId;
                            int ano;
                            int veiculoId;
                            String modelo;
                            
                            Precos p = new Precos();
                            PrecosDO precos = new PrecosDO();
                            
                            VeiculosDO veiculos = new VeiculosDO();
                            Veiculos v = new Veiculos();
                            
                            Modelos m = new Modelos();
                            ModelosDO modelos = new ModelosDO();
                            precos = p.buscar(i);
                            
                            while (precos != null){
                                veiculoId = precos.getModeloId();
                                veiculos = v.buscar(veiculoId);
                                modeloId = veiculos.getModeloID();
                                modelos = m.buscar(modeloId);
                                ano = modelos.getAno();
                                modelo = modelos.getModelo();
                                %>
                                <tr>
                                    <td><%=modelo%></td>
                                    <td><%=ano%></td>
                                    <td><a href=OperadorSistema_administrarPrecos.jsp?action=showModeloEditForm&id=<%=modeloId%>>Administrar</a></td>
                                </tr>
                                <%
                                i++;
                                precos = p.buscar(i);
                            }
                            
                            if (action.equals("showEstacionamentoEditForm")) {
                                
                                
                            }
                        %>
                        
                    </table>
                
                </div>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
