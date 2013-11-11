<%-- 
    
    
/**
* Data:27/10/2013
* Autor:hidden
* Descricao:altera os dados cadastrais do cliente
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
         <form action="Cliente_alterarDados.jsp" method="post">
        <% 
        classes.transacoes.Clientes c= new classes.transacoes.Clientes();
               Vector tn=new Vector();
             
              UsuariosDO usuariologado= new UsuariosDO();
              Usuarios users=new Usuarios();
              tn=users.pesquisar((String)session.getAttribute("user_name"));
               usuariologado=(UsuariosDO)tn.get(0);
              
       ClientesDO clientelogado= new ClientesDO();
       clientelogado=c.buscarPorUsuarioID(usuariologado.getId());%>
        
        Bem vindo <%= session.getAttribute("user_name") %>
        <!-- mostra os valores atuais -->
         <table>
            <tr>
               <td>Email</td>
               <td><input type="text" value=<%=clientelogado.getEmail()%> name="email" />
            </tr>
             <tr>
               <td>Endereco</td>
               <td><input type="text" value="<%=clientelogado.getEndereco()%>" name="endereco" />
            </tr>
          
             <tr>
               <td>Telefone</td>
               <td><input type="text" value=<%=clientelogado.getTelefone()%> name="telefone" />
            </tr>
          
            <tr>
               <td>Estado</td>
               <td><input type="text" value=<%=clientelogado.getEstado()%> name="estado" />
            </tr>
             <tr>
               <td>Senha</td>
               <td><input type="text" value=<%=usuariologado.getSenha()%> name="senha" />
            </tr>
          </table>
          <input type="submit" name="alterar" value="alterar" />
         <input type="submit" name="cancelar" value="cancelar" />
         </form>
         
         
         <!--   se apertar  "cancelar" volta para o menu do cliente -->

<%     if ( null != request.getParameter("cancelar")) {
%>        <jsp:forward page="Cliente_menu.html" />
<%        
       }
//se apertar alterar
if ( null != request.getParameterValues("alterar") ){
    // se tiver campo vazio
    Posto p = new Posto();
if (p.isEmpty(request.getParameter("endereco")) || p.isEmpty(request.getParameter("email")) || p.isEmpty(request.getParameter("telefone")) || p.isEmpty(request.getParameter("estado"))||p.isEmpty(request.getParameter("senha"))){
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
       String estado= request.getParameter("estado");
       String senha= request.getParameter("senha");
       
       
       clientelogado.setEmail(email);
       clientelogado.setEndereco(endereco);
       clientelogado.setEstado(estado);
       clientelogado.setTelefone(telefone);
      c.atualizar(clientelogado);
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
