<%-- 
    Document   : AlterarCadastroPosto
    Created on : 29/10/2013, 09:51:57
    Author     : Lígia
--%>




<%@page import="classes.data.UsuariosDO"%>
<%@page import="classes.transacoes.Usuarios"%>
<%@page import="java.util.Vector" %>
<%@page import="classes.transacoes.Posto"  %>
<%@page import="classes.data.PostoDO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posto - Alterar dados cadastrais</title>
        <%@ include file="headerPosto.html" %>
    </head>
    <body>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">

                <! ------------------------------------------------------------>
                <!--   se for o request inicial, mostrar somente o formulario -->

                <% String action = request.getParameter("action");
                   if (null == action){
                       action = "showEditForm";
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
                </form>
                <% 
                   }
                %>
                
                <! --------------------------------------------------------------->
                
                 <%     if (action.equals("showEditForm")) {
                        PostoDO posto = new PostoDO();
                        Usuarios tn_u = new Usuarios();
                        Posto tn_p = new Posto();
                        //UsuariosDO usuario = new UsuariosDO();
                        int usuario_ID = tn_u.buscarID((String) session.getAttribute("user_name"));
                        //usuario = tn_u.buscar(usuario_ID);
                        posto = tn_p.buscarPorUsuarioID(usuario_ID);
                        System.out.println(posto.getNome());
                        System.out.println(posto.getResponsavel());
                        System.out.println(posto.getDocumento());
                        System.out.println(posto.getEndereco());
                        System.out.println(posto.getGasolina());
                        System.out.println(posto.getAlcool());
                        System.out.println(posto.getTelefone());
                        System.out.println(posto.getHorario());
                %>
                
                <form id="contentRight" action="./Posto_alterarDados.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome Do Posto</td>
                            <td><input type="text" name="nome" value="<%= posto.getNome()%>" />
                        </tr>
                        <tr>
                            <td>Responsável</td>
                            <td><input type="text" name="responsavel" value="<%= posto.getResponsavel()%>" />
                        </tr>
                        <tr>
                            <td>Documento</td>
                            <td><input type="text" name="documento" value="<%= posto.getDocumento()%>"/>
                        </tr>
                        <tr>
                            <td>Endereço</td>
                            <td><input type="text" name="Endereco" value="<%= posto.getEndereco()%>"/>
                        </tr>
                        <tr>
                            <td>Preco da Gasolina</td>
                            <td><input type="text" name="gasolina" value="<%= posto.getGasolina()%>" />
                        </tr>
                        <tr>
                            <td>Preco do Álcool</td>
                            <td><input type="text" name="alcool" value="<%= posto.getAlcool()%>" />
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" value="<%= posto.getTelefone()%>" />
                        </tr>
                        <tr>
                            <td>Horário</td>
                            <td><input type="text" name="horario" value="<%= posto.getHorario()%>" />
                        </tr>
                    </table>
                        
                    <input type="submit" name="atualizar" value="atualizar" />
                    <input type="hidden" name="id" value=<%=posto.getID()%> /> 
                    <input type="hidden" name="usuarioid" value=<%=posto.getUsuariosID()%> /> 
                    <input type="hidden" name="action" value="updateValues" />
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                    
                    <% }
                 %>
                 
                 <! ------------------------------------------------------------------->
                 
                 <% if(action.equals("updateValues")){
                     if(null != request.getParameter("voltar")){
                 %>
                 <jsp:forward page="./Posto_menu.html" />
                 <% return;
                     }
                                         
                    /*request.setAttribute("nome", postoAtualizar.getNome());
                    request.setAttribute("responsavel", postoAtualizar.getResponsavel());
                    request.setAttribute("documento", postoAtualizar.getDocumento());
                    request.setAttribute("Endereco", postoAtualizar.getEndereco());
                    request.setAttribute("gasolina", postoAtualizar.getGasolina());
                    request.setAttribute("alcool", postoAtualizar.getAlcool());*/
                    
                    String nome = request.getParameter("nome");
                    String responsavel = request.getParameter("responsavel");
                    String documento = request.getParameter("documento");
                    String endereco = request.getParameter("Endereco");
                    String gasolina = request.getParameter("gasolina");
                    String alcool = request.getParameter("alcool");
                    String telefone = request.getParameter("telefone");
                    String horario = request.getParameter("horario");
                    
                    Posto tn_p = new Posto();
                    classes.data.PostoDO p = new classes.data.PostoDO();
                    
                    p.setNome(nome);
                    p.setResponsavel(responsavel);
                    p.setDocumento(documento);
                    if (documento == null){
                        p.setDocumento(
                        tn_p.buscar(
                        Integer.parseInt(
                        request.getParameter("id"))).getDocumento());
                    }
                    p.setEndereco(endereco);
                    p.setGasolina(gasolina);
                    p.setAlcool(alcool);
                    p.setTelefone(telefone);
                    p.setHorario(horario);
                    boolean result = false;
                    try {
                        result = tn_p.atualizar(p);
                    }
                    catch (Exception e){
                %>
                <% e.toString()%>
                <%;
                   }
                    if (result) {
                %>
                
                <form id="contentRight" action="./Posto_menu.html" method="post">
                    Transação realizada com sucesso!
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                
                <%     } else {
                %>         
                <form id="contentRight" action="./Posto_alterarDados.jsp" method="post">
                    Erro ao incluir usuário   
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                %>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
    </body>
</html>
