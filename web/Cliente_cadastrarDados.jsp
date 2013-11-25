<%-- 
    Document   : Cliente_cadastrarDados
    Created on : 21/11/2013, 12:07:51
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar dados do cliente</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <div id="base"> 
            <div id ="cima"></div>      
            <% if (null == request.getParameter("incluir")) {
            %>
            <p class="titulo">Insira seus dados</p>
            <form id="content" style="margin-left: 5%;" action="Cliente_cadastrarDados.jsp" method="post">
                <table>
                    <tr>
                        <td>Nome completo</td>
                        <td><input type="text" name="nome" />
                    </tr>
                    <tr>
                        <td>CPF</td>
                        <td><input type="text" name="CPF" />
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" />
                    </tr>
                    <tr>
                        <td>Endereço</td>
                        <td><input type="text" name="endereco"  /></td>
                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" /></td>
                    </tr>

                    <tr>
                        <td> Upload carteira de motorista </td>
                        <td><input type ="file" name ="carteira"/></td>
                    </tr>
                </table>
                <input style="margin-left: 30%;" type="submit" name="incluir" value="Finalizar" /> 
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form> 
            <%
            } else if (null != request.getParameter("incluir")) {

                String user = (String) session.getAttribute("user_name");
                String passwd = (String) session.getAttribute("passwd");
                Usuarios tu = new Usuarios();
                UsuariosDO musuario = new UsuariosDO();
                // cria um novo usuario
                musuario.setLogin(user);
                musuario.setSenha(passwd);
                musuario.setTipo("Cliente");
                tu.incluir(musuario);

                int usuarioid = tu.buscarID(user);

                String nome = request.getParameter("nome");
                String CPF = request.getParameter("CPF");
                String endereco = request.getParameter("endereco");
                String telefone = request.getParameter("telefone");
                String email = request.getParameter("email");

                ClientesDO p = new ClientesDO();
                //arrumar  arquivo 
                //String nomeatual = (String) session.getAttribute("user_name");
                //Usuarios tn = new Usuarios();
                //Vector ps = tn.pesquisar(nomeatual);
                //UsuariosDO clientecriado = new UsuariosDO();
                //clientecriado = (UsuariosDO) ps.get(0);

                Clientes c = new Clientes();
                if (c.isEmpty(nome) || c.isEmpty(CPF) || c.isEmpty(telefone) || c.isEmpty(endereco) || c.isEmpty(email)) {

            %> 
            <p style="text-align: center; color: red;"><br>Preencha todos os campos!</p>
            <form action="./Cliente_cadastrarDados.jsp" method="post" style="margin-left: 40%;">
                <input type="submit" name="retry" value="Repetir" />
            </form>
            <%   } else {
                p.setUsuarioId(usuarioid);
                p.setNome(nome);
                p.setEndereco(endereco);
                p.setCPF(CPF);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setEstado("Aguardando");
                Clientes po = new Clientes();
                po.incluir(p);

            %> <p style="text-align: center;">Seus dados foram cadastrados com sucesso!</p>
            <form action="./Cliente_cadastrarDados.jsp" method="post" style="margin-left: 40%;">
                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form>
            <% }
                }
                if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }
                if (null != request.getParameter("Prosseguir")) {
            %>        <jsp:forward page="Cliente_menu.html" />
            <%        return;
                }

            %>

        </div>

    </body>
</html>

