<%-- 
    Document   : Estacionamento_cadastrarDados
    Created on : 24/11/2013, 12:07:51
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="classes.transacoes.*" %>
<%@ page import="classes.data.*" %>
<%@ page import="classes.utils.Transacao" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enviar Dúvidas</title>
        <%@ include file="header.html" %>
        <div id="base">
            <div id ="cima"></div>
        
        <% if (null != request.getParameter("Cancelar")){
            %>    <jsp:forward page="index.html" />
            <%    return;
                }
                if (null != request.getParameter ("Confirmar")){
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String pergunta = request.getParameter("pergunta");
                    int funcionarioID = 1;
                    
                    PerguntaDO p = new PerguntaDO();
                    p.setNome(nome);
                    p.setEmail(email);
                    p.setEstado(false);
                    p.setFuncionarioId(funcionarioID);
                    p.setPergunta(pergunta);
                    
                    Pergunta pTrans = new Pergunta();
                    pTrans.incluir(p);
                    %>
    <br><br>
                    Dúvida enviada com sucesso!<br>
                    <form action ="index.html">
                        <input type ="submit" value="Voltar" name="Voltar"/>                       
                    </form>
                    <%
                    
                    }
                
            %>
        

            <h1>
            </h1>    
                <form name="content" action="enviarDuvidas.jsp" method="POST">
                    <br><br>Nome <input type="text" name="nome" value="" size="50" /><br><br>
                    e-mail <input type="text" name="email" value="" size="50" /><br><br>
                    Pergunta<br> <textarea name="pergunta" rows="5" cols="60">
                    </textarea><br>
                    <input type="submit" value="Confirmar" name="Confirmar" />  <input type="submit" value="Cancelar" name="Cancelar" />
                </form>  
        </div>
    </body>
</html>
