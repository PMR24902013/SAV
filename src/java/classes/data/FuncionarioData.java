package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

public class FuncionarioData {
    
    public void incluir(FuncionarioDO funcionario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Funcionario (Usuario_ID, Nome, CPF, email, Endereco, Telefone, Estado, Categoria) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, funcionario.getUsuarioId());
     ps.setString(2, funcionario.getNome());
     ps.setString(3, funcionario.getCPF());
     ps.setString(4, funcionario.getEmail());
     ps.setString(5, funcionario.getEndereco());
     ps.setString(6, funcionario.getTelefone());
     ps.setString(7, funcionario.getEstado());
     ps.setString(8, funcionario.getCategoria());
     int result = ps.executeUpdate();
  }    
    
    public void excluir(FuncionarioDO funcionario, Transacao tr) throws Exception {
     excluir(funcionario.getId(), tr);
  } 
    
  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Funcionario where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  }    
    
  public void atualizar(FuncionarioDO funcionario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Funcionario set Usuario_ID=?, Nome=?, CPF=? ,email=?, Endereco=?, Telefone=?, Estado=?, Categoria=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, funcionario.getUsuarioId());
     ps.setString(2, funcionario.getNome());
     ps.setString(3, funcionario.getCPF());
     ps.setString(4, funcionario.getEmail());
     ps.setString(5, funcionario.getEndereco());
     ps.setString(6, funcionario.getTelefone());
     ps.setString(7, funcionario.getEstado());
     ps.setString(8, funcionario.getCategoria());
     ps.setInt(9, funcionario.getId());
     int result = ps.executeUpdate();
  }
  
      public FuncionarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Funcionario where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     FuncionarioDO funcionario = new FuncionarioDO();
     funcionario.setId (rs.getInt("id"));
     funcionario.setUsuarioId (rs.getInt("Usuario_ID"));
     funcionario.setNome (rs.getString("Nome"));
     funcionario.setCPF (rs.getString("CPF"));
     funcionario.setEmail (rs.getString("email"));
     funcionario.setEndereco (rs.getString("Endereco"));
     funcionario.setTelefone (rs.getString("Telefone"));
     funcionario.setEstado(rs.getString("Estado"));
     funcionario.setCategoria (rs.getString("Categoria"));
     return funcionario;
  }
   
     public FuncionarioDO buscarPorUsuarioID(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Funcionario where  Usuario_ID=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     FuncionarioDO funcionario = new FuncionarioDO();
     funcionario.setId (rs.getInt("id"));
     funcionario.setUsuarioId (rs.getInt("Usuario_ID"));
     funcionario.setNome (rs.getString("Nome"));
     funcionario.setCPF (rs.getString("CPF"));
     funcionario.setEmail (rs.getString("email"));
     funcionario.setEndereco (rs.getString("Endereco"));
     funcionario.setTelefone (rs.getString("Telefone"));
     funcionario.setCategoria(rs.getString("Categoria"));
     return funcionario;
      }
      
      public Vector pesquisarPorLogin(String login, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from  where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, login);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        FuncionariosDO funcionario = new FuncionarioDO();
        funcionario.setId (rs.getInt("id"));
     funcionario.setUsuarioId (rs.getInt("Usuario_ID"));
     funcionario.setNome (rs.getString("Nome"));
     funcionario.setCPF (rs.getString("CPF"));
     funcionario.setEmail (rs.getString("email"));
     funcionario.setEndereco (rs.getString("Endereco"));
     funcionario.setTelefone (rs.getString("Telefone"));
     funcionario.setCategoria(rs.getString("Categoria"));
     
        usuarios.add(funcionario);
     }
     return usuarios;
  } // pesquisarPorLogin
}
