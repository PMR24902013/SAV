<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecionando...</title>
        <script>
            function MudarPagina(){
                window.location = "http://localhost:8080/SAV/index.html"
            }
        </script>
    </head>
    
        
    
    <body onload="setTimeout(function(){MudarPagina()}, 2000);">
        
    <b> Retornando ao menu inicial </b>

    </body>
</html>
