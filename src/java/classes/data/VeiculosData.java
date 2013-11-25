package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

public class VeiculosData {
    
    public void incluir(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Veiculos (ModeloID, Quilometragem, Ar_Condicionado"
                + "Direcao_Hidraulica, Freio_ABS, GPS, Cambio_Automatico, Estado, Placa)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getModeloID());
        ps.setInt(2, veiculo.getQuilometragem());
        ps.setBoolean(3, veiculo.getArCondicionado());
        ps.setBoolean(4, veiculo.getDirecaoHidraulica());
        ps.setBoolean(5, veiculo.getFreioABS());
        ps.setBoolean(6, veiculo.getGPS());
        ps.setBoolean(7, veiculo.getCambioAutomatico());
        ps.setString(8, veiculo.getEstado());
        ps.setString(9, veiculo.getPlaca());
        int result = ps.executeUpdate();
    } // incluir
    
    public void excluir (int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Veiculos where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        String id = ""+idobj;
        ps.setString(1, id);
        int result = ps.executeUpdate();
    } // excluir 

    public void excluir(VeiculosDO veiculo, Transacao tr) throws Exception {
        excluir(veiculo.getId(), tr);
    } // excluir
    
    public void atualizar(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Veiculos set ModeloID=?, Quilometragem=?, "
                + "Ar_Condicionado=?, Direcao_Hidraulica=?, Freio_ABS=?,"
                + "GPS=?, Cambio_Automatico=?, Estado=?, Placa=? where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getModeloID());
        ps.setInt(2, veiculo.getQuilometragem());
        ps.setBoolean(3, veiculo.getArCondicionado());
        ps.setBoolean(4, veiculo.getDirecaoHidraulica());
        ps.setBoolean(5, veiculo.getFreioABS());
        ps.setBoolean(6, veiculo.getGPS());
        ps.setBoolean(7, veiculo.getCambioAutomatico());
        ps.setString(8, veiculo.getEstado());
        ps.setString(9, veiculo.getPlaca());
        int result = ps.executeUpdate();
    } // atualizar
    
    public VeiculosDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where  ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        VeiculosDO veiculo = new VeiculosDO();
        veiculo.setId(rs.getInt("ID"));
        veiculo.setQuilometragem(rs.getInt("Quilometragem"));
        veiculo.setArCondicionado(rs.getBoolean("Ar_Condicionado"));
        veiculo.setDirecaoHidraulica(rs.getBoolean("Direcao_Hidraulica"));
        veiculo.setFreioABS(rs.getBoolean("Freio_ABS"));
        veiculo.setGPS(rs.getBoolean("GPS"));
        veiculo.setCambioAutomatico(rs.getBoolean("Cambio_Automatico"));
        veiculo.setEstado(rs.getString("Estado"));
        veiculo.setPlaca(rs.getString("Placa"));
        veiculo.setModeloID(rs.getInt("Modelo_ID"));
        return veiculo;
    } // buscar
    
    public Vector pesquisarTodos(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector veiculos = new Vector();
        while (rs.next()) {
            VeiculosDO veiculo = new VeiculosDO(); 
            veiculo.setId(rs.getInt("ID"));
            veiculo.setQuilometragem(rs.getInt("Quilometragem"));
            veiculo.setArCondicionado(rs.getBoolean("Ar_Condicionado"));
            veiculo.setDirecaoHidraulica(rs.getBoolean("Direcao_Hidraulica"));
            veiculo.setFreioABS(rs.getBoolean("Freio_ABS"));
            veiculo.setGPS(rs.getBoolean("GPS"));
            veiculo.setCambioAutomatico(rs.getBoolean("Cambio_Automatico"));
            veiculo.setEstado(rs.getString("Estado"));
            veiculo.setPlaca(rs.getString("Placa"));
            veiculo.setModeloID(rs.getInt("Modelo_ID"));
            veiculos.add(veiculo);
        }
        return veiculos;
    } // pesquisarTodos
}