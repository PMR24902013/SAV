<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Responder dúvidas</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>

        <div id="base">
            <div id ="cima"><div id="logo"></div>
                <div id="tudo">

                    <! ------------------------------------------------------------------->
                    <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

                    <%
                        String action = request.getParameter("action");
                        if (null == action) {
                            action = "./OperadorSistema_responderDuvidas.jsp";
                    %>

                    <%
                        // VERIFICACAO MANUAL DO LOGIN
                        if (session.getAttribute("user_name") == null) {
                            pageContext.forward("index.jsp");
                        }
                        Pergunta tn = new Pergunta();
                        boolean estado = false;
                        Vector duvidas = tn.buscarPorEstado(estado);
                        if (((duvidas == null) || (duvidas.size() == 0))) {
                            // avisar usuario que nao ha' reserva
                    %>
                    <p id="contentRight">Não há dúvidas em aberto.</p>
                    <%} 
                        else if (null == request.getParameter("enviar")){
                    %>
                    <form id="contentRight" action="./OperadorSistema_responderDuvidas.jsp" method="post">
                        <table>
                            <tr>
                                <td><b>Nome</b></td>
                                <td><b>email</b></td>
                            </tr>
                            <%           for (int i = 0; i < duvidas.size(); i++) {
                                    PerguntaDO pergunta = (PerguntaDO) duvidas.elementAt(i);

                            %>              <tr>
                                <td><%=pergunta.getNome()%></td>
                                <td><%=pergunta.getEmail()%></td>
                                <td><a href=OperadorSistema_responderDuvidas.jsp?action=responder&id=<%= pergunta.getID()%>>Responder</a></td>
                            </tr>        
                            <%           } // for i Cliente     
                            %>       
                        </table>   
                    </form>         
                    <%     } // reservas retornados
                        }
                    %>

                    <! ------------------------------------------------------------------->

                    <!--   atualizar valores -->
                    <%
                        if (action.equals("responder")) {
                            int id = Integer.parseInt(request.getParameter("id"));
                            PerguntaDO pergunta = new PerguntaDO();
                            Pergunta tn = new Pergunta();
                            pergunta = tn.buscar(id);
                    %>
                    <form id="contentRight" action="./OperadorSistema_responderDuvidas.jsp" method="post">
                        <table>
                            <tr>
                                <td><b>Nome</b></td>
                                <td><%=pergunta.getNome()%></td>
                            </tr>
                            <tr>
                                <td><b>E-mail</b></td>
                                <td><%=pergunta.getEmail()%></td>
                            </tr>
                            <tr>
                                <td><b>Pergunta</b></td>
                                <td><p><%=pergunta.getPergunta()%></p></td>
                            </tr>
                            <tr>
                                <td><b>Resposta</b></td>
                                <td><textarea name="resposta" rows="10" cols="30"></textarea></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="enviar" value="Responder" /></td>
                            <input type="hidden" name="id" value="<%=id%>" />
                            </tr>
                        </table>
                    </form>
                    <%     }

                        if (null != request.getParameter("enviar")) {

                            Pergunta tn = new Pergunta();
                            Usuarios tn_u = new Usuarios();
                            Funcionario tn_f = new Funcionario();

                            PerguntaDO pergunta = new PerguntaDO();

                            int id = Integer.parseInt(request.getParameter("id"));

                            pergunta = tn.buscar(id);
                            String nome = pergunta.getNome();
                            String email = pergunta.getEmail();
                            String perg = pergunta.getPergunta();
                            String resp = request.getParameter("resposta");
                            boolean estado = true;
                            String user = (String) session.getAttribute("user_name");
                            int usuario_id = tn_u.buscarID(user);
                            int funcionario_id = tn_f.buscarPorUsuarioID(usuario_id).getId();

                            pergunta.setEmail(email);
                            pergunta.setFuncionarioId(funcionario_id);
                            pergunta.setID(id);
                            pergunta.setNome(nome);
                            pergunta.setPergunta(perg);
                            pergunta.setEstado(estado);
                            
                       
                            boolean result = false;
                            try {
                                result = tn.atualizar(pergunta);
                            } catch (Exception e) {
                    %>           <%= e.toString()%>
                    <%
                        }
                        if (result) {
                            // avisar usuario que transacao foi feita com sucesso
                    %>
                    <form id="contentRight" action="./OperadorSistema_responderDuvidas.jsp" method="post">
                        E-mail com a resposta enviado <br>
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>
                    <%     } else {
                    %>
                    <form id="contentRight" action="./OperadorSistema_responderDuvidas.jsp" method="post">
                        Erro ao responder a dúvida. <br>
                        <input type="submit" name="retry" value="Repetir" />
                    </form>
                    <%     }
                    } // updateStatusPagamento
%>
                    <div id="contentLeft"></div>
                    <div class="clear"> </div>
                </div>
            </div>
    </body>
</html>
