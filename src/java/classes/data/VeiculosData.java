package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

public class VeiculosData {
    
    public void incluir(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Veiculos (Modelo_ID, Estacionamento_ID, Quilometragem, Ar_Condicionado,"
                + "Direcao_Hidraulica, Freio_ABS, GPS, Cambio_Automatico, Estado, Placa)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getModeloID());
        ps.setInt(2, veiculo.getEstacionamentoID());
        ps.setInt(3, veiculo.getQuilometragem());
        ps.setBoolean(4, veiculo.getArCondicionado());
        ps.setBoolean(5, veiculo.getDirecaoHidraulica());
        ps.setBoolean(6, veiculo.getFreioABS());
        ps.setBoolean(7, veiculo.getGPS());
        ps.setBoolean(8, veiculo.getCambioAutomatico());
        ps.setString(9, veiculo.getEstado());
        ps.setString(10, veiculo.getPlaca());
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
    
        public void realocar(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Veiculos set Estacionamento_ID=? where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getEstacionamentoID());
        ps.setInt(2, veiculo.getId());
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
    
    public Vector buscarPorEstado(String estado, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from veiculos where Estado=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, estado);
        ResultSet rs = ps.executeQuery();
        Vector v = new Vector();
        while (rs.next()) {
            VeiculosDO veiculo = new VeiculosDO();
            veiculo.setId(rs.getInt("id"));
            veiculo.setQuilometragem(rs.getInt("quilometragem"));
            veiculo.setArCondicionado(rs.getBoolean("Ar_Condicionado"));
            veiculo.setDirecaoHidraulica(rs.getBoolean("Direcao_Hidraulica"));
            veiculo.setFreioABS(rs.getBoolean("Freio_ABS"));
            veiculo.setGPS(rs.getBoolean("GPS"));
            veiculo.setCambioAutomatico(rs.getBoolean("Cambio_Automatico"));
            veiculo.setEstado(rs.getString("Estado"));
            veiculo.setPlaca(rs.getString("Placa"));
            veiculo.setModeloID(rs.getInt("Modelo_ID"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            v.add(veiculo);
        }
        return v;
    } // buscar
    
    public boolean jaExiste(String placa, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where Placa=?";
        PreparedStatement ps = con.prepareStatement (sql);
        ps.setString(1, placa);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
                
    }
    
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
    
    public Vector buscarPorEstacionamento(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where  Estacionamento_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        Vector v = new Vector();
        while(rs.next()){
            VeiculosDO veiculo = new VeiculosDO();
            veiculo.setId(rs.getInt("ID"));
            veiculo.setQuilometragem(rs.getInt("Quilometragem"));
            veiculo.setArCondicionado(rs.getBoolean("Ar_Condicionado"));
            veiculo.setDirecaoHidraulica(rs.getBoolean("Direcao_Hidraulica"));
            veiculo.setFreioABS(rs.getBoolean("Freio_ABS"));
            veiculo.setGPS(rs.getBoolean("GPS"));
            veiculo.setCambioAutomatico(rs.getBoolean("Cambio_Automatico"));
            veiculo.setEstado(rs.getString("Estado"));
            veiculo.setModeloID(rs.getInt("Modelo_ID"));
            veiculo.setPlaca(rs.getString("Placa"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            v.add(veiculo);
        }
        return v;
    } // buscar
    
            public VeiculosDO buscarPorVeiculoID(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where  Veiculo_ID=?";
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
}
