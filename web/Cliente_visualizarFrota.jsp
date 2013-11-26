<%-- 
    Document   : verCarros.jsp
    Created on : 25/11/2013, 14:31
    Author     : Lígia
    Descrição  : Mostrar para o visitante/cliente uma tabela com descrição, quantidade e localização dos veículos.
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Frota</title>
        <%@ include file="headerCliente.html" %>
    </head>
    <body>
         <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.*" %>
        <%@page import="classes.transacoes.*"  %>
        <%@page import="classes.data.*" %>
        <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Arrays" %>
        
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
            <div id="contentRight">
            <%
            ArrayList <String> modelo = new ArrayList<String>();
            ArrayList <String> marca = new ArrayList<String>();
            ArrayList <String> ano = new ArrayList<String>();
            ArrayList <String> estacionamento = new ArrayList<String>();
            ArrayList <String> placa = new ArrayList<String>();
            ArrayList <String> endereco = new ArrayList<String>();
            ArrayList <String> arcondicionado = new ArrayList<String>();
            ArrayList <String> direcaohidraulica = new ArrayList<String>();
            ArrayList <String> freioabs = new ArrayList<String>();
            ArrayList <String> gps = new ArrayList<String>();
            ArrayList <String> cambioauto = new ArrayList<String>();
            int estacionamentoID;
            int modeloID;
            VeiculosDO veiculo = new VeiculosDO();
            ModelosDO mod = new ModelosDO();
            Modelos m = new Modelos();
            EstacionamentoDO est = new EstacionamentoDO();
            Estacionamento e = new Estacionamento();
            
            
            Vector vdisp = new Vector();
            Veiculos vd = new Veiculos();
            vdisp = vd.buscarPorEstado("Disponivel");
            
            for (int cont=0; cont<vdisp.size() ; cont++ ){
                veiculo = (VeiculosDO)vdisp.get(cont);
                estacionamentoID=veiculo.getEstacionamentoID();
                modeloID=veiculo.getModeloID();
                arcondicionado.add(String.valueOf(veiculo.getArCondicionado()));
                direcaohidraulica.add(String.valueOf(veiculo.getDirecaoHidraulica()));
                freioabs.add(String.valueOf(veiculo.getFreioABS()));
                gps.add(String.valueOf(veiculo.getGPS()));
                cambioauto.add(String.valueOf(veiculo.getCambioAutomatico()));
                placa.add(veiculo.getPlaca());
            
                mod = m.pesquisarModelo(modeloID);
               marca.add(mod.getMarca());
               modelo.add(mod.getModelo());
               ano.add(String.valueOf(mod.getAno()));
            
               est = e.buscar(estacionamentoID);
                estacionamento.add(est.getNome());
                endereco.add(est.getEndereco());
            }
            
           
            %>
            
            <table>
                <tr>
                    <td><strong>ESTACIONAMENTO</strong></td>
                    <td><strong>ENDEREÇO</strong></td>
                    <td><strong>PLACA</strong></td>
                    <td><strong>MODELO</strong></td>
                    <td><strong>MARCA</strong></td>
                    <td><strong>ANO</strong></td>
                    <td><strong>OPCIONAIS</strong></td>
                </tr>
                
                <%
            for (int j = 0 ; j < modelo.size() ; j++){%>
            <tr>
                <td><%=estacionamento.get(j)%></td>
                <td><%=endereco.get(j)%></td>
                <td><%=placa.get(j)%></td>
                <td><%=modelo.get(j)%></td>
                <td><%=marca.get(j)%></td>
                <td><%=ano.get(j)%></td>
                <td>
                <% if(arcondicionado.get(j)=="true"){
                    %>
                    Ar condicionado 
                    <%
                }%>
                <% if(direcaohidraulica.get(j)=="true"){
                    %>
                    Direção hidráulica; 
                    <%
                }%>
                <% if(freioabs.get(j)=="true"){
                    %>
                    Freios ABS; 
                    <%
                }%>
                <% if(gps.get(j)=="true"){
                    %>
                    GPS; 
                    <%
                }%>
                <% if(cambioauto.get(j)=="true"){
                    %>
                    Câmbio automático; 
                    <%
                }%>
                </td>
            </tr>
            <%                
            }%>
            
            </table>
            
            </div>
            <div id="contentLeft"></div>
            <div class="clear"></div>
        </div>
    </div>
    </body>
</html>
