<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado do Veículo</title>
        <%@ include file="headerManutencao.html" %>
        <%@ page import="classes.data.*" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.*"%>
        <%@ page import="java.sql.*"%>
        
        <%
            Veiculos vTransacao = new Veiculos();
            Vector veiculos = vTransacao.pesquisarTodos();
        %>
        
        <script>
            
            function onPlacaSelect(){
                var placa = document.forms[0].placa.value;
                <%
                    for(int i=0; i<veiculos.size(); i++){
                        %>if(placa == <%=((VeiculosDO)veiculos.elementAt(i)).getId()%>){
                                document.getElementById("quilometragem").value = 
                                    <%=((VeiculosDO)veiculos.elementAt(i)).getQuilometragem()%>;
                                if("<%=((VeiculosDO)veiculos.elementAt(i)).getEstado()%>" == "Manutencao")
                                    document.getElementById("estado").checked = true;
                                else document.getElementById("estado").checked = false;
                        }
                        <%
                    }
                %>
            }
            
        </script>
        
    </head>
    <body>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <div id="contentRight">
                    <form id="content" method="post">
                        <%
                            if(null != request.getParameter("alterarQuilometragem")){
                                int idDesejado = Integer.parseInt(request.getParameter("placa"));
                                VeiculosDO veiculoDesejado = new VeiculosDO();
                                for(int i=0; i < veiculos.size(); i++){
                                    if(((VeiculosDO)veiculos.elementAt(i)).getId() == idDesejado)
                                        veiculoDesejado = (VeiculosDO)veiculos.elementAt(i);
                                }
                                veiculoDesejado.setQuilometragem(Integer.parseInt(request.getParameter("quilometragem")));
                                vTransacao.atualizar(veiculoDesejado);
                            }
                            if(null != request.getParameter("alterarEstado")){
                                int idDesejado = Integer.parseInt(request.getParameter("placa"));
                                VeiculosDO veiculoDesejado = new VeiculosDO();
                                for(int i=0; i < veiculos.size(); i++){
                                    if(((VeiculosDO)veiculos.elementAt(i)).getId() == idDesejado)
                                        veiculoDesejado = (VeiculosDO)veiculos.elementAt(i);
                                }
                                if(request.getParameter("estado").equals("on"))
                                    veiculoDesejado.setEstado("Manutencao");
                                else
                                    veiculoDesejado.setEstado("Disponivel");
                                vTransacao.atualizar(veiculoDesejado);
                            }
                        %>
                        <table>
                            <tr>
                                <th>Veículo</th>
                                <th>
                                    <select id="placa" name="placa" onchange="onPlacaSelect();">
                                        <option selected="selected" disabled="disabled">Selecione</option>
                                        <%
                                            for(int i=0; i < veiculos.size(); i++){
                                                String placa = ((VeiculosDO)veiculos.elementAt(i)).getPlaca();
                                                int id = ((VeiculosDO)veiculos.elementAt(i)).getId();
                                                %><option value=<%=id%>><%=placa%></option><%
                                            }
                                        %>
                                    </select>
                                </th>
                            </tr>
                            <tr>
                                <th>Quilometragem</th>
                                <th><input id="quilometragem" name="quilometragem"/>
                                <th><input value="Alterar" name="alterarQuilometragem" type="submit"/>
                            </tr>
                            <tr>
                                <th><input id="estado" name="estado" type="checkbox" checked /> Em manutenção
                                <th><input value="Alterar" name="alterarEstado" type="submit" />
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
