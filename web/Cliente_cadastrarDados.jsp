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

            <%
                if (null != request.getParameter("incluir")) {

                    String nome = request.getParameter("nome");
                    String CPF = request.getParameter("CPF");
                    String endereco = request.getParameter("endereco");
                    String telefone = request.getParameter("telefone");
                    String email = request.getParameter("email");

                    ClientesDO p = new ClientesDO();
                    //arrumar  arquivo 
                    String nomeatual = (String) session.getAttribute("user_name");
                    Usuarios tn = new Usuarios();
                    Vector ps = tn.pesquisar(nomeatual);
                    UsuariosDO clientecriado = new UsuariosDO();
                    clientecriado = (UsuariosDO) ps.get(0);

                    Clientes c = new Clientes();
                    if (c.isEmpty(nome) || c.isEmpty(CPF) || c.isEmpty(telefone) || c.isEmpty(endereco) || c.isEmpty(email)) {

            %> 
            Preencha todos os campos!
            <form action="Cliente_cadastrarDados.jsp" method="post">

                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form><%   } else {
                p.setUsuarioId(clientecriado.getId());
                p.setNome(nome);
                p.setEndereco(endereco);
                p.setCPF(CPF);
                p.setEmail(email);
                p.setTelefone(telefone);

                classes.transacoes.Clientes po = new classes.transacoes.Clientes();
                po.incluir(p);

            %> <br><br>Seus dados foram cadastrados com sucesso!
            <input type="submit" name="Prosseguir" value="Prosseguir" />


            <% }
                }
                if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }


            %>
            <form id="content" action="Cliente_cadastrarDados.jsp" method="post">

                <br>Insira seus dados<br><br>

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
                <input type="submit" name="incluir" value="Incluir" /> 
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form> 
        </div>

    </body>
</html>

