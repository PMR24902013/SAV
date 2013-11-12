/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

/**
 *
 * @author User
 */
public class Operacoes_de_CaixaData {

    public void incluir(Operacoes_de_CaixaDO operacao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Operacoes_de_Caixa (Valor, Data_de_Pagamento, Usuario_ID) values (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setFloat(1, operacao.getValorDoPagamento());
        ps.setString(2, operacao.getDataDoPagamento());
        ps.setInt(3, operacao.getUsuarioID());
        int result = ps.executeUpdate();
    }

    public void excluir(Operacoes_de_CaixaDO operacao, Transacao tr) throws Exception {
        excluir(operacao.getID(), tr);
    } // excluir

    public void excluir(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Operacoes_de_Caixa where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        String id = "" + idobj;
        ps.setString(1, id);
        int result = ps.executeUpdate();
    } // excluir 

    public void atualizar(Operacoes_de_CaixaDO operacao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Operacoes_de_Caixa set Valor=?, Data_de_Pagamento=?, Usuario_ID=? where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setFloat(1, operacao.getValorDoPagamento());
        ps.setString(2, operacao.getDataDoPagamento());
        ps.setInt(3, operacao.getUsuarioID());
        ps.setInt(4, operacao.getID());
        int result = ps.executeUpdate();
    } // atualizar

    public Operacoes_de_CaixaDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Operacoes_de_Caixa where  id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
        operacao.setID(rs.getInt("id"));
        operacao.setValorDoPagamento(rs.getFloat("Valor"));
        operacao.setDataDoPagamento(rs.getString("Data_De_Pagamento"));
        operacao.setUsuarioID(rs.getInt("Usuario_ID"));
        return operacao;
    } // buscar

    public Vector buscarPorUsuarioID(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Operacoes_de_Caixa where  Usuario_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        Vector v = new Vector();
        while (rs.next()) {
            Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
            operacao.setID(rs.getInt("id"));
            operacao.setValorDoPagamento(rs.getFloat("Valor"));
            operacao.setDataDoPagamento(rs.getString("Data_De_Pagamento"));
            operacao.setUsuarioID(rs.getInt("Usuario_ID"));
            v.add(operacao);
        }
        return v;
    } // buscar
    
    public Vector buscarPorEstado(String estado, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Operacoes_de_Caixa where Estado=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, estado);
        ResultSet rs = ps.executeQuery();
        Vector v = new Vector();
        while (rs.next()) {
            Operacoes_de_CaixaDO operacao = new Operacoes_de_CaixaDO();
            operacao.setID(rs.getInt("id"));
            operacao.setValorDoPagamento(rs.getFloat("Valor"));
            operacao.setDataDoPagamento(rs.getString("Data_De_Pagamento"));
            operacao.setUsuarioID(rs.getInt("Usuario_ID"));
            operacao.setEstado(rs.getString("Estado"));
            v.add(operacao);
        }
        return v;
    } // buscar
}
