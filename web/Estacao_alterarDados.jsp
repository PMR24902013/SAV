<%-- 
    Document   : AtualizarDadosDasEstacoes
    Created on : 28/10/2013, 18:24:01
    Author     : User
    VERIFICAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Dados Das Estações</title>
    </header>
    <body>
        <%@page import="classes.transacoes.Estacionamento"  %>
        <%@page import="classes.data.EstacionamentoDO" %>
        <! ------------------------------------------------------------>
        <!--   se for o request inicial, mostrar somente o formulario -->

        <%     if ( null == request.getParameterValues("incluir") ) {
        %>
            <form action="./Estacao_alterarDados.jsp" method="post">
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
                      <td>Nome Do Estacionamento</td>
                      <td><input type="text" name="nome" />
                 </tr>
                 <tr>
                     <td>Endereco</td>
                     <td><input type="text" name="Endereco" />
                 </tr>
                 <tr>
                     <td>Vagas</td>
                     <td><input type="text" name="Vagas" />
                 </tr>
                 <tr>
                     <td>Nome Do Responsável</td>
                     <td><input type="text" name="Responsavel" />
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


<%     classes.transacoes.Estacionamento tn = new classes.transacoes.Estacionamento();
       String estacionamento = (String)session.getAttribute("EstacionamentoAtualizar");
       classes.data.EstacionamentoDO estacionamentoAtualizar = new classes.data.EstacionamentoDO();
       estacionamentoAtualizar = tn.pesquisarPorNome(estacionamento, tn);
       request.setAttribute("nome", estacionamentoAtualizar.getNome());
       request.setAttribute("Endereco", estacionamentoAtualizar.getEndereco());
       request.setAttribute("Vagas", estacionamentoAtualizar.getVagas());
       request.setAttribute("Responsavel", estacionamentoAtualizar.getNome_Do_Responsavel());
       request.setAttribute("telefone", estacionamentoAtualizar.getTelefone());
       String nome = request.getParameter("nome");
       String endereco = request.getParameter("Endereco");
       String vagas = request.getParameter("Vagas");
       String responsavel = request.getParameter("Responsavel");
       String telefone = request.getParameter("telefone");
       classes.data.EstacionamentoDO estacionamento = new classes.data.EstacionamentoDO();
       estacionamento.setNome(nome);
       estacionamento.setEndereco(endereco);
       estacionamento.setVagas(vagas);
       estacionamento.setNome_Do_Responsavel(responsavel);
       estacionamento.setTelefone(telefone); 
       if ( tn.incluir(estacionamento)) {
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
