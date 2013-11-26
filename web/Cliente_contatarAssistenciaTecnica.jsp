<%-- 
    Document   : contatarAssistenciaTecnica
    Created on : 10/11/2013, 00:00:54
    Author     : hidden
* Entradas:
 local que está o veículo ,e o defeito 

* Saidas:
O sistema mostra um aviso ao ator de que o pedido de assistencia foi registrado.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contatar assistencia tecnica</title>
        <%@ include file="headerCliente.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <%
                    if (null == request.getParameter("Confirmar")) {
                %>
                <form  id="contentRight" method="post" action=Cliente_contatarAssistenciaTecnica.jsp>
                    <table>
                        <tr>
                            <td>Localizacao atual do veiculo</td><td> <input type="text" name="local" /></td>
                        </tr>
                        <tr>
                            <td>Defeito</td><td> <input type="text" name="defeito" /></td>
                        </tr>
                    </table>
                    <input type="submit" name="Cancelar" value="Cancelar" />
                    <input type="submit" name="Confirmar" value="Confirmar" />
                    <input type="hidden" name="campo_controle" />
                </form>

                <!--    "Cancelar"  vlta pro inicio -->
                <% }
                    if (null != request.getParameter("Cancelar")) {
                %>        <jsp:forward page="Cliente_menu.html" />
                <%        return;
                    }
                 if (request.getParameter("Confirmar") != null) {

                        String local = request.getParameter("local");

                        String defeito = request.getParameter("defeito");

                        Posto util = new Posto();
                        if (util.isEmpty(local) || util.isEmpty(defeito)) {

                %>


                <form  id="contentRight" action="Cliente_contatarAssistenciaTecnica.jsp" method="post">
                    Preencha todos os campos!
                </form>
                <%} else {
                    AssistenciaTecnicaDO assist = new AssistenciaTecnicaDO();
                    Usuarios tn = new Usuarios();

                    // cria uma nova assistencia
                    assist.setEndereco(local);
                    assist.setQueixa(defeito);
                    assist.setData("2013/11/10");//precisamos ver como conseguir a data atual
                    assist.setEstadoFinal("Aguardando");
                    //assist.setFuncionarioID(11);//precisamos ver como escolhemos o funcionario
                    String user = (String) session.getAttribute("user_name");//pega o nome do user atual
                    Vector ps = tn.pesquisar(user);// procura ele na tabela
                    UsuariosDO useratual = new UsuariosDO();
                    useratual = (UsuariosDO) ps.get(0);
                    int userid = useratual.getId();//pega o Id dele
                    Clientes cliente = new Clientes();
                    ClientesDO cli = new ClientesDO();
                    cli = cliente.buscarPorUsuarioID(userid);// acha o cliente através do id de user
                    assist.setClienteID(cli.getId());// atrela o ID do cliente ah assistencia tecnica
                    AssistenciaTecnica at = new AssistenciaTecnica();
                    at.incluir(assist);


                %>
                <form  id="contentRight" action="Cliente_menu.html" method="post">
                    O seu chamado foi registrado, você será contatado e breve.
                    <input type="submit" name="Voltar" value="Voltar" />
                </form>
                <%                    }
                    }%>
                <div id="contentLeft"></div>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
</body>
</html>
