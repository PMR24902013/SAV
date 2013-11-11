<%-- 
    
    
/**
* Data:11 /11/2013
* Autor:Augusto
* Descricao:altera os dados cadastrais do motorista
* Entradas:

    
    
    email CHAR(30) NULL,
    Endereco CHAR(30) NULL,
    Telefone CHAR(30) NULL,
    
    Estado CHAR(30) NULL,
* Saidas:confirmação da atualização e disposicao do botao para voltar a tela inicial

*/
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados Cadastrais</title>
    </head>
    <body>
         <form action="Motorista_alterarDados.jsp" method="post">
        <% 
        classes.transacoes.Funcionario f = new classes.transacoes.Funcionario();
               Vector tn=new Vector();
             
              UsuariosDO usuariologado = new UsuariosDO();
              Usuarios users=new Usuarios();
              tn=users.pesquisar((String)session.getAttribute("user_name"));
               usuariologado=(UsuariosDO)tn.get(0);
              
       FuncionarioDO funcionariologado= new FuncionarioDO();
       funcionariologado = f.buscarPorUsuarioID(usuariologado.getId());%>
         
        Bem vindo <%= session.getAttribute("user_name") %>
        <!-- mostra os valores atuais -->
         <table>
            <tr>
               <td>Email</td>
               <td><input type="text" value=<%=funcionariologado.getEmail()%> name="email" />
            </tr>
             <tr>
               <td>Endereco</td>
               <td><input type="text" value="<%=funcionariologado.getEndereco()%>" name="endereco" />
            </tr>
          
             <tr>
               <td>Telefone</td>
               <td><input type="text" value=<%=funcionariologado.getTelefone()%> name="telefone" />
            </tr>
          
           
             <tr>
               <td>Senha</td>
               <td><input type="text" value=<%=usuariologado.getSenha()%> name="senha" />
            </tr>
          </table>
          <input type="submit" name="alterar" value="alterar" />
         <input type="submit" name="cancelar" value="cancelar" />
         </form>
         
         
         <!--   se apertar  "cancelar" volta para o menu do motorista -->

<%     if ( null != request.getParameter("cancelar")) {
%>        <jsp:forward page="Motorista_menu.html" />
<%        
       }
//se apertar alterar
if ( null != request.getParameterValues("alterar") ){
    // se tiver campo vazio
    Posto p = new Posto();
if (p.isEmpty(request.getParameter("endereco")) || p.isEmpty(request.getParameter("email")) || p.isEmpty(request.getParameter("telefone")) ||p.isEmpty(request.getParameter("senha"))){
%>
Preencha todos os campos, por favor.
<form action="Cliente_alterarDados.jsp" method="post">
    <input type="submit" name="voltar" value="voltar" />
       </form>


       <%

}
else{//se nao tiver
    String email = request.getParameter("email");
       String endereco= request.getParameter("endereco");
       String telefone= request.getParameter("telefone");
       
       String senha= request.getParameter("senha");
       
       
       funcionariologado.setEmail(email);
       funcionariologado.setEndereco(endereco);
       
       funcionariologado.setTelefone(telefone);
      f.atualizar(funcionariologado);
       usuariologado.setSenha(senha);
       users.atualizar(usuariologado);
       %>   Dados alterados com sucesso
       <!--cria botao voltar-->
       <form action="Cliente_menu.html" method="post">
    <input type="submit" name="voltar" value="voltar" />
       </form>
       <%    

       
 

}
}
%>

        
    </body>
</html>