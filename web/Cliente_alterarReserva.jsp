<%-- 
    Document   : Cliente_alterarReserva
    Created on : 09/11/2013, 21:54:19
    Author     : Bruna Louzada
    Descriçao  : O cliente altera dados da reserva de veículos
    Entradas   : A primeira tela busca as reservas em estado "aguardo"
                   do cliente e exibe por data.
                 A segunda tela exibe todos os dados da reserva escolhida
                   e permite as alterações dos dados.
    Saída      : O sistema altera os dados e avisa o cliente.
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Reserva</title>
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
       if ( null == action ) {
          action = "showSearchForm";
%>

        <form action="./Cliente_alterarReserva.jsp" method="post">
            <%
                // VERIFICACAO MANUAL DO LOGIN
                if (session.getAttribute("user_name") == null) {
                    pageContext.forward("index.jsp");
                }
            %>   
            <table>
                <tr>
                    
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    <input type="hidden" name="action" value="showSearchResults" />
                    
                </tr>
            </table>
        </form>
<%        
       } 

%>
       
<! ------------------------------------------------------------------->
        <!--   se nao for o request inicial, acionar a transacao de negocio -->


        <%   if (action.equals("showSearchResults")) {
                classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
                classes.transacoes.Usuarios tr = new classes.transacoes.Usuarios();
                String nome = (String) session.getAttribute("user_name");
                int idCliente = tr.buscarID(nome);
                String estado = "aguardando";
                Vector reserva = tn.pesquisar(idCliente, estado);
                if ((reserva == null) || (reserva.size() == 0)) {
                    // avisar usuario que nao ha' reserva
        %>
        Nenhuma reserva em aguardo foi encontrada
        <form action="./Cliente_menu.jsp" method="post">
            <input type="submit" name="voltar" value="Voltar" />
        </form>
        <%     } else {
        %>
        <table>
            <tr>
                <td>Data </td>
                <td>Origem </td>
            </tr>
            <%           for (int i = 0; i < reserva.size(); i++) {
                    classes.data.ReservasDO r = (classes.data.ReservasDO) reserva.elementAt(i);
            %>              <tr>
                <td><%= r.getDataDeReserva()%></td>
                <td><%= r.getEstacionamentoID()%></td>
                <td><a href=Cliente_alterarReserva.jsp?action=showEditForm&id=<%= r.getID()%>>Alterar</a>
            </tr>        
            <%           } // for i      
            %>       <td></td>
                <td></td>
                <td><form action="./Cliente_menu.jsp" method="post">
             <input type="submit" name="cancelar" value="cancelar" />
          </form>
        </table>            
            <%     } // reservas retornados
                } // pesquisar
%>

<! ------------------------------------------------------------------->
<!--   mostra formulario para atualizacao                           -->
<%     if (action.equals("showEditForm")) {
          int id = Integer.parseInt(request.getParameter("id"));
	  classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
          classes.data.ReservasDO reserva = tn.buscar(id);
%>        
          <form action="./Cliente_alterarReserva.jsp" method="post">
             <table>
               <tr>
                  <td>Data da Reserva</td>
                  <td><input type="date" name="data de reserva" value=<%= reserva.getDataDeReserva() %> />
               </tr>
               <tr>
                  <td>Horário da Reserva</td>
                  <td><input type="date" name="horario de reserva" value=<%= reserva.getHorarioDeRetirada() %> />
               </tr>
               <tr>
                  <td>Modelo</td>
                  <td><input type="text" name="modelo" value=<%= reserva.getModeloID() %> />
               </tr>
               <tr>
                  <td>Estacionamento</td>
                  <td><input type="text" name="estacionamento" value=<%= reserva.getEstacionamentoID() %> />
               </tr>
             </table>
             <input type="submit" name="atualizar" value="atualizar" />
	     <input type="hidden" name="id" value=<%= id %> /> 
	     <input type="hidden" name="action" value="updateValues" />
	     <form action="./Cliente_alterarReserva.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
           </form>
<%         
       } // showEditForm
%>

<! ------------------------------------------------------------------->
<!--   atualizar valores -->
<%     
     if (action.equals("updateValues")) {
             String DataDeReserva = request.getParameter("data de reserva");
             String HorarioDeRetirada = request.getParameter("horario de reserva");
             int ModeloID = Integer.parseInt(request.getParameter("modelo"));
             int EstacionamentoID = Integer.parseInt(request.getParameter("estacionamento"));
             int id = Integer.parseInt(request.getParameter("id"));
             classes.transacoes.Reservas tn = new classes.transacoes.Reservas();
             classes.data.ReservasDO reservas = new classes.data.ReservasDO();
             try {
                 SimpleDateFormat hora = new SimpleDateFormat("hh:mm:ss");
                 SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd");
                 reservas.setDataDeReserva(data.parse(DataDeReserva));
                 reservas.setHorarioDeRetirada(hora.parse(HorarioDeRetirada));
             } catch (ParseException e) {
             }

             reservas.setModeloID(ModeloID);
             reservas.setEstacionamentoID(EstacionamentoID);
             reservas.setID(id);
             boolean result = false;
             try {
                 result = tn.atualizar(reservas);
             } catch (Exception e) {
%>           <%= e.toString()%>
<%
    }
    if (result) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./Cliente_menu.html" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao atualizar dados do contato
          <form action="./Cliente_alterarReserva.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
     } // updateValues
%>
    </body>
</html>
