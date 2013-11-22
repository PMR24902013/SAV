<%-- 
    Document   : AlterarCadastroPosto
    Created on : 29/10/2013, 09:51:57
    Author     : professorpmr
--%>
<%@page import="classes.data.UsuariosDO"%>
<%@page import="classes.transacoes.Usuarios"%>
<%@page import="java.util.Vector" %>
<%@page import="classes.transacoes.Posto"  %>
<%@page import="classes.data.PostoDO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados Cadastrais do Posto</title>
        <%@ include file="headerPosto.html" %>
    </head>
    <body>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">

                <! ------------------------------------------------------------>
                <!--   se for o request inicial, mostrar somente o formulario -->

                <%     if (null == request.getParameterValues("incluir")) {
                %>
                <form id="contentRight" action="./Posto_alterarDados.jsp" method="post">
                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }

                        String nome = (String) session.getAttribute("user_name");
                    %>
                    Bom dia <%= nome%> !!

                    <table>
                        <tr>
                            <td>Nome Do Posto</td>
                            <td><input type="text" name="nome" />
                        </tr>
                        <tr>
                            <td>Responsável</td>
                            <td><input type="text" name="responsavel" />
                        </tr>
                        <tr>
                            <td>Documento</td>
                            <td><input type="text" name="documento" />
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" name="Endereco" />
                        </tr>
                        <tr>
                            <td>Preco da Gasolina</td>
                            <td><input type="text" name="gasolina" />
                        </tr>
                        <tr>
                            <td>Preco do Alcool</td>
                            <td><input type="text" name="alcool" />
                        </tr>
                    </table>
                    <input type="submit" name="incluir" value="incluir" />
                </form>

                <%      } else {
                %>
                <! ------------------------------------------------------------------->
                <!--   se nao for o request inicial, acionar a transacao de negocio -->


                <%     classes.transacoes.Posto tn = new classes.transacoes.Posto();
                    String posto = (String) session.getAttribute("PostoAtualizar");
                    classes.data.PostoDO postoAtualizar = new classes.data.PostoDO();
                    postoAtualizar = tn.pesquisarPorLogin(posto, tn);
                    request.setAttribute("nome", postoAtualizar.getNome());
                    request.setAttribute("responsavel", postoAtualizar.getResponsavel());
                    request.setAttribute("documento", postoAtualizar.getDocumento());
                    request.setAttribute("Endereco", postoAtualizar.getEndereco());
                    request.setAttribute("gasolina", postoAtualizar.getGasolina());
                    request.setAttribute("alcool", postoAtualizar.getAlcool());
                    String nome = request.getParameter("nome");
                    String responsavel = request.getParameter("responsavel");
                    String documento = request.getParameter("documento");
                    String endereco = request.getParameter("Endereco");
                    String gasolina = request.getParameter("gasolina");
                    String alcool = request.getParameter("alcool");
                    classes.data.PostoDO p = new classes.data.PostoDO();
                    p.setNome(nome);
                    p.setResponsavel(responsavel);
                    p.setDocumento(documento);
                    p.setEndereco(endereco);
                    p.setGasolina(gasolina);
                    p.setAlcool(alcool);
                    if (tn.incluir(p)) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form id="contentRight" action="./main.jsp" method="post">
                    Transação realizada com sucesso!
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>         
                <form id="contentRight" action="./insert.jsp" method="post">
                    Erro ao incluir usuário   
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                %>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
