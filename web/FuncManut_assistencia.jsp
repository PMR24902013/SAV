<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <script>
        var select = document.getElementById("estado");
        select.onchange = function() {
            var selIndex = select.selectedIndex;
            var selValue = select.options(selIndex).innerHTML;
        };
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Responder Assistência</title>
        <%@ include file="headerManutencao.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.text.*" %>
        <%@ page import="classes.transacoes.*"  %>
        <%@ page import="classes.data.*" %>

        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">

                <%
                    String action = request.getParameter("action");
                    if (null == action) {
                        action = "showSearchForm";
                %>

                <form id="contentRight" action="./FuncManut_assistencia.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                    %>   
                    <table>
                        <tr>

                            <td><a href=FuncManut_assistencia.jsp?action=showSearchResultsPending>Assistências Pendentes</a>
                            <td><td><a href=FuncManut_assistencia.jsp?action=showSearchResultsConcluded>Assistências Concluidas</a>

                        </tr>




                    </table>
                </form>
                <%
                    }

                %>

                <%   if (action.equals("showSearchResultsPending")) {
                        boolean temAguardando = false;
                        int i;
                        classes.transacoes.AssistenciaTecnica tn = new classes.transacoes.AssistenciaTecnica();
                        classes.data.AssistenciaTecnicaDO assistencia = new classes.data.AssistenciaTecnicaDO();

                        for (i = 1; tn.buscar(i) != null; i++) {
                            assistencia = tn.buscar(i);
                            if (assistencia.getEstadoFinal().equals("Reparado")) {
                                temAguardando = true;
                            }
                        }

                        if (temAguardando == false) {
                %>
                <form id="contentRight" action="./FuncManut_menu.html" method="post">
                    Não foram encontrados chamados de assistência pendentes
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%      } else {
                %>
                <form id="contentRight" action="./FuncManut_assistencia.jsp" method="post">
                    <table>
                    <tr>
                        <td>Data</td>
                        <td>Queixa</td>
                        <td>Endereço</td>
                    </tr>
                    <%           for (i = 1; tn.buscar(i) != null; i++) {
                            assistencia = tn.buscar(i);
                            if (!assistencia.getEstadoFinal().equals("Reparado")) {

                    %>
                    <tr>
                        <td><%= assistencia.getData()%></td>
                        <td><%= assistencia.getQueixa()%></td>
                        <td><%= assistencia.getEndereco()%></td>
                        <td><a href=FuncManut_assistencia.jsp?action=showEditForm&id=<%= assistencia.getId()%>>Responder</a>
                    </tr>


                    <%
                            } //if
                        } //for i
                    %>
                </table>
                </form>
                    <form id="contentRight" action="./FuncManut_menu.html" method="post">
                            <input type="submit" name="cancelar" value="cancelar" />
                        </form>
                <%
                        }
                    }

                    if (action.equals("showSearchResultsConcluded")) {
                        boolean temReparado = false;
                        int i;
                        classes.transacoes.AssistenciaTecnica tn = new classes.transacoes.AssistenciaTecnica();
                        classes.data.AssistenciaTecnicaDO assistencia = new classes.data.AssistenciaTecnicaDO();

                        for (i = 1; tn.buscar(i) != null; i++) {
                            assistencia = tn.buscar(i);
                            if (assistencia.getEstadoFinal().equals("Reparado")) {
                                temReparado = true;
                            }
                        }

                        if (temReparado == false) {
                %>
                <form id="contentRight" action="./FuncManut_menu.html" method="post">
                    Não foram encontrados chamados de assistência pendentes
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%      } else {
                %>
                <form id="contentRight" action="./FuncManut_assistencia.jsp" method="post">
                <table>
                    <tr>
                        <td>Data</td>
                        <td>Queixa</td>
                        <td>Endereço</td>
                    </tr>
                    <%           for (i = 1; tn.buscar(i) != null; i++) {
                            assistencia = tn.buscar(i);
                            if (assistencia.getEstadoFinal().equals("Reparado")) {

                    %>
                    <tr>
                        <td><%= assistencia.getData()%></td>
                        <td><%= assistencia.getQueixa()%></td>
                        <td><%= assistencia.getEndereco()%></td>
                    </tr>
                    <%
                            } //if
                        } //for i
                    %>
                </table>
                </form>
                    <form id="contentRight" action="./FuncManut_menu.html" method="post">
                            <input type="submit" name="cancelar" value="cancelar" />
                        </form>
                <%
                        }
                    }

                    if (action.equals("showEditForm")) {

                        String opcao = null;
                    if (request.getParameterValues("finalizar") == null){
                %>
                <form id="contentRight" action="#" method="post">    
                    <tr>
                        <td>Estado</td>
                    <select id="estado" name ="estado">
                        <option selected value="Aguardando Assistencia">Aguardando Assistência</option>
                        <option value="Enviado para Conserto">Enviado para Conserto</option>
                        <option value="Reparado">Reparado</option>
                    </select>

                    <input type="submit" name="finalizar" value="Finalizar"/>

                    </tr>  
                </form>
                <%
                    }
                   else {
                        int id = Integer.parseInt(request.getParameter("id"));
                        opcao = request.getParameter("estado");
                        classes.transacoes.AssistenciaTecnica tn = new classes.transacoes.AssistenciaTecnica();
                        classes.transacoes.Funcionario tf = new classes.transacoes.Funcionario();
                        classes.transacoes.Usuarios tu = new classes.transacoes.Usuarios();

                        classes.data.AssistenciaTecnicaDO responderChamado = tn.buscar(id);
                        String user = (String) session.getAttribute("user_name");
                        int buscaID = tu.buscarID(user);
                        classes.data.FuncionarioDO funcionario = tf.buscarPorUsuarioID(buscaID);

                        responderChamado.setFuncionarioID(funcionario.getId());
                        responderChamado.setEstadoFinal(opcao);

                        tn.atualizar(responderChamado);                   

                %>
                <form id="contentRight" action="./FuncManut_assistencia.jsp" method="post">
                    Estado alterado com sucesso
                    <table>
                        <tr>

                        <input type="submit" name="pesquisar" value="retornar" />
                        <input type="hidden" name="action" value="showSearchResultsPending" />

                        </tr>
                    </table>
                </form>

                <%                }
                    }
                %>



                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
