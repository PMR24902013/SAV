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
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>

        <! ------------------------------------------------------------------->
        <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

        <%
            String action = request.getParameter("action");
            if (null == action) {
                action = "show";
        %>

        <form action="./verPrecos.jsp" method="post">
            <%
                String user;
                // VERIFICACAO MANUAL DO LOGIN
                    if (session.getAttribute("user_name") == null) {
                        user = "visitante";
                    } else {
                        user = "cliente";
                    }
                    classes.transacoes.Modelos tr = new classes.transacoes.Modelos();
                    Vector modelos = tr.pesquisarTodos();
        %>
        <a href=verPrecos.jsp?action=showOpPrice>Preço dos Opcionais</a><br>
        <table>
            <tr>
                <td>Modelo </td>
                <td>Marca </td>
                <td>Ano </td>
            </tr>
            <% 
                       for (int i = 0; i < modelos.size(); i++) {
                    classes.data.ModelosDO m = (classes.data.ModelosDO) modelos.elementAt(i);
            %>              <tr>
                <td><%= m.getModelo()%></td>
                <td><%= m.getMarca()%></td>
                <td><%= m.getAno()%></td>
                <td><a href=verPrecos.jsp?action=showPrice&id=<%= m.getId()%>>Ver</a>
            </tr>        
            <%           } // for i      
            %>       <td></td>
                <td></td>
                <td></td>
                <%           if (user.equals("cliente")){     
            %> 
                <td><form action="./Cliente_menu.html" method="post">
             <input type="submit" name="voltar" value="voltar" />        
            <%           }       
                else if (user.equals("visitante")){     
            %> 
                <td><form action="./index.html" method="post">
             <input type="submit" name="cancelar" value="cancelar" />        
            <%           }       
            %> 
          </form>
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
          <form action="./verPrecos.jsp" method="post">
             <table>
               <tr>
                  <td>Até 100Km</td>
                  <td><%= precos.getPreco1() %></td>
               </tr>
               <tr>
                  <td>De 100Km a 200Km</td>
                  <td><%= precos.getPreco2() %></td>
               </tr>
               <tr>
                  <td>De 200Km a 300Km</td>
                  <td><%= precos.getPreco3() %></td>
               </tr>
               <tr>
                  <td>De 300Km a 400Km</td>
                  <td><%= precos.getPreco4() %></td>
               </tr>
                  <td>De 400Km a 500Km</td>
                  <td><%= precos.getPreco5() %></td>
               </tr>
               <tr>
                  <td>A partir de 500Km</td>
                  <td><%= precos.getPreco6() %></td>
               </tr>  
             </table>
	     <form action="./verPrecos.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
           </form>
<%         
       } // showEditForm
%>
<! ------------------------------------------------------------------->
<!--                     mostra precos opcionais                    -->
<%     if (action.equals("showOpPrice")) {
          classes.transacoes.PrecosOp tn = new classes.transacoes.PrecosOp();
          classes.data.PrecosOpDO precoOp = tn.buscar();
%>        
          <form action="./verPrecos.jsp" method="post">
             <table>
               <tr>
                  <td>Até 100Km</td>
                  <td><%= precos.getPreco1() %></td>
               </tr>
               <tr>
                  <td>De 100Km a 200Km</td>
                  <td><%= precos.getPreco2() %></td>
               </tr>
               <tr>
                  <td>De 200Km a 300Km</td>
                  <td><%= precos.getPreco3() %></td>
               </tr>
               <tr>
                  <td>De 300Km a 400Km</td>
                  <td><%= precos.getPreco4() %></td>
               </tr>
                  <td>De 400Km a 500Km</td>
                  <td><%= precos.getPreco5() %></td>
               </tr>
               <tr>
                  <td>A partir de 500Km</td>
                  <td><%= precos.getPreco6() %></td>
               </tr>  
             </table>
	     <form action="./verPrecos.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
           </form>
<%         
       } // showEditForm
%>
    </body>
</html>
