<%-- 
    Document   : visualizarFaturas
    Created on : 10/11/2013, 20:08:05
    Author     : hidden


--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>visualizar faturas</title>
    </head>
    <body>
       <% String user=(String)session.getAttribute("user_name");//pega o nome do user atual
       Usuarios tn= new Usuarios();
         Vector ps = tn.pesquisar(user);// procura ele na tabela
        UsuariosDO useratual =new UsuariosDO();
      if(ps==null||ps.size()==0){
      
          %> 
          <form action="Cliente_menu.jsp">
        Deu merda na pesquisa de usuario  
          </form>
        <%
      }
        
       useratual=(UsuariosDO)ps.get(0);
       Operacoes_de_Caixa op=new Operacoes_de_Caixa();
       Vector fatura= new Vector();
       fatura=op.buscarPorUsuarioID(useratual.getId());
       if(ps==null||ps.size()==0){
      
          %> 
          <form action="Cliente_menu.jsp">
        Deu merda na pesquisa de operacao 
          </form>
        <%
      }
       %>
   
        <form action="Cliente_visualizarFaturas.jsp" method="post">
       <table border="1">
  <thead>
    <tr>
      <th>Valor</th>
      <th>Data de Pagamento</th>
    </tr>
  </thead>
  
  <tbody>
   


        <%
       float soma=0;
       for(int i=fatura.size()-1;i>-1;i--){
       
       %>   
       
    <tr>
      <td><%= ((Operacoes_de_CaixaDO)(fatura.get(i))).getValorDoPagamento()%></td>
      <td><%= ((Operacoes_de_CaixaDO)(fatura.get(i))).getDataDoPagamento()%></td>
    </tr>
       
       <%
       soma=soma+((Operacoes_de_CaixaDO)(fatura.get(i))).getValorDoPagamento();
       }%>
      
    </tbody>
       <tfoot>
    <tr>
      <td>Total</td>
      <td><%= soma%></td>
    </tr>
  </tfoot>
       </table>
      </form>
     <form action="Cliente_menu.html" method="post">
             
             <input type="submit" name="Voltar" value="Voltar" />
          </form>
    </body>
</html>
