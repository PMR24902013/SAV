<%-- 
    Document   : AlterarCadastroPosto
    Created on : 29/10/2013, 09:51:57
    Author     : professorpmr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados Cadastrais do Posto</title>
    </head>
    <body>
        <%@page import="classes.transacoes.Posto"  %>
        <%@page import="classes.data.PostoDO" %>
        <! ------------------------------------------------------------>
        <!--   se for o request inicial, mostrar somente o formulario -->

        <%     if ( null == request.getParameterValues("incluir") ) {
        %>
            <form action="./AlterarCadastroPosto.jsp" method="post">
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
                      <td>Nome Do Posto</td>
                      <td><input type="text" name="nome" />
                 </tr>
                 <tr>
                     <td>Nome do Dono</td>
                     <td><input type="text" name="dono" />
                 </tr>
                 <tr>
                     <td>CNPJ</td>
                     <td><input type="text" name="CNPJ" />
                 </tr>
                 <tr>
                     <td>Endereco</td>
                     <td><input type="text" name="Endereco" />
                 </tr>
                 <tr>
                    <td>Preco da Gasolina</td>
                    <td><input type="text" name="gasolina" />
                 </tr>
                 <tr>
                    <td>Preco do Alcool</td>
                    <td><input type="text" name="alcool" />
                 </tr>
             </table>
           <input type="submit" name="incluir" value="incluir" />
        </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->


<%     classes.transacoes.Posto tn = new classes.transacoes.Posto();
       String posto = (String)session.getAttribute("PostoAtualizar");
       classes.data.PostoDO postoAtualizar = new classes.data.PostoDO();
       postoAtualizar = tn.pesquisarPorNome(posto, tn);
       request.setAttribute("nome", postoAtualizar.getNome());
       request.setAttribute("dono", postoAtualizar.getDono());
       request.setAttribute("CNPJ", postoAtualizar.getCNPJ());
       request.setAttribute("Endereco", postoAtualizar.getEndereco());
       request.setAttribute("gasolina", postoAtualizar.getGasolina());
       request.setAttribute("alcool", postoAtualizar.getAlcool());
       String nome = request.getParameter("nome");
       String dono = request.getParameter("dono");
       String CNPJ = request.getParameter("CNPJ");
       String endereco = request.getParameter("Endereco");
       String gasolina = request.getParameter("gasolina");
       String alcool = request.getParameter("alccol");
       classes.data.PostoDO posto = new classes.data.PostoDO();
       posto.setNome(nome);
       posto.setDono(dono);
       posto.setCNPJ(cnpj);
       posto.setEndereco(endereco);
       posto.setGasolina(gasolina);
       posto.setAlcool(alcool);
       if ( tn.incluir(posto)) {
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
