<%--
    Document   : Estacionamento_cadastrarDados
    Created on : 24/11/2013, 12:07:51
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar veiculo</title>
        <%@include file="headerOpSistema.html"%>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="classes.data.*" %>
        <div id="base">
            <div id ="cima"><div id = "logo"></div></div>
            <div id="tudo">
                <div id="contentRight">
                    <%

                        if (null != request.getParameter("voltar")) {
                    %>        <jsp:forward page="OperadorSistema_administrarVeiculos.jsp" />
                    <%        return;
                        }

                        if (null != request.getParameter("confirmar")) {

                            boolean direcao = false;
                            boolean ar = false;
                            boolean freio = false;
                            boolean GPS = false;
                            boolean cambio = false;
                            int modeloId;
                            int estacionamentoId;
                            int vagaId;

                            String marca = request.getParameter("marca");
                            String modelo = request.getParameter("modelo");
                            String ano = request.getParameter("ano");
                            String placa = request.getParameter("placa");
                            String quilometragem = request.getParameter("quilometragem");
                            String manutencao = request.getParameter("manutencao");
                            String motivo = request.getParameter("motivo");
                            String estacionamento = request.getParameter("estacionamento");
                            String numero_vaga = request.getParameter("numero_vaga");

                            if (request.getParameter("direcao") != null) {
                                direcao = true;
                            }
                            if (request.getParameter("ar") != null) {
                                ar = true;
                            }
                            if (request.getParameter("freio") != null) {
                                freio = true;
                            }
                            if (request.getParameter("GPS") != null) {
                                GPS = true;
                            }
                            if (request.getParameter("cambio") != null) {
                                cambio = true;
                            }

                            VeiculosDO veiculo = new VeiculosDO();
                            classes.transacoes.Veiculos v = new classes.transacoes.Veiculos();

                            if (v.isEmpty(placa) || v.isEmpty(quilometragem) || v.isEmpty(ano) || v.isEmpty(estacionamento) || v.isEmpty(numero_vaga)) {
                    %>Favor preencher todos os campos!<%
                                } else {
                                    //procurando o ID do modelo a partir do ano e do modelo digitados pelo usuario
                                    Modelos m = new Modelos();
                                    ModelosDO mod = new ModelosDO();
                                
                                    Vector modEncontrados = m.buscar(modelo, ano);
                                    
                                    if(modEncontrados.isEmpty()){
                                        mod.setAno(Integer.parseInt(ano));
                                        mod.setMarca(marca);
                                        mod.setModelo(modelo);
                                        m.incluir(mod);
                                        modEncontrados = m.buscar(modelo, ano);
                                        mod = (ModelosDO)modEncontrados.get(0);
                                        modeloId = mod.getId();
                                    }
                                    else{
                                        mod = (ModelosDO)modEncontrados.get(0);
                                        modeloId = mod.getId();
                                    }
                                    
                                    //encontrando o ID da vaga do veiculo a partir do estacionamento
                                    EstacionamentoDO estac = new EstacionamentoDO();
                                    Estacionamento e = new Estacionamento();
                                    
                                    Vector estacEncontrados = e.pesquisar(estacionamento);
                                    if(estacEncontrados.isEmpty()){
                                        %>Estacionamento não cadastrado, favor cadastrar...
                                        <form id="content1" action="OperadorSistema_administrarVeiculos.jsp" method="post">
                                        <input type="submit" name="voltar" value="voltar" />
                                        </form><%
                                    }
                                    else{
                                    estac = (EstacionamentoDO)estacEncontrados.get(0);
                                    estacionamentoId = estac.getId();
                                
                                    Vector vaga = new Vector();
                                    Vaga va = new Vaga();
                                    vagaDO vaga_do = new vagaDO();
                                    
                                    vaga = va.buscarPorNumero(Integer.parseInt(numero_vaga), estacionamentoId);
                                                                        
                                    if(vaga.isEmpty()){
                                        vaga_do.setEstacionamento_id(estacionamentoId);
                                        vaga_do.setEstado(true);
                                        vaga_do.setNumero(Integer.parseInt(numero_vaga));
                                        va.incluir(vaga_do);
                                        vaga = va.buscarPorNumero(Integer.parseInt(numero_vaga), estacionamentoId);
                                        vaga_do = (vagaDO)vaga.get(0);
                                        vagaId = vaga_do.getId();
                                    }
                                    else{
                                        vaga_do = (vagaDO)vaga.get(0);
                                        vagaId = vaga_do.getId();
                                    }    
                                    veiculo.setArCondicionado(ar);
                                    veiculo.setCambioAutomatico(cambio);
                                    veiculo.setDirecaoHidraulica(direcao);
                                    veiculo.setEstado("Disponivel");
                                    veiculo.setFreioABS(freio);
                                    veiculo.setGPS(GPS);
                                    veiculo.setModeloID(modeloId);
                                    veiculo.setPlaca(placa);
                                    veiculo.setQuilometragem(Integer.parseInt(quilometragem));
                                    veiculo.setVagaID(vagaId);

                                    if (v.incluir(veiculo) == true) {
                    %>Veiculo incluido com sucesso!
                    <form id="content1" action="OperadorSistema_administrarVeiculos.jsp" method="post">
                        <input type="submit" name="voltar" value="voltar" />
                    </form>
                    <%
                                }
                              }
                             }
                           }
                    %>                   
                    <form id ="content" action ="Veiculo_cadastrar.jsp" method ="post">
                        <table>
                            <thead>
                                <tr>
                                    <th>*Marca do carro:</th>
                                    <th><input type="text" name="marca" value="" size="15"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>*Modelo do carro:</td>
                                    <td><input type="text" name="modelo" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>*Ano do carro:</td>
                                    <td><input type="text" name="ano" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>*Placa do veículo:</td>
                                    <td><input type="text" name="placa" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>*Quilometragem:</td>
                                    <td><input type="text" name="quilometragem" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>*Estacionamento:</td>
                                    <td><input type="text" name="estacionamento" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>*Numero da Vaga:</td>
                                    <td><input type="text" name="numero_vaga" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>Última Manutenção em:</td>
                                    <td><input type="text" name="manutencao" value="" size="15"/></td>
                                </tr>
                                <tr>
                                    <td>Motivo:</td>
                                    <td><textarea name="motivo" rows="4" cols="20">
                                        </textarea></td>
                                </tr>
                                <tr>
                                    <td>*Lista de periféricos:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="direcao" value="direcao"/>Direção hidráulica</td>                                
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="ar" value="ar" />Ar condicionado</td>                                
                                    <td></td>                                
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="freio" value="freio"/>Freio ABS</td>                                
                                    <td></td>                                
                                </tr>                            
                                <tr>
                                    <td><input type="checkbox" name="GPS" value="GPS"/>GPS</td>                                
                                    <td></td>                                
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="cambio" value="cambio"/>Câmbio Automático</td>                                
                                    <td></td>                                
                                </tr>                       
                                <tr>
                                    <td></td>
                                    <td><input type="submit" name="confirmar" value="confirmar"/>  <input type="submit" value="voltar" name="voltar" /></td>
                                </tr>
                                <tr>
                                    <td>*CRLV do veículo:</td>
                                    <td><input type="file" name="CRLV"/></td>
                                </tr>
                                <tr>
                                    <td>*Campos marcados são obrigatórios</td>
                                    <td></td>
                                </tr>

                            </tbody>
                        </table>
                    </form>
                </div>
                <div id="contentLeft"></div>
                <div class="clear"> </div>

            </div>
        </div>
    </body>
</html>
