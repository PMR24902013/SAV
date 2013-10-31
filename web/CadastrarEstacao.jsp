<%-- 
    Document   : CadastrarEstacaoPropria
    Created on : 29/10/2013, 09:24:38
    Author     : professorpmr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Estação Propria</title>
    </head>
    <body bgcolor="white">
    <%@ page import="classes.trasacoes.Estacao" %>
    <%@ page import="classes.data.EstacaoDO" %>
    <! ------------------------------------------------------------>
    <!--   se for o request inicial, mostrar somente o formulario -->
    
    <%     if ( null == request.getParameterValues("incluir") ) {
    %>
       <form action="./CadastrarEstacaoPropria.jsp" method="post">
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
       String bairro = request.getParameter("Bairro")
       String cep = request.getParameter("CEP");
       String telefone = request.getParameter("Telefone");
       classes.transacoes.Estacao tn = new classes.transacoes.Estacao();
       classes.data.EstacaoDO funcionario = new classes.data.EstacaoDO();
       contato.setNome(nome);
       contato.setEndereco(endereco);
       contato.setBairro(bairro);
       contato.setCEP(cep);
       contato.setTelefone(telefone); 
       
       if ( estacao.CadastrarEstacaoPropria(estacao)) {
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

    