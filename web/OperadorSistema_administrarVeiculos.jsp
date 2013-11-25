<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Veiculos</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
                <div id="contentRight">
                        <a href="Veiculo_cadastrar.jsp">Cadastrar novo veículo</a>    
                        <br>
                        <a href="Veiculo_remover.jsp">Remover veículo</a>
                         <br>
                        <a href="Veiculo_bloquear.jsp">Bloquear veículo</a>
                </div>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
