<%-- <%-- 
    Document   : Estacionamento_cadastrarDados
    Created on : 24/11/2013, 12:07:51
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
        <title>Cadastrar veiculo</title>
        <%@include file="header.html"%>
    </head>
    <body>
        <div id="base">
            <div id ="cima"></div><%
                    
                    if (null != request.getParameter("voltar")) {
            %>        <jsp:forward page="OperadorSistema_administrarVeiculos.jsp" />
            <%        return;
                }
                
                    if (null != request.getParameter("confirmar")){
                        
                    boolean direcao = false;
                    boolean ar = false;
                    boolean freio = false;
                    boolean GPS = false;
                    boolean cambio = false;
                        
                        String marca = request.getParameter("marca");
                        String modelo = request.getParameter("modelo");
                        String ano = request.getParameter("ano");
                        String placa = request.getParameter("placa");
                        String quilometragem = request.getParameter("quilometragem");
                        String manutencao = request.getParameter("manutencao");
                        String motivo = request.getParameter("motivo");
                        
                        if (request.getParameter("direcao") != null){
                            direcao = true;
                        }
                        if (request.getParameter("ar") != null){
                            ar = true;
                        }
                        if (request.getParameter("freio") != null){
                            freio = true;
                        }
                        if (request.getParameter("GPS") != null){
                            GPS = true;
                        }
                        if (request.getParameter("cambio") != null){
                            cambio = true;
                        }
                        
                        VeiculosDO veiculo = new VeiculosDO();
                        classes.transacoes.Veiculos v = new classes.transacoes.Veiculos();
                       
                        if (v.isEmpty(placa) || v.isEmpty(quilometragem)  ){
                        %>Favor preencher todos os campos!<%
                        }                        
 
                        else{
                        veiculo.setId(1);
                        veiculo.setArCondicionado(ar);
                        veiculo.setCambioAutomatico(cambio);
                        veiculo.setDirecaoHidraulica(direcao);
                        veiculo.setEstado("Disponivel");
                        veiculo.setFreioABS(freio);
                        veiculo.setGPS(GPS);
                        veiculo.setModeloID(1);
                        veiculo.setPlaca(placa);
                        veiculo.setQuilometragem(Integer.parseInt(quilometragem));
                        
                        if(v.incluir(veiculo) == true){
                            %>Veiculo incluido com sucesso!
                            <form id="content" action="OperadorSistema_administrarVeiculos.jsp" method="post">
                            <input type="submit" name="voltar" value="voltar" />
                            </form>
                            <%
                           }
                    }
                        }
                %><h1>                    
                    <form id ="content" action ="Veiculo_cadastrar.jsp" method ="post">
                        <table border="0">
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
                                <td><input type="checkbox" name="outros" value="outros"/>Outros</td>                                
                                <td><textarea name="texto_outros" rows="4" cols="20">
                                    </textarea></td>                                
                            </tr>                          
                            <tr>
                                <td></td>
                                <td><input type="submit" name="confirmar" value="confirmar"/>  <input type="submit" value="voltar" name="voltar" /></td>
                            </tr>
                            <tr>
                                <td>*CRLV do veículo:</td>
                                <td><input type="file" name="CRLV" value="" width="15"/></td>
                            </tr>
                            <tr>
                                <td>*Campos marcados são obrigatórios</td>
                                <td></td>
                            </tr>
                            
                        </tbody>
                    </table>
                    </form>
                    
                </h1>
            </div>
  
    </body>
</html>
