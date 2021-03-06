<%-- 
    Document   : IncluirFuncionarioManutencao
    Created on : 28/10/2013, 17:44:22
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Funcionário de Manutenção</title>
    </head>
    <body bgcolor="white">
    <!--%@ page import="classes.trasacoes.Funcionarios" %>
    <%@ page import="classes.data.FuncionarioDO" %>
    <! ------------------------------------------------------------>
    <!--   se for o request inicial, mostrar somente o formulario -->
    
    <%     if ( null == request.getParameterValues("incluir") ) {
    %>
       <form action="./IncluirFuncionarioManutencao.jsp" method="post">
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
                <td>CPF</td>
                <td><input type="text" name="CPF" />
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="Email" />
            </tr>
            <tr>
                <td>Endereco</td>
                <td><input type="text" name="Endereco" />
            </tr>
            <tr>
               <td>Telefone</td>
               <td><input type="text" name="telefone" />
            </tr>
          </table>
          <input type="submit" name="incluir" value="incluir" />
        </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->
<%     String nome = request.getParameter("nome");
       String cpf = request.getParameter("CPF");
       String email = request.getParameter("Email");
       String endereco = request.getParameter("Endereco");
       String telefone = request.getParameter("telefone");
       classes.transacoes.Funcionarios tn = new classes.transacoes.Funcionarios();
       classes.data.FuncionarioDO funcionario = new classes.data.FuncionarioDO();
       funcionario.setNome(nome);
       funcionario.setCPF(cpf);
       funcionario.setEmail(email);
       funcionario.setEndereco(endereco);
       funcionario.setTelefone(telefone); 
       funcionario.setEstado("1");
       funcionario.setCategoria("1");
       if ( tn.incluirFuncionarioManutencao(funcionario)) {
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
