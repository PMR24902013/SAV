package classes.data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ModelosData {

    public void incluir(ModelosDO modelo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Modelos (Modelo, Marca, Ano) values (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo.getModelo());
        ps.setString(2, modelo.getMarca());
        ps.setInt(3, modelo.getAno());
        int result = ps.executeUpdate();
    }

    public void excluir (int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Modelos where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        String id = ""+idobj;
        ps.setString(1, id);
        int result = ps.executeUpdate();
    } // excluir
  
    public void excluir(ModelosDO modelo, Transacao tr) throws Exception {
        excluir(modelo.getId(), tr);
    } // excluir

    public void atualizar(ModelosDO modelo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Modelos set Modelo=?, Marca=?, Ano=? where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo.getModelo());
        ps.setString(2, modelo.getMarca());
        ps.setInt(3, modelo.getAno());
        ps.setInt(4, modelo.getId());
        int result = ps.executeUpdate();
    } // atualizar

    public ModelosDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Modelos where  ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        ModelosDO modelo = new ModelosDO();
        modelo.setId(rs.getInt("ID"));
        modelo.setModelo(rs.getString("Modelo"));
        modelo.setMarca(rs.getString("Marca"));
        modelo.setAno(rs.getInt("Ano"));
        return modelo;
    } // buscar

} // ContatoData
