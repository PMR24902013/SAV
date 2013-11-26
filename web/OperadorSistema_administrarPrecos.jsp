<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.util.Vector" %>
        <%@ page import="classes.transacoes.*" %>
        <%@ page import="classes.data.*" %>
        <%@ page import="java.util.Date" %>
        <title>Administrar Preços</title>
        <%@ include file="headerOpSistema.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>

            <div id="tudo">
                <div id="contentRight">
                    <h1>Selecione o veículo a consultar</h1>
                   
                                     
                        <%
                            String action = request.getParameter("action");
                            int i = 1;
                            int modeloId;
                            int ano;
                            int veiculoId;
                            String modelo;
                            
                            Precos p = new Precos();
                            PrecosDO precos = new PrecosDO();
                            
                            VeiculosDO veiculos = new VeiculosDO();
                            Veiculos v = new Veiculos();
                            
                            Modelos m = new Modelos();
                            ModelosDO modelos = new ModelosDO();
                            precos = p.buscar(i);
                            
                                                       
                            if(null == action){
                         %><table>
                        <tr>
                            <td><strong>Veículo</strong></td>
                            <td><strong>Ano</strong></td>
                        </tr><%
                                action = "showSearchForm";
                            while (precos != null){
                                veiculoId = precos.getModeloId();
                                veiculos = v.buscar(veiculoId);
                                modeloId = veiculos.getModeloID();
                                modelos = m.buscar(modeloId);
                                ano = modelos.getAno();
                                modelo = modelos.getModelo();
                                %>
                                <tr>
                                    <td><%=modelo%></td>
                                    <td><%=ano%></td>
                                    <td><a href=OperadorSistema_administrarPrecos.jsp?action=showModeloEditForm&id=<%= i%>>Administrar</a></td>
                                </tr>
                                <%
                                i++;
                                precos = p.buscar(i);
                            }
                           }
                             if(action.equals("showModeloEditForm")){
                                 
                                 
                                %>
                                <form id="content" action="OperadorSistema_administrarPrecos.jsp" method="post">
                                Periodo de utilizacao                                         Preços em reais<br><br>
                                
                                até 100km por mês                                               <input type="text" name ="ate100" </input><br><br>
                                até 100km a 200km por mês                                       <input type="text" name ="ate200" </input><br><br>
                                até 200km a 300km por mês                                       <input type="text" name ="ate300" </input><br><br>
                                até 300km a 400km por mês                                       <input type="text" name ="ate400" </input><br><br>
                                até 400km a 500km por mês                                       <input type="text" name ="ate500" </input><br><br>
                                valor acrescido para cada 100km acima de 500km por mês          <input type="text" name ="acima500" </input><br><br>
                                <input type ="submit" name="Atualizar" value="Atualizar">           <input type="submit" name="Voltar" value="Voltar">
                                </form><%
                                if(request.getParameter("Atualizar") != null){
//                                      float ate100 = Float.valueOf(request.getParameter("ate100"));
//                                      float ate200 = Float.valueOf(request.getParameter("ate200"));
//                                      float ate300 = Float.valueOf(request.getParameter("ate300"));
//                                      float ate400 = Float.valueOf(request.getParameter("ate400"));
//                                      float ate500 = Float.valueOf(request.getParameter("ate500"));
//                                      float acima500 = Float.valueOf(request.getParameter("acima500"));
//                                      
//                                      precos.setId(Integer.parseInt(request.getParameter("id")));
//                                      precos.setModeloId(Integer.parseInt(request.getParameter("id")));
//                                      precos.setPreco1(ate100);
//                                      precos.setPreco2(ate200);
//                                     precos.setPreco3(ate300);
//                                      precos.setPreco4(ate400);
//                                      precos.setPreco5(ate500);
//                                      precos.setPreco6(acima500);
                                      
//                                      if(p.atualizar(precos) == true){
                                    %>Dado alterado com sucesso!<br>
                                          <input type="submit" name="Voltar" value="Voltar">
                                          <%
                                
                              }
                                if(request.getParameter("Voltar") != null){
                               %> <jsp:forward page="OperadorSistema_administrarPrecos.jsp" /><%
                            }
                             }
                             %>
                    </table>
                </div>
                <div id="contentLeft"></div>
            </div>
        </div>
    </body>
</html>
