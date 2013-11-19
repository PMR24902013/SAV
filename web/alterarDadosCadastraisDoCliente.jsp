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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados Cadastrais</title>
    </head>
    <body>
         <form action="./alterarDadosCadastraisDoCliente.jsp" method="post">
        <% classes.transacoes.Clientes c= new classes.transacoes.Clientes();
               Vector clientelogado=new Vector();
              clientelogado= c.pesquisar(session.getAttribute("user_name"))%>
        
        Bem vindo <%= session.getAttribute("user_name") %>
        <!-- mostra os valores atuais -->
         <table>
            <tr>
               <td>Email</td>
               <td><input type="text" value=clientelogado.getEmail() name="email" />
            </tr>
             <tr>
               <td>Endereco</td>
               <td><input type="text" value=clientelogado.getEndereco() name="endereco" />
            </tr>
          
             <tr>
               <td>Telefone</td>
               <td><input type="text" value=clientelogado.getTelefone() name="telefone" />
            </tr>
          
            <tr>
               <td>Estado</td>
               <td><input type="text" value=clientelogado.getEstado() name="estado" />
            </tr>
          </table>
          <input type="submit" name="alterar" value="alterar" />
         <input type="submit" name="cancelar" value="cancelar" />
         </form>
         
         
         <!--   se apertar  "cancelar" volta para o menu do cliente -->

<%     if ( null != request.getParameter("cancelar")) {
%>        <jsp:forward page="./verMenuDoCliente.jsp" />
<%        return;
       }
//se apertar alterar
if ( null != request.getParameterValues("alterar") ){
    // se nenhum dos campos estiverem vazios
if (request.getParameter("endereco")!= null && request.getParameter("email")!= null && request.getParameter("telefone")!= null && request.getParameter("estado")!= null){
String email = request.getParameter("email");
       String endereco= request.getParameter("endereco");
       String telefone= request.getParameter("telefone");
       String estado= request.getParameter("estado");
       classes.transacoes.Cliente tn = new classes.transacoes.Cliente();
       classes.data.ClienteDO cliente = new classes.data.ClienteDO();
       cliente.setEmail(email);
       cliente.setEndereco(endereco);
       cliente.setEstado(estado);
       cliente.setTelefone(telefone); 
       %>   Dados alterados com sucesso
       <!--cria botao voltar-->
    <input type="submit" name="voltar" value="voltar" />
       <%    
// se apertar voltar volta pro menu do cliente
if ( null != request.getParameter("voltar")) {
%>        <jsp:forward page="./verMenuDoCliente.jsp" />
<%        return;
       }

}
else{// se tiver campo vazio
%>
<jsp:forward page="./alterarDadosCadastraisDoCliente.jsp" /> 
Preencha todos os campos, por favor.
       <% return;

}
}
%>

        
    </body>
</html>
