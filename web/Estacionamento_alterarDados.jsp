<%-- 
    Document   : Estacionamento_alterarDados
    Created on : 23/11/2013, 21:46:19
    Author     : Flavio Jose
    Descriçao  : O estacionamento altera seus dados cadastrais
    Entradas   : O usuário fornece os dados que deseja alterar
    Saída      : O sistema altera os dados e avisa o usuário.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados cadastrais</title>
        <%@ include file="headerEstacionamento.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">

                <! ------------------------------------------------------------------->
                <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

                <%
                    String action = request.getParameter("action");
                    if (null == action) {
                        action = "showEditForm";
                %>

                <form  id="contentRight" action="./Estacionamento_alterarDados.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                    %>
                </form>
                <%
                    }

                %>

                <! ------------------------------------------------------------------->

                <!--   mostra formulario para atualizacao                           -->
                <%     if (action.equals("showEditForm")) {
                        EstacionamentoDO estacionamento = new EstacionamentoDO();
                        Usuarios tn_u = new Usuarios();
                        Estacionamento tn_e = new Estacionamento();
                        //UsuariosDO usuario = new UsuariosDO();
                        int usuario_ID = tn_u.buscarID((String) session.getAttribute("user_name"));
                        //usuario = tn_u.buscar(usuario_ID);
                        estacionamento = tn_e.buscarPorUsuarioID(usuario_ID);
                %>        
                <form  id="contentRight" action="./Estacionamento_alterarDados.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" value=<%= estacionamento.getNome()%> />
                        </tr>
                        <tr>
                            <td>Endereço</td>
                            <td><input type="text" name="endereco" value=<%=estacionamento.getEndereco()%> />
                        </tr>
                        <tr>
                            <td>Vagas</td>
                            <td><input type="text" name="vagas" value=<%=estacionamento.getVagas()%> />
                        </tr>
                        <tr>
                            <td>Nome do responsável</td>
                            <td><input type="text" name="nomeDoResponsavel" value=<%=estacionamento.getNome_Do_Responsavel()%> />
                        </tr>
                        <tr>
                            <td>Horário de Funcionamento</td>
                            <td><input type="text" name="horarioDeFuncionamento" value=<%=estacionamento.getHorario_De_Funcionamento()%> />
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" value=<%=estacionamento.getTelefone()%> />
                        </tr>
                        <tr>
                            <td>CEP</td>
                            <td><input type="text" name="cep" value=<%=estacionamento.getCEP()%> />
                        </tr>
                        <tr>
                            <td>Documento do convênio</td>
                            <td><input type="file" name="convenio" value="<%=estacionamento.getDocumento_Do_Convenio()%>" width="15" />
                        </tr>
                    </table>
                    <input type="submit" name="atualizar" value="atualizar" />
                    <input type="hidden" name="id" value=<%=estacionamento.getId()%> /> 
                    <input type="hidden" name="usuarioid" value=<%=estacionamento.getUsuario_Id()%> /> 
                    <input type="hidden" name="action" value="updateValues" />
                    <form action="./Estacionamento_alterarDados.jsp" method="post">
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
                        String nome = request.getParameter("nome");
                        String endereco = request.getParameter("endereco");
                        int vagas = Integer.parseInt(request.getParameter("vagas"));
                        String nomeDoResponsavel = request.getParameter("nomeDoResponsavel");
                        String convenio = request.getParameter("documento");
                        String horarioDeFuncionamento = request.getParameter("horarioDeFuncionamento");
                        String telefone = request.getParameter("telefone");
                        String cep = request.getParameter("cep");

                        Estacionamento tn_e = new Estacionamento();
                        EstacionamentoDO estacionamento = new EstacionamentoDO();

                        estacionamento.setNome(nome);
                        estacionamento.setEndereco(endereco);
                        estacionamento.setVagas(vagas);
                        estacionamento.setNome_Do_Responsavel(nomeDoResponsavel);
                        estacionamento.setDocumento_Do_Convenio(convenio);
                        estacionamento.setHorario_De_Funcionamento(horarioDeFuncionamento);
                        estacionamento.setTelefone(telefone);
                        estacionamento.setCEP(cep);
                        estacionamento.setId(Integer.parseInt(request.getParameter("id")));
                        estacionamento.setUsuario_Id(Integer.parseInt(request.getParameter("usuarioid")));
                        boolean result = false;
                        try {
                            result = tn_e.atualizar(estacionamento);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form  id="contentRight" action="./Estacionamento_menu.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados.
                <form  id="contentRight" action="./Estacionamento_alterarDados.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    } // updateValues
%>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
</body>
</html>
