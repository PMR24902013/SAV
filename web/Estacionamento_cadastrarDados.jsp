<%-- 
    Document   : Estacionamento_cadastrarDados
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
                    int vagas = Integer.parseInt(request.getParameter("vagas"));
                    String proprietario = request.getParameter("proprietario");
                    String tipo = request.getParameter("tipo");
                    String documento = request.getParameter("documento");
                    String horario = request.getParameter("horario");
                    String telefone = request.getParameter("telefone");

                    EstacionamentoDO p = new EstacionamentoDO();
                    //arrumar  arquivo 
                    String nomeatual = (String) session.getAttribute("user_name");
                    Usuarios tn = new Usuarios();
                    Vector ps = tn.pesquisar(nomeatual);
                    UsuariosDO estacionamentoCriado = new UsuariosDO();
                    estacionamentoCriado = (UsuariosDO) ps.get(0);

                    Estacionamento c = new Estacionamento();
                    if (c.isEmpty(nome) || c.isEmpty(local) || c.isEmpty(vagas) || c.isEmpty(proprietario) || c.isEmpty(documento) || c.isEmpty(horario) || c.isEmpty(telefone)) {

            %> 
            <br>
            Preencha todos os campos!
            <form action="Estacionamento_cadastrarDados.jsp" method="post">

                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form><%     } else {
                p.setUsuario_Id(estacionamentoCriado.getId());
                p.setNome(nome);
                p.setEndereco(local);
                p.setVagas(vagas);
                p.setNome_Do_Responsavel(proprietario);
                p.setTipo(false);
                p.setDocumento_Do_Convenio(documento);
                p.setHorario_De_Funcionamento(horario);
                p.setTelefone(telefone);

                classes.transacoes.Estacionamento po = new classes.transacoes.Estacionamento();
                po.incluir(p);

            %> 
            <br>
            Seus dados foram cadastrados com sucesso!

            <form id="content" action="Cliente_menu.html" method="post">

                <input type="submit" name="Prosseguir" value="Prosseguir" />
            </form>
            <% }
                }
                if (null != request.getParameter("Cancelar")) {
            %>        <jsp:forward page="index.html" />
            <%        return;
                }

            %>
            <form id="content" action="Estacionamento_cadastrarDados.jsp" method="post">

                <br>Login criado, insira seus dados

                <table>
                    <tr>
                        <td>Nome do Estacionamento</td>
                        <td><input type="text" name="nome" />
                    </tr>
                    <tr>
                        <td>Local do Estacionamento</td>
                        <td><input type="text" name="local" />
                    </tr>
                    <tr>
                        <td>Vagas Disponíveis</td>
                        <td><input type="number" name="vagas" />
                    </tr>
                    <tr>
                        <td>Nome do proprietário</td>
                        <td><input type="text" name="proprietario"  /></td>
                    </tr>
                    <tr>
                        <td> Documento do convenio</td>
                        <td><input type ="text" name ="documento"/></td>
                    </tr>

                    <tr>
                        <td> Horario de Funcionamento </td>
                        <td><input type ="text" name ="horario"/></td>
                    </tr>

                    <tr>
                        <td> Telefone </td>
                        <td><input type ="text" name ="telefone"/></td>
                    </tr>

                </table>
                <input type="submit" name="incluir" value="incluir" /> 
                <input type="submit" name="Cancelar" value="Cancelar" />
            </form> 
        </div>
    </body>
</html>

