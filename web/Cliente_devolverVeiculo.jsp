<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="headerCliente.html" %>
        
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
                    <form>
                        <table>
                            <tr>
                                <th>Veículo<th>
                                <th>
                                    <select class="fixed-size">
                                        <option selected="selected" disabled>Selecione</option>
                                        <%
                                            
                                            for(int i = 0; i < veiculos.size(); i++){
                                                int id = veiculos.elementAt(i);
                                                String placa = veiculos.elementAt(i);
                                                %><option value=<%=id%>><%=placa%></option><%
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

