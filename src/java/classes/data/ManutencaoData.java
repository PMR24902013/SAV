/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import classes.utils.Transacao;

/**
 *
 * @author hidden
 */
public class ManutencaoData {
     public void incluir(ManutencaoDO man, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Manutencao (Veiculo_ID, Funcionario_ID, Data_da_Entrada_na_Manutencao, Estado) VALUES (?,?,?,?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, man.getVeiculoID());
     ps.setInt(2, man.getFuncionarioID());
     ps.setString(3, man.getDataDaEntradaNaManutencao());
     ps.setString(4, man.getEstado());
     int result = ps.executeUpdate();
  }

  public void excluir(ManutencaoDO man, Transacao tr) throws Exception {
     excluir(man.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
      Connection con = tr.obterConexao();
     String sql = "update Manutencao set Veiculo_ID=null, Funcionario_ID=null, Data_da_Entrada_na_Manutencao=null, Estado=null where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     
     ps.setInt(1, idobj);
       int result = ps.executeUpdate();
 
     
     
  } // excluir 

  public void atualizar(ManutencaoDO man, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Manutencao set Veiculo_ID=?, Funcionario_ID=?, Data_da_Entrada_na_Manutencao=?, Estado=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, man.getVeiculoID());
     ps.setInt(2, man.getFuncionarioID());
     ps.setString(3, man.getDataDaEntradaNaManutencao());
     ps.setString(4, man.getEstado());
     int result = ps.executeUpdate();
  } // atualizar

  public ManutencaoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Manutencao where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ManutencaoDO man = new ManutencaoDO();
     man.setId (rs.getInt("id"));
     man.setVeiculoID (rs.getInt("VeiculoID"));
     man.setFuncionarioId(rs.getInt("FuncionarioID"));
     man.setDataDaEntradaNaManutencao(rs.getString("DataDaEntradaNaManutencao"));
     man.setEstado(rs.getString("Estado"));
     return man;
  } // buscar

 

}
