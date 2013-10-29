package classes.data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ClientesData {
    
    public void incluir(ClientesDO cliente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Cliente (Usuario_ID, Nome, CPF, email, Endereco, Telefone, CNH, Estado) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, cliente.getUsuarioId());
     ps.setString(2, cliente.getNome());
     ps.setString(3, cliente.getCPF());
     ps.setString(4, cliente.getEmail());
     ps.setString(5, cliente.getEndereco());
     ps.setString(6, cliente.getTelefone());
     ps.setString(7, cliente.getCNH());
     ps.setString(8, cliente.getEstado());
     int result = ps.executeUpdate();
  }    
    
    public void excluir(ClientesDO cliente, Transacao tr) throws Exception {
     excluir(cliente.getId(), tr);
  } 
    
  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Cliente where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  }    
    
  public void atualizar(ClientesDO cliente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Cliente set Usuario_ID=?, Nome=?, CPF=? ,email=?, Endereco=?, Telefone=?, CNH=?, Estado=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, cliente.getUsuarioId());
     ps.setString(2, cliente.getNome());
     ps.setString(3, cliente.getCPF());
     ps.setString(4, cliente.getEmail());
     ps.setString(5, cliente.getEndereco());
     ps.setString(6, cliente.getTelefone());
     ps.setString(7, cliente.getCNH());
     ps.setString(8, cliente.getEstado());
     ps.setInt(9, cliente.getId());
     int result = ps.executeUpdate();
  }
  
      public ClientesDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Cliente where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ClientesDO cliente = new ClientesDO();
     cliente.setId (rs.getInt("id"));
     cliente.setUsuarioId (rs.getInt("Usuario_ID"));
     cliente.setNome (rs.getString("Nome"));
     cliente.setCPF (rs.getString("CPF"));
     cliente.setEmail (rs.getString("email"));
     cliente.setEndereco (rs.getString("Endereco"));
     cliente.setTelefone (rs.getString("Telefone"));
     cliente.setCNH(rs.getString("CNH"));
     cliente.setEstado (rs.getString("Estado"));
     return cliente;
  }
      
}
