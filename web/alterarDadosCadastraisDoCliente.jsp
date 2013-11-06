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
         <form action="alterarDadosCadastraisDoCliente.jsp" method="post">
        <% classes.transacoes.Usuarios u= new classes.transacoes.Usuarios();
               Vector ucliente=new Vector();
              ucliente= u.pesquisar((String)session.getAttribute("user_name"));
              UsuariosDO uclientelogado=new UsuariosDO();
         ClientesDO clientelogado= new ClientesDO();
         Clientes tn=new Clientes();
              uclientelogado = (UsuariosDO)ucliente.get(0);
              clientelogado=tn.buscarPorUsuarioID(uclientelogado.getId());
        
        %>
             
        
        Bem vindo <%= session.getAttribute("user_name") %>
        <!-- mostra os valores atuais -->
         <table>
            <tr>
               <td>Email</td>
               <td><input type="text" value=<%=clientelogado.getEmail()%> name="email" />
            </tr>
             <tr>
               <td>Endereco</td>
               <td><input type="text" value=<%=clientelogado.getEndereco()%> name="endereco" />
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
               <td><input type="text" value=<%=uclientelogado.getSenha()%> name="senha" />
            </tr>
          </table>
          <input type="submit" name="alterar" value="alterar" />
         <input type="submit" name="cancelar" value="cancelar" />
         </form>
         
         
         <!--   se apertar  "cancelar" volta para o menu do cliente -->

<%     if ( null != request.getParameter("cancelar")) {
%>        <jsp:forward page="meuCliente.html" />
<%        return;
       }
//se apertar alterar
if ( null != request.getParameterValues("alterar") ){
    // se nenhum dos campos estiverem vazios
    Posto p=new Posto();//criado para utilizar afuncao isEmpty
if (p.isEmpty(request.getParameter("senha"))|| p.isEmpty(request.getParameter("endereco")) || p.isEmpty(request.getParameter("email")) || p.isEmpty(request.getParameter("telefone"))|| p.isEmpty(request.getParameter("estado"))){

%>  Preencha todos campos!
<form action="alterarDadosCadastraisDoCliente.jsp" method="post">
    
     <input type="submit" name="Prosseguir" value="Prosseguir" />
     </form>

<%

}




else{
String email = request.getParameter("email");
       String endereco= request.getParameter("endereco");
       String telefone= request.getParameter("telefone");
       String estado= request.getParameter("estado");
       String senha= request.getParameter("senha");
       classes.transacoes.Clientes tf = new classes.transacoes.Clientes();
       classes.data.ClientesDO cli = new classes.data.ClientesDO();
       cli.setNome(clientelogado.getNome());//campo imutavel
       cli.setCPF(clientelogado.getCPF());//campo imutavel
       cli.setCNH(clientelogado.getCNH());//campo imutavel
       cli.setId(clientelogado.getId());//campo imutavel
       cli.setUsuarioId(clientelogado.getUsuarioId());//campo imutavel
       cli.setEmail(email);
       cli.setEndereco(endereco);
       cli.setEstado(estado);
       cli.setTelefone(telefone); 
       tf.atualizar(cli);
       uclientelogado.setSenha(senha);
       u.atualizar(uclientelogado);
       %>   Dados alterados com sucesso
       <!--cria botao voltar-->
       <form action="meuCliente.html" method="post">
    <input type="submit" name="voltar" value="voltar" />
       </form>
       <%    
// se apertar voltar volta pro menu do cliente

       }

}

%>




%>

        
    </body>
</html>
