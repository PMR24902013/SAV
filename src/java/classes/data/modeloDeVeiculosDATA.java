/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sav;

import java.sql.*;
import java.util.*;
import utils.Transacao;

/**
 *
 * @author Rodrigo
 */
public class modeloDeVeiculosDATA {
    
    public void incluir(modeloDeVeiculosDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Modelo (ID, Modelo, Marca, Ano) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getId());
     ps.setString(2, e.getModelo());
     ps.setString(3, e.getMarca());
     ps.setInt(4, e.getAno());
     
     int result = ps.executeUpdate();
  }

    public void excluir(modeloDeVeiculosDO e, Transacao tr) throws Exception {
     excluir(e.getId(), tr);
  } // excluir
    
    public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Modelo where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir
    
   
  public void atualizar(modeloDeVeiculosDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Modelo set Modelo=?, Marca=?, Ano=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, e.getModelo());
     ps.setString(2, e.getMarca());
     ps.setInt(3, e.getAno());
     ps.setInt(4, e.getId());
     int result = ps.executeUpdate();
  } // atualizar
    
  
  public modeloDeVeiculosDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Modelo where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     modeloDeVeiculosDO e = new modeloDeVeiculosDO();
     e.setId (rs.getInt("ID"));
     e.setModelo (rs.getString("Modelo"));
     e.setMarca(rs.getString("Marca"));
     e.setAno(rs.getInt("Ano"));

     return e;
  } // buscar
  
  public Vector pesquisarPorModelo(String modelo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Modelos where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, modelo);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector modeloDeVeiculos = new Vector();
        while (rs.next()) {
            modeloDeVeiculosDO e = new modeloDeVeiculosDO();
            e.setId (rs.getInt("ID"));
            e.setModelo (rs.getString("Modelo"));
            System.out.println(" got " + e.getModelo());
            e.setMarca(rs.getString("Marca"));
            e.setAno(rs.getInt("Ano"));
        
            modeloDeVeiculos.add(e);
        }
        
        return modeloDeVeiculos;
  
    }
}
