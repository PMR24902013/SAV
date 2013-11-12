<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Responder Assistência</title>
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.text.*" %>
        <%@ page import="classes.transacoes.*"  %>
        <%@ page import="classes.data.*" %>
        
<%     
       String action = request.getParameter("action");
       if ( null == action ) {
          action = "showSearchForm";
%>

        <form action="./FuncManut_assistencia.jsp" method="post">
            <%
                // VERIFICACAO MANUAL DO LOGIN
                if (session.getAttribute("user_name") == null) {
                    pageContext.forward("index.jsp");
                }
            %>   
            <table>
                <tr>
                    
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    <input type="hidden" name="action" value="showSearchResults" />
                    
                </tr>
            </table>
        </form>
<%        
       } 

%>

        <%   if (action.equals("showSearchResults")) {
                boolean temAguardando = false;
                classes.transacoes.AssistenciaTecnica tn = new classes.transacoes.AssistenciaTecnica();
                classes.data.AssistenciaTecnicaDO assistencia = new classes.data.AssistenciaTecnicaDO();
                
                for(int i = 0; tn.buscar(i)!=null ;i++){
                    assistencia = tn.buscar(i);
                    if(assistencia.getEstadoFinal().equals("Aguardando")){
                        temAguardando = true;
                        break;
                    }
                }
                
                if(temAguardando == false){
        %>
        Não foram encontrados chamados de assistência pendentes
        <form action="./FuncManut_menu.html" method="post">
            <input type="submit" name="voltar" value="Voltar" />
        </form>
        <%      }
                else{
        %>
        <table>
            <tr>
                <td>Data</td>
                <td>Queixa</td>
                <td>Endereço</td>
            </tr>
       <%           for (int i = 0; tn.buscar(i)!=null ; i++) {
                        assistencia = tn.buscar(i);
                        if(assistencia.getEstadoFinal().equals("Aguardando")){
                
       %>
            <tr>
                <td><%= assistencia.getData()%></td>
                <td><%= assistencia.getQueixa()%></td>
                <td><%= assistencia.getEndereco()%></td>
                <td><a href=FuncManut_assistencia.jsp?action=ShowEditForm&id=<%= assistencia.getId()%>>Responder</a>
            </tr>
        
        
        <%
                        } //if
                    } //for i
       %>
            <td></td>
                <td></td>
                <td><form action="./FuncManut_menu.html" method="post">
             <input type="submit" name="cancelar" value="cancelar" />
          </form>
       </table>
       <%
        }
        } //pequisar
        
        if (action.equals("showEditForm")){
            int id = Integer.parseInt(request.getParameter("id"));
            classes.transacoes.AssistenciaTecnica tn = new classes.transacoes.AssistenciaTecnica();
            classes.data.AssistenciaTecnicaDO responderChamado = tn.buscar(id);
            
        }
        %>
        
        

    </body>
</html>
