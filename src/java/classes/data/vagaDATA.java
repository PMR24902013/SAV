/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sav;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

/**
 *
 * @author Rodrigo
 */
public class vagaDATA {
    
     public void incluir(vagaDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Vaga (ID, Estacionamento_ID, Estado, Numero) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getId());
     ps.setInt(2, e.getEstacionamento_id());
     ps.setBoolean(3, e.getEstado());
     ps.setInt(4, e.getNumero());
     
     int result = ps.executeUpdate();
  }

    public void excluir(modeloDeVeiculosDO e, Transacao tr) throws Exception {
     excluir(e.getId(), tr);
  } // excluir
    
    public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Vaga where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir
    
  
  public void atualizar(vagaDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Vaga set EstacionamentoID=?, Estado=?, Numero=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getEstacionamento_id());
     ps.setBoolean(2, e.getEstado());
     ps.setInt(3, e.getNumero());
     ps.setInt(4, e.getId());
     int result = ps.executeUpdate();
  } // atualizar
    

  public vagaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Vaga where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     vagaDO e = new vagaDO();
     e.setId (rs.getInt("ID"));
     e.setEstacionamento_id(rs.getInt("Estacionamento_ID"));
     e.setEstado(rs.getBoolean("Estado"));
     e.setNumero(rs.getInt("Numero"));

     return e;
  } // buscar
  

}

    

