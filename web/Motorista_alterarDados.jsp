<%-- 
    
    
/**
* Data:11 /11/2013
* Autor:Augusto
* Descricao:altera os dados cadastrais do motorista
* Entradas:

    
    
    email CHAR(30) NULL,
    Endereco CHAR(30) NULL,
    Telefone CHAR(30) NULL,
    
    Estado CHAR(30) NULL,
* Saidas:confirmação da atualização e disposicao do botao para voltar a tela inicial

*/
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados Cadastrais</title>
        <%@ include file="headerMotorista.html" %>
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
                
                <form  id="contentRight" action="./Motorista_alterarDados.jsp" method="post">
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
                        FuncionarioDO motorista = new FuncionarioDO();
                        Usuarios tn_u = new Usuarios();
                        Funcionario tn_e = new Funcionario();
                        //UsuariosDO usuario = new UsuariosDO();
                        int usuario_ID = tn_u.buscarID((String) session.getAttribute("user_name"));
                        //usuario = tn_u.buscar(usuario_ID);
                        motorista = tn_e.buscarPorUsuarioID(usuario_ID);
                %>        
                <form  id="contentRight" action="./Motorista_alterarDados.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" value="<%= motorista.getNome()%>" />
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" name="cpf" value="<%=motorista.getCPF()%>" />
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="<%=motorista.getEmail()%>" />
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" name="endereco" value="<%=motorista.getEndereco()%>" />
                        </tr>
         
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" value="<%=motorista.getTelefone()%>" />
                        </tr>
                       
                       
                    </table>
                    <input type="submit" name="atualizar" value="atualizar" />
                    <input type="hidden" name="id" value=<%=motorista.getId()%> /> 
                    <input type="hidden" name="usuarioid" value=<%=motorista.getUsuarioId()%> /> 
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
                        
                        
                        System.out.println(nome);
                        System.out.println(CPF);
                        System.out.println(endereco);
                        System.out.println(telefone);
                        System.out.println(email);
                        
                        Funcionario tn_e = new Funcionario();
                        FuncionarioDO motor = new FuncionarioDO();

                        motor.setNome(nome);
                        motor.setCPF(CPF);
                        motor.setEndereco(endereco);
                        motor.setTelefone(telefone);
                        motor.setEmail(email);
                        motor.setId(Integer.parseInt(request.getParameter("id")));
                        motor.setUsuarioId(Integer.parseInt(request.getParameter("usuarioid")));
                        boolean result = false;
                        try {
                            result = tn_e.atualizarDados(motor);
                        } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                <form  id="contentRight" action="./Motorista_menu.html" method="post">
                Transação realizada com sucesso!
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                <form  id="contentRight" action="./Motorista_alterarDados.jsp" method="post">
                Erro ao atualizar dados.
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