package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

public class VeiculosData {

    public void incluir(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Veiculos (Modelo_ID, Vaga_ID, Cliente_ID, Quilometragem, Ar_Condicionado,"
                + "Direcao_Hidraulica, Freio_ABS, GPS, Cambio_Automatico, Estado, Placa)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getModeloID());
        ps.setInt(2, veiculo.getVagaID());
        ps.setInt(3, veiculo.getClienteID());
        ps.setInt(4, veiculo.getQuilometragem());
        ps.setBoolean(5, veiculo.getArCondicionado());
        ps.setBoolean(6, veiculo.getDirecaoHidraulica());
        ps.setBoolean(7, veiculo.getFreioABS());
        ps.setBoolean(8, veiculo.getGPS());
        ps.setBoolean(9, veiculo.getCambioAutomatico());
        ps.setString(10, veiculo.getEstado());
        ps.setString(11, veiculo.getPlaca());
        int result = ps.executeUpdate();
    } // incluir

    public void excluir(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Veiculos where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        String id = "" + idobj;
        ps.setString(1, id);
        int result = ps.executeUpdate();
    } // excluir 

    public void excluir(VeiculosDO veiculo, Transacao tr) throws Exception {
        excluir(veiculo.getId(), tr);
    } // excluir

    public void atualizar(VeiculosDO veiculo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Veiculos set Modelo_ID=?, Vaga_ID=?, Cliente_ID=?, Quilometragem=?, "
                + "Ar_Condicionado=?, Direcao_Hidraulica=?, Freio_ABS=?,"
                + "GPS=?, Cambio_Automatico=?, Estado=?, Placa=?, Estacionamento_ID=? where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, veiculo.getModeloID());
        ps.setInt(2, veiculo.getVagaID());
        ps.setInt(3, veiculo.getClienteID());
        ps.setInt(4, veiculo.getQuilometragem());
        ps.setBoolean(5, veiculo.getArCondicionado());
        ps.setBoolean(6, veiculo.getDirecaoHidraulica());
        ps.setBoolean(7, veiculo.getFreioABS());
        ps.setBoolean(8, veiculo.getGPS());
        ps.setBoolean(9, veiculo.getCambioAutomatico());
        ps.setString(10, veiculo.getEstado());
        ps.setString(11, veiculo.getPlaca());
        ps.setInt(12, veiculo.getEstacionamentoID());
        ps.setInt(13, veiculo.getId());
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
        veiculo.setVagaID(rs.getInt("Vaga_ID"));
        veiculo.setClienteID(rs.getInt("Cliente_ID"));
        veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));

        return veiculo;
    } // buscar

    public VeiculosDO buscarPorPlaca(String placa, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from veiculos where Placa=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, placa);
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
            veiculo.setVagaID(rs.getInt("Vaga_ID"));
            veiculo.setClienteID(rs.getInt("Cliente_ID"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
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
            veiculo.setVagaID(rs.getInt("Vaga_ID"));
            veiculo.setClienteID(rs.getInt("Cliente_ID"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            v.add(veiculo);
        }
        return v;
    } // buscar

    public boolean jaExiste(String placa, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where Placa=?";
        PreparedStatement ps = con.prepareStatement(sql);
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
            veiculo.setVagaID(rs.getInt("Vaga_ID"));
            veiculo.setClienteID(rs.getInt("Cliente_ID"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            veiculos.add(veiculo);
        }
        return veiculos;
    } // pesquisarTodos

    public Vector buscarPorVaga(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Veiculos where  Vaga_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        Vector v = new Vector();
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
            veiculo.setVagaID(rs.getInt("Vaga_ID"));
            veiculo.setClienteID(rs.getInt("Cliente_ID"));
            veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
            v.add(veiculo);
        }
        return v;
    } // buscar
    
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
        System.out.println("to aqui" + idobj);
        String sql = "select * from Veiculos where ID=?";
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
        veiculo.setVagaID(rs.getInt("Vaga_ID"));
        veiculo.setClienteID(rs.getInt("Cliente_ID"));
        veiculo.setEstacionamentoID(rs.getInt("Estacionamento_ID"));
        return veiculo;
    } // buscar
}
