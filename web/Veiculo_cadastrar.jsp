<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="header.html" %>
    </head>
    <body>
        <div id="base">
            <div id ="cima"></div>
            <div id="tudo">
                <h1>
                        <table border="0">
                        <thead>
                            <tr>
                                <th>*Marca do carro:    </th>
                                <th><input type="text" name="marca" value="" size="15" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>*Modelo do carro:   </td>
                                <td><input type="text" name="marca" value="" size="15" /></td>
                            </tr>
                            <tr>
                                <td>*Ano do carro:  </td>
                                <td><input type="text" name="ano" value="" size="15" /></td>
                            </tr>
                            <tr>
                                <td>*Placa do veículo:  </td>
                                <td><input type="text" name="placa" value="" size="15" /></td>
                            </tr>
                            <tr>
                                <td>*Quilometragem: </td>
                                <td><input type="text" name="quilometragem" value="" size="15" /></td>
                            </tr>
                            <tr>
                                <td>Última Manutenção em:   </td>
                                <td><input type="text" name="manutencao" value="" size="15" /></td>
                            </tr>
                            <tr>
                                <td>Motivo: </td>
                                <td><textarea name="motivo" rows="4" cols="20">
                                    </textarea></td>
                            </tr>
                            <tr>
                                <td>*Lista de periféricos:  </td>
                                <td></td>
                            </tr>
                            
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="direcao" /> Direção hidráulica</td>                                
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="ar" /> Ar condicionado</td>                                
                                <td></td>                                
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="freio"/>  Freio ABS</td>                                
                                <td></td>                                
                            </tr>
                            
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="GPS"/>    GPS</td>                                
                                <td></td>                                
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="cambio"/> Câmbio Automático</td>                                
                                <td></td>                                
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="perifericos" value="outros"/> Outros</td>                                
                                <td><textarea name="outros" rows="4" cols="20">
                                    </textarea></td>                                
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Confirmar" name="confirmar" />  <input type="submit" value="Cancelar" name="cancelar" /></td>
                            </tr>
                            <tr>
                                <td>*CRLV do veículo:   </td>
                                <td><input type="file" name="CRLV" value="" width="15" /></td>
                            </tr>
                            <tr>
                                <td>*Campos marcados são obrigatórios</td>
                                <td></td>
                            </tr>
                            
                        </tbody>
                    </table>

                    
                </h1>
            </div>
        </div>
    </body>
</html>
