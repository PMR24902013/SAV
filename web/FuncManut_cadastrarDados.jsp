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
    <%@ page import="classes.data.UsuariosDO" %>
    <%@ page import="classes.transacoes.Funcionario" %>
    <%@ page import="java.util.Vector" %>
    <! ------------------------------------------------------------>
    <!--   se for o request inicial, mostrar somente o formulario -->
    
    <%     if ( null == request.getParameterValues("incluir") ) {
    %>
       <form action="./IncluirFuncionarioManutencao.jsp" method="post">
           <b>Informações de login</b>
           <table>
            <tr>
                <td>Usuário</td>
                <td><input type="text" name="user" />
            </tr>       
            <tr>
                <td>Senha</td>
                <td><input type="password" name="password" />
            </tr>
            <tr>
                <td>Digite a senha novamente</td>
                <td><input type="password" name="validaPassword">
            </tr>
           </table>
           
           <b>Informações de cadastro</b>
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
       <form action="./index.html" method="post">
            <input type="submit" name="cancelar" value="cancelar" />
       </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->
<%     String user = request.getParameter("user");
       String senha = request.getParameter("password");
       String senhaValidacao = request.getParameter("validaPassword");
       
       if(!senha.equals(senhaValidacao)){
%>
       As senhas digitadas não conferem!            
          <form action="./IncluirFuncionarioManutencao.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%       }
       classes.transacoes.Usuarios tu = new classes.transacoes.Usuarios();
       classes.data.UsuariosDO usuario = new classes.data.UsuariosDO();
       usuario.setLogin(user);
       usuario.setSenha(senha);
       usuario.setTipo("OpManut");
       if(!tu.incluir(usuario)){
       
%>
       Erro ao adicionar usuário. Verifique os campos.
       <form action="./IncluirFuncionarioManutencao.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
       </form>
<%
       }
       Vector buscaUser = tu.pesquisar(user);
       UsuariosDO userCriado = new UsuariosDO();
       userCriado = (UsuariosDO)buscaUser.get(0);
       
       String nome = request.getParameter("nome");
       String cpf = request.getParameter("CPF");
       String email = request.getParameter("Email");
       String endereco = request.getParameter("Endereco");
       String telefone = request.getParameter("telefone");
       String estado = request.getParameter("estado");
       classes.transacoes.Funcionario tn = new classes.transacoes.Funcionario();
       classes.data.FuncionarioDO funcionario = new classes.data.FuncionarioDO();
       funcionario.setNome(nome);
       funcionario.setCPF(cpf);
       funcionario.setEmail(email);
       funcionario.setEndereco(endereco);
       funcionario.setTelefone(telefone); 
       funcionario.setEstado("Aguardando Aprovacao");
       funcionario.setCategoria("OpManut");
       funcionario.setId(userCriado.getId());
       if ( tn.incluirFuncionarioManutencao(funcionario)) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./index.html" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
           tu.excluir(userCriado);
%>
          Erro ao incluir usuário! Preencha os campos corretamente.            
          <form action="./IncluirFuncionarioManutencao.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
       }
%>
            
    </body>
</html>
