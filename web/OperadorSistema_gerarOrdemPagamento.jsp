<%-- 
    Document   : OperadorSistema_gerarOrdemPagamento
    Created on : Nov 26, 2013, 1:01:22 AM
    Author     : Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>

<html>
    <head>
        <%  ClientesDO cliente = new ClientesDO();
            String estadoProcesso = "nada";
           String nome ="ninguem";
            //String estado = "  ";

        %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerar ordem de pagamento</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
                <% if (null == request.getParameter("Confirmar")&& null == request.getParameter("Confirm")&&null == request.getParameter("Confirme")) {%>
                <form id="contentRight" action="./OperadorSistema_gerarOrdemPagamento.jsp" method="post">
                    Insira o Nome do Cliente para gerar ordem de pagamento
                    <table>
                        <tr>
                            <td>Nome completo do Cliente</td>
                            <td><input type="text" name="nome" />
                        </tr>

                    </table>
                    <input type="submit" name="Confirmar" value="Confirmar" /> 

                    <input type="submit" name="Cancelar" value="Cancelar" />  


                </form>
                <%  }              if (null != request.getParameter("Cancelar")) {
                %>        <jsp:forward page="./OperadorSistema_menu.html" />
                <%        return;
                    }
                    //String action = request.getParameter("action");

                    if (null != request.getParameter("Confirmar")) {

                        Clientes c = new Clientes();

                        
                            nome= ((String) request.getParameter("nome"));
                            Vector clientePesquisado=new Vector();
                            clientePesquisado = c.pesquisar(nome);
                           Posto p=new Posto();// soh para usar isEMpty 
                   if(p.isEmpty(nome)|| clientePesquisado.size()==0||clientePesquisado==null) {    
                %>
                <form  id="contentRight" action="./OperadorSistema_administrarClientes.jsp" method="post">
                    Este Cliente não existe!  
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                   }
                       else{
                      cliente=(ClientesDO)clientePesquisado.get(0);  

                       int usuarioid = cliente.getUsuarioId();

                       

                    }
                    }
                    if (estadoProcesso.equals("bloquear")) {
                %> 

                <form id="contentRight" action="./OperadorSistema_administrarClientes.jsp"   method="post">

                    <table>

                        <tr>
                            <td>Deseja bloquear <%=cliente.getNome()%> </td>

                        </tr>
                        <input type="submit" name="Confirme" value="Confirme" /> 
                        <input type="hidden" name="guardaNome" value="<%=cliente.getNome()%>" /> 
                        <input type="submit" name="Cancelar" value="Cancelar"  />                
                    </table>



                </form>

                <%

                    }

                    if (null != request.getParameter("Confirme")) {

                        estadoProcesso = "bloqueioconfirmado";
                        nome = (String)request.getParameter("guardaNome");
                    }
                    if (null != request.getParameter("Cancelar")) {
                %>        <jsp:forward page="./OperadorSistema_menu.html" />
                <%        return;
                    }

                    if (estadoProcesso.equals("bloqueioconfirmado")) {
 
                           Clientes c = new Clientes();
                                   Vector clientePesquisado=new Vector();
                            clientePesquisado = c.pesquisar(nome);
                       cliente=(ClientesDO)clientePesquisado.get(0);
                        c.atualizarCadastro(cliente.getId(), "bloqueado");

                %>
                <form  id="contentRight" action="./OperadorSistema_menu.html" method="post">
                    Cliente bloqueado com sucesso  
                    <input type="submit" name="voltar" value="Voltar" />
                </form>

                <%         }

                    if (estadoProcesso.equals("desbloquear")) {
                %> 

                <form id="contentRight" action="./OperadorSistema_administrarClientes.jsp"  method="post">

                    <table>

                        <tr>
                            <td>Deseja desbloquear <%=cliente.getNome()%> </td>

                        </tr>
                        <input type="submit" name="Confirm" value="Confirm"  /> 
                        <input type="hidden" name="guardaNome" value="<%=cliente.getNome()%>" /> 

                        <input type="submit" name="Cancelar" value="Cancelar" />                
                    </table>
                </form>
                <%
                    }
                    if (null != request.getParameter("Confirm")) {

                        estadoProcesso = "desbloqueioconfirmado";
                        nome =(String) request.getParameter("guardaNome");
                    }
                    if (null != request.getParameter("Cancelar")) {
                %>        
                <jsp:forward page="./OperadorSistema_menu.html" />
                <%        return;
                    }
                    if (estadoProcesso.equals("desbloqueioconfirmado")) {
Clientes c = new Clientes();
                                   Vector clientePesquisado=new Vector();
                        clientePesquisado = c.pesquisar(nome);
                       cliente=(ClientesDO)clientePesquisado.get(0);
                        c.atualizarCadastro(cliente.getId(), "normal");
                %>
                <form  id="contentRight" action="./OperadorSistema_menu.html" method="post">
                    cliente desbloqueado com sucesso  
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%         }
                    
                %>

                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
