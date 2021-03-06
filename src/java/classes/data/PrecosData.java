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
     String sql = "select * from Precos where id=?";
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
  
  public PrecosDO buscarPorModeloID(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Precos where Modelo_id=?";
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
  
   public void atualizar(PrecosDO preco, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Precos set Veiculo_ID=?, Preco1=?, Preco2=? ,Preco3=?, Preco4=?, Preco5=?, Preco6=? where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, preco.getModeloId());
        ps.setFloat(2, preco.getPreco1());
        ps.setFloat(3, preco.getPreco2());
        ps.setFloat(4, preco.getPreco3());
        ps.setFloat(5, preco.getPreco4());
        ps.setFloat(6, preco.getPreco5());
        ps.setFloat(7, preco.getPreco6());
        ps.setInt(8, preco.getId());
        int result = ps.executeUpdate();
    }
  
}
