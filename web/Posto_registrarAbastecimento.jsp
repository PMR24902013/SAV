<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar abastecimento</title>
        <%@ include file="headerPosto.html" %>
        <%@ page import="classes.data.*" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="java.util.*"%>
        <%@ page import="java.sql.*"%>

        <%
            Vector modelos = new Vector();
            Modelos m = new Modelos();
            modelos = m.pesquisarTodos();
            Vector veiculos = new Vector();
            Veiculos v = new Veiculos();
            veiculos = v.pesquisarTodos();
        %>

        <style>
            .fixed-size{
                width: 150px;
            }
        </style>

        <script>

            var mod;
            var jsPlaca;

            function onModeloSelect(chosen) {
                var selbox = document.forms[0].carroAbastecido;
                selbox.options.length = 0;
                mod = chosen;
            <%
                for (int i = 0; i < veiculos.size(); i++) {
            %>if(mod == <%=((VeiculosDO) veiculos.elementAt(i)).getModeloID()%>){
                        selbox.options[selbox.options.length] = new Option("<%=((VeiculosDO) veiculos.elementAt(i)).getPlaca()%>",<%=((VeiculosDO) veiculos.elementAt(i)).getModeloID()%>);
                    }
            <%
                }
            %>
                }

                function onPlacaSelect() {
                    jsPlaca = document.getElementByName("carroAbastecido").value;
                }

        </script>
    </head>
    <body>

        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <div id="contentRight">
                    <form id="content" method="post">
                        <%
                            if (null != request.getParameter("concluir")) {
                                String nomeDoCliente = request.getParameter("cliente");
                                String veiculoID = request.getParameter("carroAbastecido");
                                String combustivel = request.getParameter("combustivel");
                                String litros = request.getParameter("litros");
                                String preco = request.getParameter("preco");
                                java.util.Date jDate = new java.util.Date();
                                java.sql.Time time = new java.sql.Time(jDate.getTime());
                                java.sql.Date data = new java.sql.Date(jDate.getTime());
                                Clientes cTransacao = new Clientes();
                                ClientesDO cliente = cTransacao.buscar(nomeDoCliente);
                                if (cliente != null && !litros.isEmpty() && !preco.isEmpty()) {
                                    Usuarios uTransacao = new Usuarios();
                                    Vector usuario = uTransacao.pesquisar((String) session.getAttribute("user_name"));
                                    Posto pTransacao = new Posto();
                                    PostoDO posto = pTransacao.buscarPorUsuarioID(((UsuariosDO) usuario.elementAt(0)).getId());

                                    Operacoes_de_Caixa ocTransacao = new Operacoes_de_Caixa();
                                    Operacoes_de_CaixaDO oc = new Operacoes_de_CaixaDO();
                                    oc.setValorDoPagamento(Float.parseFloat(preco) * Float.parseFloat(litros));
                                    oc.setDataDoPagamento(data);
                                    oc.setEstado("Aberto");
                                    oc.setUsuarioID(cliente.getId());

                                    ocTransacao.incluir(oc);
                                    int ocId = ocTransacao.lastId();

                                    Consumo_de_Combustivel ccTransacao = new Consumo_de_Combustivel();
                                    Consumo_de_CombustivelDO cc = new Consumo_de_CombustivelDO();
                                    cc.setOperacoesDeCaixaID(ocId);
                                    cc.setPostoId(posto.getID());
                                    cc.setTipo(combustivel);
                                    cc.setQuantidade(Float.parseFloat(litros));
                                    cc.setPrecoTotal(Float.parseFloat(preco) * Float.parseFloat(litros));
                                    cc.setHorario(time);

                                    ccTransacao.incluir(cc);
                                    %><jsp:forward page="Posto_menu.html" /><%
                                } else if(cliente == null){
                                    %><p style="text-align: center; color: red;">Cliente inválido!</p><%
                                } else if(litros.isEmpty()){
                                    %><p style="text-align: center; color: red;">Inserir quantidade abastecida!</p><%
                                } else if(preco.isEmpty()){
                                    %><p style="text-align: center; color: red;">Inserir preço!</p><%
                                }
                            }
                        %>
                        <table>
                            <tr>
                                <th>Cliente</th>
                                <th><input type="text" name="cliente"/>
                            </tr>
                            <tr>
                                <th>Modelo</th>
                                <th>
                                    <select name="modelo" class="fixed-size" onchange="onModeloSelect(this.options[this.selectedIndex].value);">
                                        <option selected="selected" disabled>Selecione</option>
                                        <%
                                            for (int i = 0; i < modelos.size(); i++) {
                                                ModelosDO modelo = (ModelosDO) modelos.elementAt(i);
                                                String name = (String) modelo.getModelo();
                                                int ano = (int) modelo.getAno();
                                                int id = modelo.getId();
                                        %><option value=<%=id%>><%=name%> <%=ano%></option><%
                                            }
                                        %>
                                    </select>
                                </th>
                            </tr>
                            <tr>
                                <th>Carro abastecido</th>
                                <th>
                                    <select name="carroAbastecido" class="fixed-size" onChange="onPlacaSelect();">
                                        <option selected="selected" disabled>Preencha acima</option>
                                    </select>
                                </th>
                            </tr>
                            <tr>
                                <th>Tipo de combustível</th>
                                <th><select class="fixed-size" name="combustivel">
                                        <option value="gasolina">Gasolina</option>
                                        <option value="alcool">Álcool</option>
                                    </select>
                                </th>
                            </tr>
                            <tr>
                                <th>Litros abastecidos</th>
                                <th><input type='text' name='litros'/>
                            </tr>
                            <tr>
                                <th>Preço por litro</th>
                                <th><input type='text' name='preco'>
                            </tr>
                        </table>
                        <input name="concluir" value="Concluir" type="submit"/>
                    </form>
                    <form action="Posto_menu.html"><input name="cancelar" value="Cancelar" type="submit"/></form>
                </div>

                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
