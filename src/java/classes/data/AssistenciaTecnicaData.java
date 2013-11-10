package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

/**
 *
 * @author Ligia
 */
public class AssistenciaTecnicaData {
    
    public void incluir(AssistenciaTecnicaDO assistencia, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "INSERT INTO Assistencia_Tecnica (Funcionario_ID, Cliente_ID, Queixa, Endereco, Data_do_Pedido_de_Assistencia, Estado_Final_do_Veiculo)  values (?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, assistencia.getFuncionarioID());
     ps.setInt(2, assistencia.getClienteID());
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
     String sql = "update AssistenciaTecnica set Funcionario_ID=?, Cliente_ID=?, Queixa=?, Endereco=?, Data_do_Pedido_de_Assistencia=?, Estado_Final_do_Veiculo=?  where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, assistencia.getFuncionarioID());
     ps.setInt(2, assistencia.getClienteID());
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
     assistencia.setFuncionarioID (rs.getInt("Funcionario_ID"));
     assistencia.setClienteID (rs.getInt("Cliente_ID"));
     assistencia.setQueixa (rs.getString("Queixa"));
     assistencia.setEndereco (rs.getString("Endereco"));
     assistencia.setData (rs.getString("Data_do_Pedido_de_Assistencia"));
     assistencia.setEstadoFinal (rs.getString("Estado_Final_do_Veiculo"));
     return assistencia;
  } // buscar

  public Vector pesquisarPorClienteID(int cliente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from AssistenciaTecnica where Cliente_ID like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, cliente);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector assistencia = new Vector();
     while (rs.next()) {
        AssistenciaTecnicaDO c = new AssistenciaTecnicaDO();
        c.setId (rs.getInt("id"));
        c.setFuncionarioID (rs.getInt("Funcionario_ID"));
         c.setClienteID(rs.getInt("Cliente_ID"));
        c.setQueixa(rs.getString("Queixa"));
        c.setEndereco(rs.getString("Endereco"));
        c.setData(rs.getString("Data_do_Pedido_de_Assistencia"));
        c.setEstadoFinal(rs.getString("Estado_Final_do_Veiculo"));
        assistencia.add(c);
     }
     return assistencia;
  } // pesquisarPorCliente
    
}
