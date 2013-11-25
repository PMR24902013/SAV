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
 * @author Rodrigo
 */
public class vagaDATA {
    
     public void incluir(vagaDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Vaga (Estacionamento_ID, Estado, Numero) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getEstacionamento_id());
     ps.setBoolean(2, e.getEstado());
     ps.setInt(3, e.getNumero());
     
     int result = ps.executeUpdate();
  }

    public void excluir(Precos_OpcionaisDO e, Transacao tr) throws Exception {
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
  
 public Vector pesquisarPorEstacionamentoId(int numero, int estacionamentoId, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Vaga where Estacionamento_ID=? and Numero=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, estacionamentoId);
     ps.setInt(2, numero);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector vagas = new Vector();
     while (rs.next()) {
        vagaDO v = new vagaDO();
        v.setId (rs.getInt("id"));
        v.setEstacionamento_id(rs.getInt("Estacionamento_ID"));
        v.setEstado(rs.getBoolean("Estado"));
        vagas.add(v);
     }
     return vagas;
  } // pesquisarPorLogin

}

    

