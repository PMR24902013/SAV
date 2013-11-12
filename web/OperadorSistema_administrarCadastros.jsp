<%-- 
    Document   : OperadorSistema_administrarCadastros
    Created on : 09/11/2013, 21:54:19
    Author     : Bruna Louzada
    Descriçao  : O operador do sistema avalia a ativacao dos cadastros
    Entradas   : A primeira tela busca os cadastros em estado "aguardando".
                 A segunda tela exibe os dados do cadastro e a opção de ativar
                 ou rejeitar o cadastro.
    Saída      : O sistema ativa ou nao os dados e avisa o operador.
                    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Cadastros</title>
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
                action = "showSearchForm";
        %>

        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <%
                // VERIFICACAO MANUAL DO LOGIN
                if (session.getAttribute("user_name") == null) {
                    pageContext.forward("index.jsp");
                }
            %>
        </form>
        <%
            classes.transacoes.Clientes tn_c = new classes.transacoes.Clientes();
            classes.transacoes.Posto tn_p = new classes.transacoes.Posto();
String estado = "aguardando";
            Vector cadastrosC = tn_c.pesquisarCadastro(estado);
            Vector cadastrosP = tn_p.pesquisarCadastro(estado);
if (((cadastrosC == null) || (cadastrosC.size() == 0)) && ((cadastrosP == null) || (cadastrosP.size() == 0))) {
                // avisar usuario que nao ha' reserva
        %>
        Nenhum cadastro em aguardo foi encontrado
        <form action="./OperadorSistema_menu.jsp" method="post">
            <input type="submit" name="voltar" value="Voltar" />
        </form>
        <%     } else {
        %>
        <table>
            <tr>
                <td>Nome </td>
                <td>Tipo de Cadastro </td>
            </tr>
            <%           for (int i = 0; i < cadastrosC.size(); i++) {
                    classes.data.ClientesDO c = (classes.data.ClientesDO) cadastrosC.elementAt(i);
            %>              <tr>
                <td><%= c.getNome()%></td>
                <td>Cliente</td>
                <td><a href=OperadorSistema_administrarCadastros.jsp?action=showClienteEditForm&id=<%= c.getId()%>>Administrar</a>
            </tr>        
            <%           } // for i Cliente     
            %>       
            <%           for (int i = 0; i < cadastrosP.size(); i++) {
                    classes.data.PostoDO p = (classes.data.PostoDO) cadastrosP.elementAt(i);
            %>              <tr>
                <td><%= p.getNome()%></td>
                <td>Postos</td>
                <td><a href=OperadorSistema_administrarCadastros.jsp?action=showPostoEditForm&id=<%= p.getID()%>>Administrar</a>
            </tr>        
            <%           } // for i Posto     
            %>

            <td></td>
            <td></td>
            <td><form action="./OperadorSistema_menu.html" method="post">
                    <input type="submit" name="cancelar" value="cancelar" />
                </form>
        </table>            
        <%     } // reservas retornados
            }

        %>

        <! ------------------------------------------------------------------->
        <!--   mostra formulario para atualizacao  do cliente               -->
        <%     if (action.equals("showClienteEditForm")) {
                int id = Integer.parseInt(request.getParameter("id"));

                classes.transacoes.Clientes tn = new classes.transacoes.Clientes();
                classes.data.ClientesDO cliente = tn.buscar(id);
        %>        
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <table>
                <tr>
                    <td>Nome</td>
                    <td><%= cliente.getNome()%></td>
                </tr>
                <tr>
                    <td>CPF</td>
                    <td><%= cliente.getCPF()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= cliente.getEmail()%></td>
                </tr>
                <tr>
                    <td>Endereço</td>
                    <td><%= cliente.getEndereco()%></td>
                </tr>
                <tr>
                    <td>Telefone</td>
                    <td><%= cliente.getTelefone()%></td>
                </tr>
                <tr>
                    <td>CNH</td>
                    <td><%= cliente.getCNH()%></td>
                </tr>
            </table>
            <input type="submit" name="ativar" value="ativar" />
            <input type="hidden" name="id" value=<%= id%> /> 
            <input type="submit" name="recusar" value="recusar" />
            <input type="hidden" name="action" value="updateClienteValues" />
        </form>
        <%
            } // showClientEditForm
        %>

        <!--   mostra formulario para atualizacao  do posto               -->
        <%     if (action.equals("showPostoEditForm")) {
                int id = Integer.parseInt(request.getParameter("id"));

                classes.transacoes.Posto tn = new classes.transacoes.Posto();
                classes.data.PostoDO posto = tn.buscar(id);
        %>        
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <table>
                <tr>
                    <td>Nome</td>
                    <td><%= posto.getNome()%></td>
                </tr>
                <tr>
                    <td>Endereço</td>
                    <td><%= posto.getEndereco()%></td>
                </tr>
                <tr>
                    <td>Telefone</td>
                    <td><%= posto.getTelefone()%></td>
                </tr>
                <tr>
                    <td>Horário de Funcionamento</td>
                    <td><%= posto.getHorario()%></td>
                </tr>
                <tr>
                    <td>Responsável</td>
                    <td><%= posto.getResponsavel()%></td>
                </tr>
                <tr>
                    <td>Documento de Licensiamento</td>
                    <td><%= posto.getDocumento()%></td>
                </tr>
            </table>
            <input type="submit" name="ativar" value="ativar" />
            <input type="hidden" name="id" value=<%= id%> /> 
            <input type="submit" name="recusar" value="recusar" />
            <input type="hidden" name="action" value="updatePostoValues" />
        </form>
        <%
            } // showPostoEditForm
        %>
        
        <! ------------------------------------------------------------------->
        <!--   atualizar valores -->
        <%
            if (action.equals("updateClienteValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Clientes tn = new classes.transacoes.Clientes();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")){
                    result = tn.atualizarCadastro(id, "ativado");
                }
                    else if (null != request.getParameter("recusar")){
                    result = tn.atualizarCadastro(id, "recusado");
                }
                } catch (Exception e) {
        %>           <%= e.toString()%>
        <%
            }
            if (result) {
                 // avisar usuario que transacao foi feita com sucesso
        %>
        Transação realizada com sucesso!
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <input type="submit" name="voltar" value="Voltar" />
        </form>
        <%     } else {
        %>
        Erro ao atualizar dados do contato
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
        </form>
        <%     }
             } // updateClientValues
        %>
        
        <%
            if (action.equals("updatePostoValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Posto tn = new classes.transacoes.Posto();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")){
                    result = tn.atualizarCadastro(id, "ativado");
                }
                    else if (null != request.getParameter("recusar")){
                    result = tn.atualizarCadastro(id, "recusado");
                }
                } catch (Exception e) {
        %>           <%= e.toString()%>
        <%
            }
            if (result) {
                 // avisar usuario que transacao foi feita com sucesso
        %>
        Foi enviado um email para o usuario sobre a situaçao do seu cadastro
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <input type="submit" name="voltar" value="Voltar" />
        </form>
        <%     } else {
        %>
        Erro ao atualizar dados do contato
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
        </form>
        <%     }
             } // updateValues
        %>
    </body>
</html>
