<%-- 
    Document   : OperadorSistema-administrarPostos
    Created on : 25/11/2013, 15:51:15
    Author     : Ligia
    Descrição  : Bloqueia e desbloqueia um posto entrando com seu nome na primeira tela e confirmando o nome a segunda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>

<html>
    <head>
        <%  PostoDO posto = new PostoDO();
            String estadoProcesso = "nada";
           String nome ="ninguem";
            String estado = "  ";

        %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Posto</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
                <% if (null == request.getParameter("Confirmar")&& null == request.getParameter("Confirm")&&null == request.getParameter("Confirme")) {%>
                <form id="contentRight" action="./OperadorSistema_administrarPostos.jsp" method="post">
                    <p id="contentRight">Insira o Nome do Posto a ser bloqueado ou desbloqueado</p>
                    <table>
                        <tr>
                            <td>Nome do Posto</td>
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

                        Posto p = new Posto();
                    
                            nome = ((String) request.getParameter("nome"));
                            PostoDO postoPesquisado=new PostoDO();
                            postoPesquisado = p.buscarPorNome(nome);
                         
                   if(p.isEmpty(nome)|| postoPesquisado==null) {    
                %>
                <form  id="contentRight" action="./OperadorSistema_administrarPostos.jsp" method="post">
                    <p id="contentRight">Este Posto não existe!  </p>
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                   }
                       else{
                      

                        estado = postoPesquisado.getEstado();

                        if (estado.equals("bloqueado")) {
                            // pageContext.forward("./OperadorSistema_administrarClientes.jsp?action=desbloquear");
                            estadoProcesso = "desbloquear";
                        }else if(estado.equals("Ativo")) {

                            // pageContext.forward("./OperadorSistema_administrarClientes.jsp?action=bloquear");
                            estadoProcesso = "bloquear";
                        }
                        else{
                            %>
                            <p id="contentRight">O cadastro do posto não foi efetivado</p>
                            <%
                        }
                    }
                    }
                    if (estadoProcesso.equals("bloquear")) {
                %> 

                <form id="contentRight" action="./OperadorSistema_administrarPostos.jsp"   method="post">

                    <table>

                        <tr>
                            <td>Deseja bloquear <%=nome%>? </td>

                        </tr>
                        <input type="submit" name="Confirme" value="Confirme" /> 
                        <input type="hidden" name="guardaNome" value="<%=posto.getNome()%>" /> 
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
 
                           Posto p = new Posto();
                           PostoDO postoPesquisado=new PostoDO();
                           postoPesquisado = p.buscarPorNome(nome);
                           p.atualizarCadastro(posto.getID(), "bloqueado");

                %>
                <form  id="contentRight" action="./OperadorSistema_menu.html" method="post">
                    <p id="contentRight">Posto bloqueado com sucesso.</p>
                    <input type="submit" name="voltar" value="Voltar" />
                </form>

                <%         }

                    if (estadoProcesso.equals("desbloquear")) {
                %> 

                <form id="contentRight" action="./OperadorSistema_administrarPostos.jsp"  method="post">

                    <table>

                        <tr>
                            <td>Deseja desbloquear <%=posto.getNome()%> </td>

                        </tr>
                        <input type="submit" name="Confirm" value="Confirm"  /> 
                        <input type="hidden" name="guardaNome" value="<%=posto.getNome()%>" /> 

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
                        Posto p = new Posto();
                        PostoDO postoPesquisado = new PostoDO();
                        postoPesquisado = p.buscarPorNome(nome);
                        p.atualizarCadastro(posto.getID(), "normal");
                %>
                <form  id="contentRight" action="./OperadorSistema_menu.html" method="post">
                    <p id="contentRight">Posto desbloqueado com sucesso.</p>
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
