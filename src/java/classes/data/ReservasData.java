/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.sql.*;
import java.util.*;
import java.text.*;
import classes.utils.Transacao;

/**
 *
 * @author User
 */
public class ReservasData {

    public void incluir(ReservasDO reserva, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Reservas ( Vaga_ID, Operacoes_de_caixa_ID, Modelos_ID, Veiculos_ID, Estacionamento_ID, Cliente_ID, Horario_da_Retirada, Data_da_Reserva, Estado, Horario_da_Devolucao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        java.util.Date utilDate1 = reserva.getDataDeReserva();
        java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
        java.util.Date utilDate2 = reserva.getHorarioDeRetirada();
        java.sql.Time sqlDate2 = new java.sql.Time(utilDate2.getTime());
        java.util.Date utilDate3 = reserva.getHorarioDeDevolucao();
        java.sql.Time sqlDate3 = new java.sql.Time(utilDate3.getTime());
        ps.setInt(1, reserva.getVagaID());
        ps.setInt(2, reserva.getOperacoesDeCaixaID());
        ps.setInt(3, reserva.getModeloID());
        ps.setInt(4, reserva.getVeiculoID());
        ps.setInt(5, reserva.getEstacionamentoID());
        ps.setInt(6, reserva.getClienteID());
        ps.setTime(7, sqlDate2);
        ps.setDate(8, sqlDate1);
        ps.setString(9, reserva.getEstado());
        ps.setTime(10, sqlDate3);
        int result = ps.executeUpdate();
    }

    public void excluir(ReservasDO reserva, Transacao tr) throws Exception {
        excluir(reserva.getID(), tr);
    } // excluir

    public void excluir(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Reservas set Vaga_ID=null, Operacoes_de_caixa_ID=null, Modelo_ID=null, Veiculo_ID=null, Estacionamento_ID=null,"
                + " Cliente_ID=null, Horario_da_Retirada=null, Data_da_Reserva=null, Estado=null, Horario_da_Devolucao=null where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);

        int result = ps.executeUpdate();
    } // excluir 

    public void atualizar(ReservasDO reserva, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Reservas set Data_da_Reserva=?, Horario_da_Retirada=?, Horario_da_Devolucao=?, Modelos_ID=?, Estacionamento_ID=?, Veiculos_ID=?, Cliente_ID=?, Vaga_ID=?, Estado=? where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        java.util.Date utilDate1 = reserva.getDataDeReserva();
        java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
        java.util.Date utilDate2 = reserva.getHorarioDeRetirada();
        java.sql.Time sqlDate2 = new java.sql.Time(utilDate2.getTime());
        java.util.Date utilDate3 = reserva.getHorarioDeDevolucao();
        java.sql.Time sqlDate3 = new java.sql.Time(utilDate3.getTime());
        ps.setDate(1, sqlDate1);
        ps.setTime(2, sqlDate2);
        ps.setTime(3, sqlDate3);
        ps.setInt(4, reserva.getModeloID());
        ps.setInt(5, reserva.getEstacionamentoID());
        ps.setInt(6, reserva.getVeiculoID());
        ps.setInt(7, reserva.getClienteID());
        ps.setInt(8, reserva.getVagaID());
        ps.setString(9, reserva.getEstado());
        ps.setInt(10, reserva.getID());
        int result = ps.executeUpdate();
    } // atualizar

    public void atualizarEstado(ReservasDO reserva, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update reservas set Estado=? where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, reserva.getEstado());
        ps.setInt(2, reserva.getID());
        int result = ps.executeUpdate();
    } // atualizar 

    public ReservasDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from reservas where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        ReservasDO reserva = new ReservasDO();
        reserva.setID(rs.getInt("id"));
        reserva.setVeiculoID(rs.getInt("Veiculos_ID"));
        reserva.setDataDeReserva(rs.getDate("Data_da_Reserva"));
        reserva.setModeloID(rs.getInt("Modelos_ID"));
        reserva.setHorarioDeRetirada(rs.getTime("Horario_da_Retirada"));
        reserva.setEstacionamentoID(rs.getInt("Estacionamento_ID"));

        reserva.setEstado(rs.getString("Estado"));
        reserva.setHorarioDeDevolucao(rs.getTime("Horario_da_Devolucao"));

        return reserva;
    } // buscar

    public Vector pesquisar(int idobj, String estado, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Reservas where Cliente_Id=? and Estado =?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ps.setString(2, estado);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector reserva = new Vector();
        while (rs.next()) {
            ReservasDO r = new ReservasDO();
            r.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            r.setDataDeReserva(rs.getDate("Data_da_Reserva"));
            r.setEstado(rs.getString("Estado"));
            r.setID(rs.getInt("ID"));
            reserva.add(r);
        }
        return reserva;
    } // pesquisar

    public Vector pesquisarPorCliente(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Reservas where Cliente_Id=? ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);

        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector reserva = new Vector();
        while (rs.next()) {
            ReservasDO r = new ReservasDO();
            r.setVeiculoID(rs.getInt("Veiculos_ID"));
            r.setModeloID(rs.getInt("Modelos_ID"));
            r.setHorarioDeRetirada(rs.getTime("Horario_da_Retirada"));
            r.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            r.setOperacoesDeCaixaID(rs.getInt("Operacoes_de_Caixa_ID"));
            r.setVagaID(rs.getInt("Vaga_ID"));
            r.setHorarioDeDevolucao(rs.getTime("Horario_da_Devolucao"));
            r.setDataDeReserva(rs.getDate("Data_da_Reserva"));
            r.setEstado(rs.getString("Estado"));
            r.setID(rs.getInt("ID"));
            reserva.add(r);
        }
        return reserva;
    } // pesquisar
}
