<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="headerCliente.html" %>
        <%@ page import="classes.data.*" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.*"%>
        <%@ page import="java.sql.*"%>
        
        <style>
            .fixed-size{
                width: 100px;
            }
        </style>
        
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div>
                
            </div>

            <div id="tudo">
                <div id="contentRight">
                    <form id="content" method="post">
                        <%
                            if(null != request.getParameter("concluir")){
                                String placa = request.getParameter("veiculo");
                                Veiculos vTransacao = new Veiculos();
                                VeiculosDO veiculo = vTransacao.buscar(Integer.parseInt(placa));
                                veiculo.setEstado("Disponivel");
                                vTransacao.atualizar(veiculo);
                            }
                        %>
                        <table>
                            <tr>
                                <th>Veículo<th>
                                <th>
                                    <select name="veiculo" class="fixed-size">
                                        <option selected="selected" disabled>Selecione</option>
                                        <%
                                            Veiculos vTransacao = new Veiculos();
                                            Vector veiculos = vTransacao.pesquisarTodos();
                                            Usuarios uTransacao = new Usuarios();
                                            Clientes cTransacao = new Clientes();
                                            Vector usuario = uTransacao.pesquisar((String) session.getAttribute("user_name"));
                                            ClientesDO cliente = cTransacao.buscarPorUsuarioID(((UsuariosDO)usuario.elementAt(0)).getId());
                                            for(int i = 0; i < veiculos.size(); i++){
                                                if(((VeiculosDO)veiculos.elementAt(i)).getClienteID() == cliente.getId()){
                                                    int id = ((VeiculosDO)veiculos.elementAt(i)).getId();
                                                    String placa = ((VeiculosDO)veiculos.elementAt(i)).getPlaca();
                                                    %><option value=<%=id%>><%=placa%></option><%
                                                }
                                            }
                                        %>
                                    </select>
                                </th>
                            </tr>
                        </table>
                        <input name="concluir" value="Concluir" type="submit"/>
                        <input name="cancelar" value="Cancelar" type="submit"/>
                    </form>
                </div>
                <div id="contentLeft">
                    
                </div>
            </div>
        </div>
    </body>
</html>

