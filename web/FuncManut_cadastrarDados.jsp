<%-- 
    Document   : IncluirFuncionarioManutencao
    Created on : 28/10/2013, 17:44:22
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Funcionário de Manutenção</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <%@ page import="classes.data.FuncionarioDO" %>
        <%@ page import="classes.data.UsuariosDO" %>
        <%@ page import="classes.transacoes.Funcionario" %>
        <%@ page import="java.util.Vector" %>
        <div id="base">
            <div id ="cima"></div>
            <div id="tudo">
                <! ------------------------------------------------------------>
                <!--   se for o request inicial, mostrar somente o formulario -->

                <%     if (null == request.getParameterValues("incluir")) {
                %>
                <form id="content" action="./FuncManut_cadastrarDados.jsp" method="post">
                    <b>Informações de cadastro</b>
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" />
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" name="CPF" />
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="Email" />
                        </tr>
                        <tr>
                            <td>Endereco</td>
                            <td><input type="text" name="Endereco" />
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" name="telefone" />
                        </tr>
                        <tr>
                        <input type="submit" name="incluir" value="incluir" />
                </form>
                <form action="./index.html" method="post">
                    <input type="submit" name="cancelar" value="cancelar" />
                </form>
                </tr>
                </table>

                <%      } else {
                %>
                <! ------------------------------------------------------------------->
                <!--   se nao for o request inicial, acionar a transacao de negocio -->
                <%
                    String user = (String) session.getAttribute("user_name");
                    classes.transacoes.Usuarios tu = new classes.transacoes.Usuarios();

                    Vector buscaUser = tu.pesquisar(user);
                    UsuariosDO userCriado = new UsuariosDO();
                    userCriado = (UsuariosDO) buscaUser.get(0);

                    String nome = request.getParameter("nome");
                    String cpf = request.getParameter("CPF");
                    String email = request.getParameter("Email");
                    String endereco = request.getParameter("Endereco");
                    String telefone = request.getParameter("telefone");
                    String estado = request.getParameter("estado");
                    classes.transacoes.Funcionario tn = new classes.transacoes.Funcionario();
                    classes.data.FuncionarioDO funcionario = new classes.data.FuncionarioDO();
                    funcionario.setNome(nome);
                    funcionario.setCPF(cpf);
                    funcionario.setEmail(email);
                    funcionario.setEndereco(endereco);
                    funcionario.setTelefone(telefone);
                    funcionario.setEstado("Aguardando Aprovacao");
                    funcionario.setCategoria("OpManut");
                    funcionario.setId(userCriado.getId());
                    if (tn.incluirFuncionarioManutencao(funcionario)) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="./index.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                    tu.excluir(userCriado);
                %>
                Erro ao incluir usuário! Preencha os campos corretamente.            
                <form action="./IncluirFuncionarioManutencao.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                %>

    </body>
 </html>
