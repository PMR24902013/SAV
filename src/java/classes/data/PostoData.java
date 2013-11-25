/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import classes.utils.Transacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class PostoData {
     public void incluir(PostoDO posto, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Posto (Usuarios_ID, Nome, Endereco, Telefone, Horario_de_Funcionamento, Responsavel, Documento_de_Licenciamento, Estado) VALUES (?,?,?,?,?,?,?,?)";
     PreparedStatement ps = con.prepareStatement(sql);
     
     ps.setInt(1, posto.getUsuariosID());
     ps.setString(2, posto.getNome());
     ps.setString(3, posto.getEndereco());
     ps.setString(4, posto.getTelefone());
     ps.setString(5, posto.getHorario());
     ps.setString(6, posto.getResponsavel());
     ps.setString(7, posto.getDocumento());
     ps.setString(8, posto.getEstado());
     int result = ps.executeUpdate();
  }

  public void excluir(PostoDO posto, Transacao tr) throws Exception {
     excluir(posto.getID(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Posto where id=?";
     PreparedStatement ps = con.prepareStatement(sql); 
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(PostoDO posto, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Posto set Usuarios_ID=?, Nome=?, Endereco=?, Telefone=?, Horario_de_Funcionamento=?, Responsavel=?, Documento_de_Licenciamento=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, posto.getID());
     ps.setInt(2, posto.getUsuariosID());
     ps.setString(3, posto.getNome());
     ps.setString(4, posto.getEndereco());
     ps.setString(5, posto.getTelefone());
     ps.setString(6, posto.getHorario());
     ps.setString(7, posto.getResponsavel());
     ps.setString(8, posto.getDocumento());
     int result = ps.executeUpdate();
  } // atualizar

  public PostoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Posto where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     PostoDO posto = new PostoDO();
     posto.setID (rs.getInt("ID"));
     posto.setUsuariosID (rs.getInt("Usuarios_ID"));
     posto.setNome (rs.getString("Nome"));
     posto.setEndereco (rs.getString("Endereco"));
     posto.setTelefone (rs.getString("Telefone"));
     posto.setHorario (rs.getString("Horario_de_Funcionamento"));
     posto.setResponsavel (rs.getString("Responsavel"));
     posto.setDocumento(rs.getString("Documento_de_Licenciamento"));
     return posto;
  } // buscar
  
  public PostoDO buscarPorUsuarioID(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Posto where Usuarios_ID=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     PostoDO posto = new PostoDO();
     posto.setID (rs.getInt("id"));
     posto.setUsuariosID (rs.getInt("Usuarios_ID"));
     posto.setNome (rs.getString("nome"));
     posto.setEndereco (rs.getString("endereco"));
     posto.setTelefone (rs.getString("telefone"));
     posto.setHorario (rs.getString("Horario_de_Funcionamento"));
     posto.setResponsavel (rs.getString("Responsavel"));
     posto.setDocumento(rs.getString("Documento_de_Licenciamento"));
     posto.setGasolina(rs.getString("Preco_da_gasolina"));
     posto.setAlcool(rs.getString("Preco_do_alcool"));
     return posto;
  } // buscar
  
  public PostoDO buscarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Posto where Nome=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     rs.next();
     PostoDO posto = new PostoDO();
     posto.setID (rs.getInt("id"));
     posto.setUsuariosID (rs.getInt("Usuarios_ID"));
     posto.setNome (rs.getString("Nome"));
     posto.setEndereco (rs.getString("endereco"));
     posto.setTelefone (rs.getString("telefone"));
     posto.setHorario (rs.getString("Horario_de_Funcionamento"));
     posto.setResponsavel (rs.getString("Responsavel"));
     posto.setDocumento(rs.getString("Documento_de_Licenciamento"));
     posto.setGasolina(rs.getString("Preco_da_gasolina"));
     posto.setAlcool(rs.getString("Preco_do_alcool"));
     return posto;
  } // buscar

  public Vector pesquisarPorLogin(String login, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Posto where login like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, login);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector postos = new Vector();
     while (rs.next()) {
        PostoDO posto = new PostoDO();
         posto.setID (rs.getInt("id"));
      posto.setUsuariosID (rs.getInt("Usuarios_ID"));
     posto.setNome (rs.getString("nome"));
     posto.setEndereco (rs.getString("endereco"));
     posto.setTelefone (rs.getString("telefone"));
     posto.setHorario (rs.getString("Horario_de_Funcionamento"));
     posto.setResponsavel (rs.getString("Responsavel"));
     posto.setDocumento(rs.getString("Documento_de_Licenciamento"));
        postos.add(posto);
     }
     return postos;
  } // pesquisarPorLogin
  
  public Vector pesquisarCadastro(String estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Posto where Estado =?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, estado);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector cadastro = new Vector();
     while (rs.next()){
        PostoDO p = new PostoDO();
        p.setNome(rs.getString("Nome"));
        p.setID(rs.getInt("ID"));
        cadastro.add(p);
     }
     return cadastro;
  } // pesquisarCadastro
    
   public void atualizarCadastro(int id, String estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Posto set Estado=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, estado);
     ps.setInt(2, id);
     int result = ps.executeUpdate(); 
  }// atualizarCadastro
  
}
