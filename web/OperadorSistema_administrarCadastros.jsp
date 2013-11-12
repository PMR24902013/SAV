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
            classes.transacoes.Funcionario tn_f = new classes.transacoes.Funcionario();
            classes.transacoes.Estacao tn_e = new classes.transacoes.Estacao();
    String estado = "aguardando";
            Vector cadastrosC = tn_c.pesquisarCadastro(estado);
            Vector cadastrosP = tn_p.pesquisarCadastro(estado);
            Vector cadastrosF = tn_f.pesquisarCadastro(estado);
            Vector cadastrosE = tn_e.pesquisarCadastro(estado);
if (((cadastrosC == null) || (cadastrosC.size() == 0)) && ((cadastrosP == null) || (cadastrosP.size() == 0)) && ((cadastrosF == null) || (cadastrosF.size() == 0)) && ((cadastrosE == null) || (cadastrosE.size() == 0))) {
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
            <%           for (int i = 0; i < cadastrosF.size(); i++) {
                    classes.data.FuncionarioDO f = (classes.data.FuncionarioDO) cadastrosF.elementAt(i);
            %>              <tr>
                <td><%= f.getNome()%></td>
                <% String categoria = f.getCategoria();
                    if (categoria.equals("OpSist")) {%>
                <td>Operador do Sistema</td>
                <%} else if (categoria.equals("Motorista")) {%>
                <td>Motorista</td>
                <%} else if (categoria.equals("OpManut")) {%>
                <td>Operador de Manutenção</td>
                <%}%>
                <td><a href=OperadorSistema_administrarCadastros.jsp?action=showFuncionarioEditForm&id=<%= f.getId()%>>Administrar</a>
            </tr>        
            <%           } // for i Funcionario     
            %>

            <%           for (int i = 0; i < cadastrosE.size(); i++) {
                    classes.data.EstacionamentoDO e = (classes.data.EstacionamentoDO) cadastrosE.elementAt(i);
            %>              <tr>
                <td><%= e.getNome()%></td>
                <td>Estacionamento</td>
                <td><a href=OperadorSistema_administrarCadastros.jsp?action=showEstacionamentoEditForm&id=<%= e.getId()%>>Administrar</a>
            </tr>        
            <%           } // for i Estacionamento     
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

        <!--   mostra formulario para atualizacao  do funcionario               -->
        <%     if (action.equals("showFuncionarioEditForm")) {
                int id = Integer.parseInt(request.getParameter("id"));

                classes.transacoes.Funcionario tn = new classes.transacoes.Funcionario();
                classes.data.FuncionarioDO funcionario = tn.buscar(id);
        %>        
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <table>
                <tr>
                    <td>Nome</td>
                    <td><%= funcionario.getNome()%></td>
                </tr>
                <tr>
                    <td>CPF</td>
                    <td><%= funcionario.getCPF()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= funcionario.getEmail()%></td>
                </tr>
                <tr>
                    <td>Endereço</td>
                    <td><%= funcionario.getEndereco()%></td>
                </tr>
                <tr>
                    <td>Telefone</td>
                    <td><%= funcionario.getTelefone()%></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><%= funcionario.getCategoria()%></td>
                </tr>
            </table>
            <input type="submit" name="ativar" value="ativar" />
            <input type="hidden" name="id" value=<%= id%> /> 
            <input type="submit" name="recusar" value="recusar" />
            <input type="hidden" name="action" value="updateFuncionarioValues" />
        </form>
        <%
            } // showFuncionarioEditForm
        %>
        
        <!--   mostra formulario para atualizacao  do estacionamento               -->
        <%     if (action.equals("showEstacionamentoEditForm")) {
                int id = Integer.parseInt(request.getParameter("id"));

                classes.transacoes.Estacao tn = new classes.transacoes.Estacao();
                classes.data.EstacionamentoDO estacionamento = tn.buscar(id);
        %>        
        <form action="./OperadorSistema_administrarCadastros.jsp" method="post">
            <table>
                <tr>
                    <td>Nome</td>
                    <td><%= estacionamento.getNome()%></td>
                </tr>
                <tr>
                    <td>Endereco</td>
                    <td><%= estacionamento.getEndereco()%></td>
                </tr>
                <tr>
                    <td>Vagas</td>
                    <td><%= estacionamento.getVagas()%></td>
                </tr>
                <tr>
                    <td>Tipo</td>
                    <td><%= estacionamento.getTipo()%></td>
                </tr>
                <tr>
                    <td>Nome do responsavel</td>
                    <td><%= estacionamento.getNome_Do_Responsavel()%></td>
                </tr>
                <tr>
                    <td>Horario de funcionamento</td>
                    <td><%= estacionamento.getHorario_De_Funcionamento()%></td>
                </tr>
                <tr>
                    <td>Telefone</td>
                    <td><%= estacionamento.getTelefone()%></td>
                </tr>
                <tr>
                    <td>Documento do convenio</td>
                    <td><%= estacionamento.getDocumento_Do_Convenio()%></td>
                </tr>
            </table>
            <input type="submit" name="ativar" value="ativar" />
            <input type="hidden" name="id" value=<%= id%> /> 
            <input type="submit" name="recusar" value="recusar" />
            <input type="hidden" name="action" value="updateEstacionamentoValues" />
        </form>
        <%
            } // showFuncionarioEditForm
        %>

        <! ------------------------------------------------------------------->
        <!--   atualizar valores -->
        <%
            if (action.equals("updateClienteValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Clientes tn = new classes.transacoes.Clientes();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")) {
                        result = tn.atualizarCadastro(id, "ativo");
                    } else if (null != request.getParameter("recusar")) {
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
            } // updateClientValues
        %>

        <%
            if (action.equals("updatePostoValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Posto tn = new classes.transacoes.Posto();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")) {
                        result = tn.atualizarCadastro(id, "ativo");
                    } else if (null != request.getParameter("recusar")) {
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
            } // updatePostoValues
        %>

        <%
            if (action.equals("updateFuncionarioValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Funcionario tn = new classes.transacoes.Funcionario();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")) {
                        result = tn.atualizarCadastro(id, "ativo");
                    } else if (null != request.getParameter("recusar")) {
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
            } // updateFuncionarioValues
%>

        <%
            if (action.equals("updateEstacionamentoValues")) {
                int id = Integer.parseInt(request.getParameter("id"));
                classes.transacoes.Estacao tn = new classes.transacoes.Estacao();
                boolean result = false;
                try {
                    if (null != request.getParameter("ativar")) {
                        result = tn.atualizarCadastro(id, "ativo");
                    } else if (null != request.getParameter("recusar")) {
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
            } // updateEstaacionamentoValues
%>
    </body>
</html>
