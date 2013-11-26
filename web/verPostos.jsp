<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Postos conveniados</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        
        <%@ page import="classes.data.*" %>=
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Arrays" %>
        <div id="base">
            <div id ="cima"></div>
            <%
            ArrayList <String> nomes = new ArrayList<String>();
            ArrayList <String> enderecos = new ArrayList<String>();
            
            int i = 1;
            PostoDO posto = new PostoDO();
            Posto p = new Posto();
            posto = p.buscar(i);
            while( posto != null){
                nomes.add(posto.getNome());
                enderecos.add(posto.getEndereco());
                i ++;
                posto = p.buscar(i);
            }
            %><table>
                <tr>
                    <td><strong>NOME DO POSTO</strong></td>
                    <td><strong>ENDEREÇO</strong></td>
                </tr><%
            for (int j = 0 ; j < nomes.size() ; j++){%>
            <tr>
                <td><%=nomes.get(j)%></td>
                <td><%=enderecos.get(j)%></td>
            </tr><%                
            }%>
            
            </table>
            <form name="content" action="index.html">
                <input type="submit" name="Voltar" value="Voltar">
            </form>
        </div>
    </body>
</html>
