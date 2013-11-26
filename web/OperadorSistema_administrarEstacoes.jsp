<%-- 
    Document   : AtualizarDadosDasEstacoes
    Created on : 28/10/2013, 18:24:01
    Author     : User
    VERIFICAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Dados Das Estações</title>
        <%@ include file="headerOpSistema.html" %>
    </header>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">

                <%@page import="classes.transacoes.Estacao"  %>
                <%@page import="classes.data.EstacionamentoDO" %>
                <%@ page import="java.util.Vector" %>
                <! ------------------------------------------------------------>
                <!--   se for o request inicial, mostrar somente o formulario -->

                <%  if (null == request.getParameterValues("alterar") && null == request.getParameter("incluir")) {
                %>
                <form id="contentRight" action="./OperadorSistema_administrarEstacoes.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                        classes.data.EstacionamentoDO estacao = new classes.data.EstacionamentoDO();
                        classes.transacoes.Estacao busca = new classes.transacoes.Estacao();
                        Vector buscaEstacao = busca.pesquisarEstacao();

                    %>
                    Escolha o estacionamento cujos dados devem ser alterados.
                    <table>
                        <tr>
                            <td>Nome Do Estacionamento</td>
                            <td><select id="selecionaEstacao" name="selecionaEstacao">
                                    <option selected value="null">Selecione o nome da estação</option>
                                    <% for (int i = 0; i < buscaEstacao.size(); i++) {
                                            estacao = (EstacionamentoDO) buscaEstacao.get(i);
                                    %>
                                    <option value="<%=estacao.getNome()%>"><%=estacao.getNome()%></option>
                                    <% }
                                    %>
                                </select>
                        </tr>
                        <tr>
                            <td><input type="submit" name="alterar" value="Alterar"/>
                            <td><input type="submit" name="cancelarProcura" value="Cancelar"/>
                        </tr>
                    </table>
                </form>




                <%              }
                    if (null != request.getParameter("cancelarProcura")) {
                        String redirectURL = "./OperadorSistema_menu.html";
                        response.sendRedirect(redirectURL);
                    }
                %>

                <%
                    if (null != request.getParameter("alterar") && null == request.getParameter("incluir") && null == request.getParameter("cancelar") && !request.getParameter("selecionaEstacao").equals("null")) {
                        classes.transacoes.Estacao atualizaEstacao = new classes.transacoes.Estacao();
                        String estacaoSelecionada = request.getParameter("selecionaEstacao");
                        session.setAttribute("selecionaEstacao", estacaoSelecionada);
                        Vector buscaEstacaoSelecionada = atualizaEstacao.pesquisar(estacaoSelecionada);
                        classes.data.EstacionamentoDO dadosEstacao = new classes.data.EstacionamentoDO();
                        dadosEstacao = (EstacionamentoDO) buscaEstacaoSelecionada.get(0);

                %>

                
                <form id="contentRight" action="./OperadorSistema_administrarEstacoes.jsp" method="post">
                    Inclua os dados para atualização no sistema.
                    <table>
                        <tr>
                            <td>Nome Do Estacionamento</td>
                            <td><input type="text" name="nome" value="<%=dadosEstacao.getNome()%>"/>
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" name="Endereco" value="<%=dadosEstacao.getEndereco()%>"/>
                        </tr>
                        <tr>
                            <td>Vagas</td>
                            <td><input type="text" name="Vagas" value="<%=dadosEstacao.getVagas()%>"/>
                        </tr>
                        <tr>
                            <td>Nome Do Responsável</td>
                            <td><input type="text" name="Responsavel" value="<%=dadosEstacao.getNome_Do_Responsavel()%>"/>
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" value="<%=dadosEstacao.getTelefone()%>"/>
                        </tr>
                    </table>
                    <input type="submit" name="incluir" value="Incluir" />
                    <input type="submit" name="cancelarAtualizacao" value="Cancelar" />
                </form>

                <%
                } else if (null != request.getParameter("alterar")) {
                %>
                Selecione uma estação!
                <form id="contentRight" action="./OperadorSistema_administrarEstacoes.jsp">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%
                    }
                    if (null != request.getParameter("incluir")) {
                %>
                <! ------------------------------------------------------------------->
                <!--   se nao for o request inicial, acionar a transacao de negocio -->


                <%     classes.transacoes.Estacao tn = new classes.transacoes.Estacao();
                    String estacionamentoNome = (String) session.getAttribute("selecionaEstacao");
                    classes.data.EstacionamentoDO estacionamentoAtualizar = new classes.data.EstacionamentoDO();
                    Vector vetorAtualizacao = tn.pesquisar(estacionamentoNome);
                    estacionamentoAtualizar = (EstacionamentoDO) vetorAtualizacao.get(0);
                    request.setAttribute("nome", estacionamentoAtualizar.getNome());
                    request.setAttribute("Endereco", estacionamentoAtualizar.getEndereco());
                    request.setAttribute("Vagas", estacionamentoAtualizar.getVagas());
                    request.setAttribute("Responsavel", estacionamentoAtualizar.getNome_Do_Responsavel());
                    request.setAttribute("telefone", estacionamentoAtualizar.getTelefone());
                    String nome = request.getParameter("nome");
                    String endereco = request.getParameter("Endereco");
                    String vagas = request.getParameter("Vagas");
                    String responsavel = request.getParameter("Responsavel");
                    String telefone = request.getParameter("telefone");
                    classes.data.EstacionamentoDO estacionamento = new classes.data.EstacionamentoDO();
                    estacionamento.setNome(nome);
                    estacionamento.setEndereco(endereco);
                    estacionamento.setVagas(Integer.parseInt(vagas));
                    estacionamento.setNome_Do_Responsavel(responsavel);
                    estacionamento.setTelefone(telefone);
                    if (tn.atualizar(estacionamento)) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form id="contentRight" action="./OperadorSistema_menu.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar infotmações           
                <form id="contentRight" action="./OperadorSistema_administrarEstacoes.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if (null != request.getParameter("cancelarProcura")) {
                %>
                <jsp:forward page="OperadorSistema_administrarEstacoes.jsp" />
                <%             }
                %>

                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </body>
</html>
