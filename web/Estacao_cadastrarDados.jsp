<%-- 
    Document   : CadastrarEstacaoPropria
    Created on : 29/10/2013, 09:24:38
    Author     : professorpmr
--%>

<%@page import="classes.data.UsuariosDO"%>
<%@page import="classes.transacoes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.transacoes.Estacao" %>
<%@ page import="classes.data.EstacionamentoDO" %>
<%@page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Estação Propria</title>
        <%@include file="header.html" %>
    </head>
    
    <body>
        <div id="base">
            <div id="cima"></div>
            <div id="tudo">
                
    <% if (null != request.getParameter("incluir")){
        String nome = request.getParameter ("nome");
        String endereco = request.getParameter ("endereco");
        String cep = request.getParameter ("cep");
        String telefone = request.getParameter ("telefone");
        
        EstacionamentoDO edo = new EstacionamentoDO();
        
        String nomeatual = (String)session.getAttribute ("user_name");
        
        Usuarios tn = new Usuarios();
        Vector es = tn.pesquisar(nomeatual);
        UsuariosDO estacaocriada = new UsuariosDO();
        estacaocriada = (UsuariosDO)es.get(0);
        
        Estacao e = new Estacao();
        
       if (e.isEmpty(nome) || e.isEmpty(endereco) || e.isEmpty(cep) || e.isEmpty(telefone)){ 
    %>
    
    Preencha todos os campos!
    
    <form action="Estacao_cadastrarDados.jsp" method="post">
        <input type="submit" name="Prosseguir" value="Prosseguir">
    </form>
    
    <% 
       }
       else {
            edo.setUsuario_Id (estacaocriada.getId());
            edo.setNome (nome);
            edo.setEndereco (endereco);
            edo.setCEP (cep);
            
            
            
            
       }
        
        
        
        
    }
    </body>
    <%     if ( null == request.getParameterValues("incluir") ) {
    %>
       <form action="./Estacao_cadastrarDados.jsp" method="post">
    <%
        // VERIFICACAO MANUAL DO LOGIN
        if ( session.getAttribute("user_name") == null) {
           pageContext.forward("index.jsp");
        }
        
        String nome = (String)session.getAttribute("user_name");
    %>
        Bom dia <%= nome %> !!

           <table>
            <tr>
               <td>Nome</td>
               <td><input type="text" name="nome" />
            </tr>
            <tr>
                <td>Endereco</td>
                <td><input type="text" name="Endereco" />
            </tr>
            <tr>
                <td>Bairro</td>
                <td><input type="text" name="Bairro" />
            </tr>
            <tr>
                <td>CEP</td>
                <td><input type="text" name="CEP" />
            </tr>
            <tr>
               <td>Telefone</td>
               <td><input type="text" name="Telefone" />
            </tr>
          </table>
          <input type="submit" name="incluir" value="incluir" />
        </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->
<%     String nome = request.getParameter("Nome");
       String endereco = request.getParameter("Endereco");
       String bairro = request.getParameter("Bairro");
       String cep = request.getParameter("CEP");
       String telefone = request.getParameter("Telefone");
       endereco = endereco + " - " + bairro;
       classes.transacoes.Estacao tEst = new classes.transacoes.Estacao();
       classes.data.EstacionamentoDO estacionamento = new classes.data.EstacionamentoDO();
       //Arrumar sentenças abaixo:
       estacionamento.setNome(nome);
       estacionamento.setEndereco(endereco);
       estacionamento.setTelefone(telefone); 
       
       if (tEst.incluir(estacionamento)) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao incluir usuário            
          <form action="./insert.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
       }
%>
            
    </body>
</html>

    