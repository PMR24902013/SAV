<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veículos a Buscar</title>
        <%@ include file="headerManutencao.html" %>
    </head>
    <body>
        <%@ page import="classes.data.*" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
            
                <! ------------------------------------------------------------------->
                
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
                        String estado = "Aberto";
                        Vector buscar = tn.buscarPorEstado(estado);
                        if (((buscar == null) || (buscar.size() == 0))) {
                            // avisar usuario que nao ha' veiculos a buscar
                    %>
                    
                    <form id="contentRight" action="./FuncManut_menu.jsp" method="post">
                        Nenhum veículo a ser buscado.
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>
                    
                                        <table>
                        <tr>
                            <td>Veículo</td>
                            <td>Data </td>
                            <td>Funcionario </td>
                        </tr>

              
                
                
                
                
                
                
                
                
                
                
                
                
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
