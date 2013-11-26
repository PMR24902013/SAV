/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

import java.sql.*;
import java.util.*;
import java.text.*;
import classes.utils.Transacao;

public class PrecosData {
    
  public PrecosDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Precos where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     PrecosDO preco = new PrecosDO();
     preco.setModeloId(rs.getInt("Modelo_ID"));
     preco.setPreco1(rs.getFloat("Preco_1"));
     preco.setPreco2(rs.getFloat("Preco_2"));
     preco.setPreco3(rs.getFloat("Preco_3"));
     preco.setPreco4(rs.getInt("Preco_4"));
     preco.setPreco5(rs.getFloat("Preco_5"));
     preco.setPreco6(rs.getFloat("Preco_6"));
     return preco;
  } // buscar
  
}
