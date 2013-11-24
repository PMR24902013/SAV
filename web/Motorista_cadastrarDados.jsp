<%-- 
    Document   : Motorista_cadastrarDados
    Created on : 24/11/2013, 11:15:37
    Author     : Flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar dados do motorista</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <%@ page import="classes.data.*" %>=
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.Vector" %>
        <div id="base">
            <div id ="cima"></div>
            <! ------------------------------------------------------------>
            <!--   se for o request inicial, mostrar somente o formulario -->

            <%     if (null == request.getParameterValues("incluir")) {
                    
            %>
            <form id="content" action="./Motorista_cadastrarDados.jsp" method="post">
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
                        <td><input type="submit" name="incluir" value="Finalizar cadastro" /></td>

                        </form>
                    <form action="./index.html" method="post">
                        <td><input type="submit" name="cancelar" value="Cancelar" /></td>
                    </form>
                    </tr>
                </table>

                <%      } else {
                %>
                <! ------------------------------------------------------------------->
                <!--   se nao for o request inicial, acionar a transacao de negocio -->
                <%
                    String user = (String) session.getAttribute("user_name");
                    String passwd = (String) session.getAttribute("passwd");
                    Usuarios tu = new Usuarios();
                    UsuariosDO musuario = new UsuariosDO();
                // cria um novo usuario
                    musuario.setLogin(user);
                    musuario.setSenha(passwd);
                    musuario.setTipo("Motorista");
                    tu.incluir(musuario);
                    
//                    Vector buscaUser = tu.pesquisar(user);
//                    UsuariosDO userCriado = new UsuariosDO();
//                    userCriado = (UsuariosDO) buscaUser.get(0);

                    String nome = request.getParameter("nome");
                    String cpf = request.getParameter("CPF");
                    String email = request.getParameter("Email");
                    String endereco = request.getParameter("Endereco");
                    String telefone = request.getParameter("telefone");

                    Funcionario tn = new Funcionario();
                    FuncionarioDO funcionario = new FuncionarioDO();

                    funcionario.setNome(nome);
                    funcionario.setCPF(cpf);
                    funcionario.setEmail(email);
                    funcionario.setEndereco(endereco);
                    funcionario.setTelefone(telefone);
                    funcionario.setEstado("Aguardando");
                    funcionario.setCategoria("Motorista");
                    funcionario.setId(musuario.getId());
                    if (tn.incluir(funcionario)) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="./index.html" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                   // tu.excluir(userCriado);
                %>
                Erro ao incluir usuário! Preencha os campos corretamente.            
                <form action="./Motorista_cadastrarDados.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                %>
        </div>
    </body>
</html>
