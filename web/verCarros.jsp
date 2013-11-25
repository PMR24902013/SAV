<%-- 
    Document   : verCarros.jsp
    Created on : 24/11/2013, 15:55
    Author     : Lígia
    Descrição  : Mostrar para o visitante/cliente uma tabela com descrição, quantidade e localização dos veículos.
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verCarros</title>
        <%@ include file="header.html" %>
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
            <div id ="cima"></div>
            
            <%
            ArrayList <String> modelo = new ArrayList<String>();
            ArrayList <String> marca = new ArrayList<String>();
            ArrayList <String> ano = new ArrayList<String>();
            ArrayList <String> estacionamento = new ArrayList<String>();
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
            
                mod = m.pesquisarModelo(modeloID);
               marca.add(mod.getMarca());
               modelo.add(mod.getModelo());
               ano.add(String.valueOf(mod.getAno()));
            
               est = e.buscar(estacionamentoID);
                estacionamento.add(est.getNome());
                endereco.add(est.getEndereco());
            }
            
           /*  
            int i = 1;
            ModelosDO modelos = new ModelosDO();
            Modelos m = new Modelos();
            modelos = m.pesquisarModelo(i);
            while( modelos != null){
                modelo.add(modelos.getModelo());
                marca.add(modelos.getMarca());
                ano.add(String.valueOf(modelos.getAno()));
                i ++;
                modelos = m.pesquisarModelo(i);
            
            
            EstacionamentoDO estac = new EstacionamentoDO();
            Estacionamento e = new Estacionamento ();
            estac = e.buscarPorUsuarioID(idobj);
            while (estac != null){
                estacionamento.add()
            }
            
            VeiculosDO veiculos = new VeiculosDO();
            Veiculos v = new Veiculos ();
            veiculos = v.buscarPorEstado(estado);
            
            }*/
            %>
            
            <table>
                <tr>
                    <td><strong>ESTACIONAMENTO</strong></td>
                    <td><strong>ENDEREÇO</strong></td>
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
            
           <% /*if(null != request.getParameter("voltarMenu")){
                response.sendRedirect(request.getContextPath() + "/index.html");
                return;
            }*/
            %>
            
            <form name="content" action="index.html">
                <input type="submit" name="Voltar" value="Voltar">
            </form>
            
            </div>
    </body>
</html>
