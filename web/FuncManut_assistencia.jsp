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
                
                for(int i = 1; tn.buscar(i)!=null ;i++){
                    assistencia = tn.buscar(i);
                    if(assistencia.getEstadoFinal().equals("Reparado"))
                        temAguardando = true;
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
       <%           for (int i = 1; tn.buscar(i)!=null ; i++) {
                        assistencia = tn.buscar(i);
                        if(!assistencia.getEstadoFinal().equals("Reparado")){
                
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
            classes.transacoes.Funcionario tf = new classes.transacoes.Funcionario();
            classes.transacoes.Usuarios tu = new classes.transacoes.Usuarios();
    
            classes.data.AssistenciaTecnicaDO responderChamado = tn.buscar(id);
            String user = (String)session.getAttribute("user_name");
            int buscaID = tu.buscarID(user);
            classes.data.FuncionarioDO funcionario = tf.buscarPorUsuarioID(buscaID);
            
            responderChamado.setFuncionarioID(funcionario.getId());
            
            if ( null == request.getParameterValues("incluir") ){
        %>
        <tr>
                <td>Estado</td>
                <td><input type="text" name="estado" />
                <td><input type="submit" name="cancelar" value="incluir" />
        </tr>  
        <%
            }
            else{
            responderChamado.setEstadoFinal(request.getParameter("estado"));
        %>
            Estado alterado com sucesso
            <form action="./FuncManut_assistencia.jsp" method="post">
            <table>
                <tr>
                    
                    <input type="submit" name="pesquisar" value="retornar" />
                    <input type="hidden" name="action" value="showSearchResults" />
                    
                </tr>
            </table>
        </form>
            
        <%
            }
            
        }
        %>
        
        

    </body>
</html>
