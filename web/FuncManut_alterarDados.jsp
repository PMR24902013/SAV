<%-- 
    
    
/**
* Data:11 /11/2013
* Autor:Augusto
* Descricao:altera os dados cadastrais do funcionario de manutencao
*/
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados Cadastrais</title>
        <%@ include file="headerManutencao.html" %>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
                <! ------------------------------------------------------------------->
                <!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

                <%
                    String action = request.getParameter("action");
                    if (null == action) {
                        action = "showEditForm";
                %>
            <div id="tudo">
                
                <form  id="contentRight" action="./FuncManut_alterarDados.jsp" method="post">
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
                        FuncionarioDO manutencao = new FuncionarioDO();
                        Usuarios tn_u = new Usuarios();
                        Funcionario tn_e = new Funcionario();
                        //UsuariosDO usuario = new UsuariosDO();
                        int usuario_ID = tn_u.buscarID((String) session.getAttribute("user_name"));
                        //usuario = tn_u.buscar(usuario_ID);
                        manutencao = tn_e.buscarPorUsuarioID(usuario_ID);
                %>        
                <form  id="contentRight" action="./FuncManut_alterarDados.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" value="<%= manutencao.getNome()%>" />
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" name="cpf" value="<%=manutencao.getCPF()%>" />
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="<%=manutencao.getEmail()%>" />
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" name="endereco" value="<%=manutencao.getEndereco()%>" />
                        </tr>
         
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" value="<%=manutencao.getTelefone()%>" />
                        </tr>
                       
                       
                    </table>
                    <input type="submit" name="atualizar" value="atualizar" />
                    <input type="hidden" name="id" value=<%=manutencao.getId()%> /> 
                    <input type="hidden" name="usuarioid" value=<%=manutencao.getUsuarioId()%> /> 
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
                        String CPF = request.getParameter("cpf");
                        String endereco = request.getParameter("endereco");
                        String telefone = request.getParameter("telefone");
                        String email = request.getParameter("email");
                        
                        Funcionario tn_e = new Funcionario();
                        FuncionarioDO manut = new FuncionarioDO();

                        manut.setNome(nome);
                        manut.setCPF(CPF);
                        manut.setEndereco(endereco);
                        manut.setTelefone(telefone);
                        manut.setEmail(email);
                        manut.setId(Integer.parseInt(request.getParameter("id")));
                        manut.setUsuarioId(Integer.parseInt(request.getParameter("usuarioid")));
                        boolean result = false;
                        try {
                            result = tn_e.atualizarDados(manut);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form  id="contentRight" action="./FuncManut_menu.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados.
                <form  id="contentRight" action="./FuncManut_alterarDados.jsp" method="post">
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