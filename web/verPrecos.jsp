<%-- 
    Document   : OperadorSistema_administrarCadastros
    Created on : 12/11/2013, 18:52:08
    Author     : Bruna Louzada
    Descriçao  : O visitante ou o cliente visualizam os precos.
    Entradas   : Dados dos precos.
    Saída      : O sistema volta para o respectivo menu (cliente ou visitante).
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver preços</title>
        <%@ include file="header.html"%>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>

        <div id="base">
            <div id ="cima"></div>
            <! ------------------------------------------------------------------->
            <!--   sempre mostrar o formulario de busca, ateh acao ser "voltar" -->

            <%     if (null != request.getParameter("voltarMenu")) {
                    response.sendRedirect(request.getContextPath() + "/index.html");
                    return;
                }
            %>

            <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

            <%
                String action = request.getParameter("action");
                if (null == action) {
                    action = "show";
            %>

            <form id="content" action="./verPrecos.jsp" method="post">
                <%
                    classes.transacoes.Modelos tr = new classes.transacoes.Modelos();
                    Vector modelos = tr.pesquisarTodos();
                    classes.transacoes.Precos_Opcionais tn = new classes.transacoes.Precos_Opcionais();
                    Vector precoOpcionais = tn.pesquisar();
                %>
                <br>
                <div class="titulo">Preço dos Opcionais</div>
                <table>
                    <thead>
                        <tr>
                            <td><strong>Opcional</strong> </td>
                            <td><strong>Preço</strong> </td>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            for (int i = 0; i < precoOpcionais.size(); i++) {
                                classes.data.Precos_OpcionaisDO po = (classes.data.Precos_OpcionaisDO) precoOpcionais.elementAt(i);
                        %>              
                        <tr>
                            <td><%= po.getOpcional()%></td>
                            <td><%= po.getPreco()%></td> 
                        </tr>        
                        <%           } // for i      
                        %>
                    </tbody>
                </table>
                <div class="titulo">Preço dos Carros</div>

                <table>
                    <thead>
                        <tr>
                            <td><strong>Modelo </strong></td>
                            <td><strong>Marca </strong></td>
                            <td><strong>Ano </strong></td>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            for (int i = 0; i < modelos.size(); i++) {
                                classes.data.ModelosDO m = (classes.data.ModelosDO) modelos.elementAt(i);
                        %>              
                        <tr>
                            <td><%= m.getModelo()%></td>
                            <td><%= m.getMarca()%></td>
                            <td><%= m.getAno()%></td>
                            <td><a href=verPrecos.jsp?action=showPrice&id=<%= m.getId()%>>Ver</a></td>
                        </tr>        
                        <%           } // for i      
                        %>       
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="voltarMenu" value="voltar" /></td>
                    </tbody>
                </table>
            </form>

            <%
                } // pesquisar
            %>
            <! ------------------------------------------------------------------->
            <!--                         mostra precos                          -->
            <%     if (action.equals("showPrice")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    classes.transacoes.Precos tn = new classes.transacoes.Precos();
                    classes.data.PrecosDO precos = tn.buscar(id);
            %>        
            <div id="content"><form action="./verPrecos.jsp" method="post">
                    <br>
                    <div class="titulo">Preço por Quilometragem</div>
                    <table>
                        <tr>
                            <td>Até 100Km</td>
                            <td><%= precos.getPreco1()%></td>
                        </tr>
                        <tr>
                            <td>De 100Km a 200Km</td>
                            <td><%= precos.getPreco2()%></td>
                        </tr>
                        <tr>
                            <td>De 200Km a 300Km</td>
                            <td><%= precos.getPreco3()%></td>
                        </tr>
                        <tr>
                            <td>De 300Km a 400Km</td>
                            <td><%= precos.getPreco4()%></td>
                        </tr>
                        <td>De 400Km a 500Km</td>
                        <td><%= precos.getPreco5()%></td>
                        </tr>
                        <tr>
                            <td>A partir de 500Km</td>
                            <td><%= precos.getPreco6()%></td>
                        </tr>  
                    </table>
                    <form action="./verPrecos.jsp" method="post">
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>

                </form></div>

            <%
                } // showPrice
            %>
        </div >
    </body>
</html>
