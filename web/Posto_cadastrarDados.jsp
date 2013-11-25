<%-- 
    Document   : cadastrarComoPostoORetorno
    Created on : 05/11/2013, 19:52:47
    Author     : hidden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar dados do posto</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"></div>

            <%
                if (null != request.getParameter("incluir")) {

                    String nome = request.getParameter("nome");

                    String local = request.getParameter("local");

                    String dono = request.getParameter("dono");
                    String telefone = request.getParameter("telefone");
                    String horario = request.getParameter("horario");
                    PostoDO p = new PostoDO();
                    //arrumar  arquivo 
                    String nomeatual = (String) session.getAttribute("user_name");
                    Usuarios tn = new Usuarios();
                    Vector ps = tn.pesquisar(nomeatual);
                    UsuariosDO postocriado = new UsuariosDO();
                    postocriado = (UsuariosDO) ps.get(0);

                    Posto c = new Posto();
                    if (c.isEmpty(nome) || c.isEmpty(local) || c.isEmpty(telefone) || c.isEmpty(horario) || c.isEmpty(horario)) {

            %> 
            Preencha todos os campos!
            <form action="Posto_cadastrarDados.jsp" method="post">

                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form><%     } else {
                p.setUsuariosID(postocriado.getId());

                p.setNome(nome);

                p.setEndereco(local);

                p.setTelefone(telefone);
                p.setHorario(horario);
                p.setResponsavel(dono);

                p.setDocumento("sei lah");
                classes.transacoes.Posto po = new classes.transacoes.Posto();
                po.incluir(p);

            %> Seus dados foram cadastrados com sucesso!

            <form id="content" action="Posto_menu.html" method="post">

                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form>
            <% }
                }
                if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }


            %>
            <form id="content" action="Posto_cadastrarDados.jsp" method="post">
               <p class="titulo">Insira seus dados</p>
                <table>
                    <tr>
                        <td>Nome do Posto</td>
                        <td><input type="text" name="nome" />
                    </tr>
                    <tr>
                        <td>Local do Posto</td>
                        <td><input type="text" name="local" />
                    </tr>
                    <tr>
                        <td>Nome do Dono</td>
                        <td><input type="text" name="dono" />
                    </tr>
                    <tr>
                        <td>Documento de licensiamento</td>
                        <!--nao sei como fazer pra carregar -->
                        <td><input type="file"   /></td>

                    </tr>
                    <tr>
                        <td>Telefone</td>
                        <td><input type="text" name="telefone" /></td> 
                    <tr>
                        <td>Horario de Funcionamento</td>
                        <td><input type="text" name="horario" /> </td>
                </table>
                <input type="submit" name="incluir" value="incluir" /> 
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form> 
        </div>
    </body>
</html>
