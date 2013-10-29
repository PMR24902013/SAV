/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
/**
 *
 * @author User
 */
public class ReservasData {
    
    
    public void incluir(ReservasDO reserva, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "insert into Reservas ( Vaga_ID, Operacoes_de_caixa_ID, Modelo_ID, Veiculo_ID, Estacionamento_ID,"
            + " Cliente_ID, Horario_da_Retirada, Data_da_Reserva, Estado, Horario_da_Devolucao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, reserva.getVagaID());
    ps.setInt(2, reserva.getOperacoesDeCaixaID());
    ps.setInt(3, reserva.getModeloID());
    ps.setInt(4, reserva.getVeiculoID());
    ps.setInt(5, reserva.getEstacionamentoID());
    ps.setInt(6, reserva.getClienteID());
    ps.setDate(7, new java.sql.Date(reserva.getHorarioDeRetirada().getTime()));
    ps.setDate(8, new java.sql.Date(reserva.getDataDeReserva().getTime()));
    ps.setString(9, reserva.getEstado());
    ps.setDate(10, new java.sql.Date(reserva.getHorarioDeDevolucao().getTime()));
     
    int result = ps.executeUpdate();
  }

  public void excluir(ReservasDO reserva, Transacao tr) throws Exception {
     excluir(reserva.getID(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Reservas set Vaga_ID=null, Operacoes_de_caixa_ID=null, Modelo_ID=null, Veiculo_ID=null, Estacionamento_ID=null,"
            + " Cliente_ID=null, Horario_da_Retirada=null, Data_da_Reserva=null, Estado=null, Horario_da_Devolucao=null where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(ReservasDO reserva, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Consumo_de_Combustivel set Vaga_ID=?, Operacoes_de_caixa_ID=?, Modelo_ID=?, Veiculo_ID=?, Estacionamento_ID=?,"
             + " Cliente_ID=?, Horario_da_Retirada=?, Data_da_Reserva=?, Estado=?, Horario_da_Devolucao=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, reserva.getVagaID());
     ps.setInt(2, reserva.getOperacoesDeCaixaID());
     ps.setInt(3, reserva.getModeloID());
     ps.setInt(4, reserva.getVeiculoID());
     ps.setInt(5, reserva.getEstacionamentoID());
     ps.setInt(6, reserva.getClienteID());
     ps.setDate(7, new java.sql.Date(reserva.getHorarioDeRetirada().getTime()));
     ps.setDate(8, new java.sql.Date(reserva.getDataDeReserva().getTime()));
     ps.setString(9, reserva.getEstado());
     ps.setDate(10, new java.sql.Date(reserva.getHorarioDeDevolucao().getTime()));
     ps.setInt(11, reserva.getID());
     
     int result = ps.executeUpdate();
  } // atualizar

  public ReservasDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Consumo_de_Combustivel where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ReservasDO reserva = new ReservasDO();
     reserva.setID(rs.getInt("id"));
     reserva.setVagaID(rs.getInt("Vaga_ID"));
     reserva.setOperacoesDeCaixaID(rs.getInt("Operacoes_de_Caixa_ID"));
     reserva.setModeloID(rs.getInt("Modelo_ID"));
     reserva.setVeiculoID(rs.getInt("Veiculo_ID")) ;
     reserva.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
     reserva.setClienteID(rs.getInt(" Cliente_ID"));
     reserva.setHorarioDeRetirada(rs.getString("Horario_de_Retirada"));
     reserva.setDataDeReserva(rs.getString("Data_de_Reserva"));
     reserva.setEstado((rs.getString("Estado")));
     reserva.setHorarioDeDevolucao(rs.getString("Horario_de_Devolucao"));
    
     return reserva;
  } // buscar
}
