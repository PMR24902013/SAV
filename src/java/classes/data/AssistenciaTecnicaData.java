package classes.data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

/**
 *
 * @author Ligia
 */
public class AssistenciaTecnicaData {
    
    public void incluir(AssistenciaTecnicaDO assistencia, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into AssistenciaTecnica (cliente, opmanut, queixa, end, data, estadofinal) values (?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, assistencia.getCliente());
     ps.setString(2, assistencia.getOpManut());
     ps.setString(3, assistencia.getQueixa());
     ps.setString(4, assistencia.getEndereco());
     ps.setString(5, assistencia.getData());
     ps.setString(6, assistencia.getEstadoFinal());
     int result = ps.executeUpdate();
  }

  public void excluir(AssistenciaTecnicaDO assistencia, Transacao tr) throws Exception {
     excluir(assistencia.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from AssistenciaTecnica where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(AssistenciaTecnicaDO assistencia, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update AssistenciaTecnica set cliente=?, opmanut=?, queixa=?, end=?, data=?, estadofinal=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, assistencia.getCliente());
     ps.setString(2, assistencia.getOpManut());
     ps.setString(3, assistencia.getQueixa());
     ps.setString(4, assistencia.getEndereco());
     ps.setString(5, assistencia.getData());
     ps.setString(6, assistencia.getEstadoFinal());
	 ps.setInt(7, assistencia.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public AssistenciaTecnicaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from AssistenciaTecnica where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     AssistenciaTecnicaDO assistencia = new AssistenciaTecnicaDO();
     assistencia.setId (rs.getInt("id"));
     assistencia.setCliente (rs.getString("cliente"));
     assistencia.setOpManut (rs.getString("opmanut"));
     assistencia.setQueixa (rs.getString("queixa"));
     assistencia.setEndereco (rs.getString("end"));
     assistencia.setData (rs.getString("data"));
     assistencia.setEstadoFinal (rs.getString("estadofinal"));
     return assistencia;
  } // buscar

  public Vector pesquisarPorCliente(String cliente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from AssistenciaTecnica where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, cliente);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector assistencia = new Vector();
     while (rs.next()) {
        AssistenciaTecnicaDO c = new AssistenciaTecnicaDO();
        c.setId (rs.getInt("id"));
        c.setCliente (rs.getString("cliente"));
        System.out.println(" got " + c.getCliente());
        c.setOpManut(rs.getString("opmanut"));
        c.setQueixa(rs.getString("queixa"));
        c.setEndereco(rs.getString("end"));
        c.setData(rs.getString("data"));
        c.setEstadoFinal(rs.getString("estadofinal"));
        assistencia.add(c);
     }
     return assistencia;
  } // pesquisarPorCliente
    
}
