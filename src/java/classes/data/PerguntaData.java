/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;
public class PerguntaData {
    
    public void incluir(PerguntaDO pergunta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Duvida (Nome, email, Pergunta, Estado) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, pergunta.getNome());
     ps.setString(2, pergunta.getEmail());
     ps.setString(3, pergunta.getPergunta());
     ps.setBoolean(4, pergunta.getEstado());
     int result = ps.executeUpdate();
  }    
    
    
  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Duvida where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  }    
    
  public void atualizar(PerguntaDO pergunta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Duvida set Funcionario_ID=?, Nome=?, email=? ,Pergunta=?, Estado=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, pergunta.getFuncionarioId());
     ps.setString(2, pergunta.getNome());
     ps.setString(3, pergunta.getEmail());
     ps.setString(4, pergunta.getPergunta());
     ps.setBoolean(5, pergunta.getEstado());
     int result = ps.executeUpdate();
  }/*
  
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
     cliente.setEstado(rs.getString("Estado"));
     return cliente;
      }
      public ClientesDO buscarPorUsuarioID(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Cliente where  Usuario_ID=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ClientesDO cliente = new ClientesDO();
     cliente.setId (rs.getInt("ID"));
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
      public Vector pesquisarPorLogin(String login, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Cliente where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, login);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
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
        usuarios.add(cliente);
     }
     return usuarios;
  } // pesquisarPorLogin
  
      public Vector pesquisarCadastro(String estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Cliente where Estado =?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, estado);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector cadastro = new Vector();
     while (rs.next()){
        ClientesDO c = new ClientesDO();
        c.setNome(rs.getString("Nome"));
        c.setId(rs.getInt("ID"));
        cadastro.add(c);
     }
     return cadastro;
  } // pesquisarCadastro
      
      public void atualizarCadastro(int id, String estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Cliente set Estado=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, estado);
     ps.setInt(2, id);
     int result = ps.executeUpdate();
  }// atualizarCadastro
  */
}