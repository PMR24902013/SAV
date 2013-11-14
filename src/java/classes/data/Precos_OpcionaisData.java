/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data; 

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

/**
 *
 * @author Bruna
 */
public class Precos_OpcionaisData {
    
    public void incluir(Precos_OpcionaisDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Preco_opcional (ID, Opcional, Preco) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getId());
     ps.setString(2, e.getOpcional());
     ps.setFloat(3, e.getPreco());
     
     int result = ps.executeUpdate();
  }

    public void excluir(Precos_OpcionaisDO e, Transacao tr) throws Exception {
     excluir(e.getId(), tr);
  } // excluir
    
    public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Preco_opcional where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir
    
   
  public void atualizar(Precos_OpcionaisDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Preco_opcional set Opcional=?, Preco=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, e.getOpcional());
     ps.setFloat(2, e.getPreco());
     ps.setInt(3, e.getId());
     int result = ps.executeUpdate();
  } // atualizar
    
  
  public Precos_OpcionaisDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Preco_opcional where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Precos_OpcionaisDO e = new Precos_OpcionaisDO();
     e.setId (rs.getInt("ID"));
     e.setOpcional (rs.getString("Opcional"));
     e.setPreco(rs.getFloat("Preco"));

     return e;
  } // buscar
  
  public Vector pesquisar(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Preco_opcional";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector precosOpcionais = new Vector();
        while (rs.next()) {
            Precos_OpcionaisDO e = new Precos_OpcionaisDO();
            e.setId (rs.getInt("ID"));
            e.setOpcional (rs.getString("Opcional"));
            e.setPreco(rs.getFloat("Preco"));
        
            precosOpcionais.add(e);
        }
        
        return precosOpcionais;
  
    }
}
