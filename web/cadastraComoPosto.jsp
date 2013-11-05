<%-- 
    Document   : cadastraComoPosto
    
/**
* Data:27/10/2013
* Autor:hidden
* Descricao:cadastra como posto
* Entradas:
Na primeira tela:cadastra login e senha. 
Na segunda tela: Nome do posto, string com até 200 caracteres.
 Local do posto, string com até 200 caracteres.
 Adicionar tipo de combustível vendido, string com até 20 caracteres.
 Adicionar preço cobrado pelo combustível, float.
 Nome do responsável pelo posto, string com até 200 caracteres.
 Documento de licenciamento do posto, upload de arquivo .jpeg
* Saidas:
O sistema mostra um aviso ao ator de que o cadastro foi enviado para análise e envia os dados do estacionamento para análise.
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
        <title>Cadastra como Posto</title>
    </head>
    <body>
         <form method="post" action=cadastraComoPosto.jsp>
       login <input type="text" name="login" />
       senha <input type="password" name="senha" />
       <input type="submit" name="enviar" value="Enviar" />
       <input type="hidden" name="campo_controle" />
       <input type="submit" name="Cancelar" value="Cancelar" />
    </form>
        
        <!--    "Cancelar"  vlta pro inicio -->
       

<%     if ( null != request.getParameter("Cancelar")) {
%>        <jsp:forward page="index.html" />
<%        return;
       }
%>
<%

    if ( request.getParameter("campo_controle") != null ) {
      // login a ser criado  
        String user = request.getParameter("login");
        // senha a ser criada
        String passwd = request.getParameter("senha");
        // metodo verifica se jah existe tal login
        
        classes.transacoes.Usuarios tn = new classes.transacoes.Usuarios();
       Vector usuarios = tn.pesquisar(user);
       //se existir avisar usuario
 if ( (usuarios != null) && (usuarios.size() > 0)|| passwd==null||user==null) {
      
%>
           
           login ou senha inválida
            <form action="cadastraComoPosto.jsp" method="post">
             <input type="submit" name="Voltarr" value="Voltar" />
          </form>
<%	   }
	else {UsuariosDO pusuario= new UsuariosDO();
        // cria um novo usuario
        pusuario.setLogin(user);
        pusuario.setSenha(passwd);
        pusuario.setTipo("Posto");
        tn.incluir(pusuario);
  session.setAttribute("user_name", user);
  
           %>
            <jsp:forward page="cadastrarComoPostoORetorno.jsp" />
             <form action="cadastraComoPosto.jsp" method="post">
                 
                 Login criado, insira seus dados
           <table>
            <tr>
               <td>Nome do Posto</td>
               <td><input type="text" name="nome" />
            </tr>
            <tr>
               <td>Local do Posto</td>
               <td><input type="text" name="local" />
            </tr>
            <tr>
            <td>Nome do Dono</td>
               <td><input type="text" name="dono" />
            </tr>
            <tr>
            <td>Documento de licensiamento</td>
            <!--nao sei como fazer pra carregar -->
<td><input type="file"   />
              
            </tr>
             <tr>
            <td>Telefone</td> 
</tr>
<tr>
               <td><input type="text" name="telefone" /> 
             <tr>
            <td>Horario de Funcionamento</td> 
</tr>
<tr>
               <td><input type="text" name="horario" /> 
            
           
           
          
          </table>
                  <input type="submit" name="incluir" value="incluir" /> 
            <input type="hidden" name="why" />
           
        
                 <input type="submit" name="Cancelar" value="Cancelar" />
        </form> 
           
           <%
     if ( null != request.getParameter("why")){
      
        String nome = request.getParameter("nome");
       
        String local = request.getParameter("local");
        
        String dono = request.getParameter("dono");
        String telefone = request.getParameter("telefone");
        String horario = request.getParameter("horario");
        PostoDO p=new PostoDO();
       //arrumar  arquivo 
        Vector ps = tn.pesquisar(user);
        UsuariosDO postocriado =new UsuariosDO();
       postocriado = (UsuariosDO)ps.get(0);
       
        
    p.setUsuariosID(postocriado.getId());
    
   p.setNome(nome);
    
    p.setEndereco(local);
    
   p.setTelefone(telefone);
     p.setHorario(horario);
     p.setResponsavel(dono);
    
       p.setDocumento("sei lah");
     classes.transacoes.Posto po = new classes.transacoes.Posto();
     po.incluir(p);
       
    %> Seus dados foram cadastrados com sucesso!
    <jsp:forward page="index.html" />
    
    <%    
     }
 }
   
    
    }%>
        
  
    </body>
</html>
