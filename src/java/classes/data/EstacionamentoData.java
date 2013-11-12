package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

public class EstacionamentoData {

  public void incluir(EstacionamentoDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Estacionamento (Usuario_ID, Nome, Endereco, Vagas, Tipo, Nome_do_Responsavel, Documento_do_Convenio, Horario_de_Funcionamento, Telefone) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, e.getUsuario_Id());
     ps.setString(2, e.getNome());
     ps.setString(3, e.getEndereco());
     ps.setInt(4, e.getVagas());
     ps.setBoolean(5, e.getTipo());
     ps.setString(6, e.getNome_Do_Responsavel());
     ps.setString(7, e.getDocumento_Do_Convenio());
     ps.setString(8, e.getHorario_De_Funcionamento());
     ps.setString(9, e.getTelefone());
     int result = ps.executeUpdate();
  }

  public void excluir(EstacionamentoDO e, Transacao tr) throws Exception {
     excluir(e.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Estacionamento where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir 

  //BRU_DUVIDA: Atualizar cada campo ou todos?
  public void atualizar(EstacionamentoDO e, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Estacionamento set Nome=?, Endereco=?, Vagas=?, Tipo=?, Nome_do_Responsavel=?, Documento_do_Convenio=?, Horario_de_Funcionamento=?, Telefone=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, e.getNome());
     ps.setString(2, e.getEndereco());
     ps.setInt(3, e.getVagas());
     ps.setBoolean(4, e.getTipo());
     ps.setString(5, e.getNome_Do_Responsavel());
     ps.setString(6, e.getDocumento_Do_Convenio());
     ps.setString(7, e.getHorario_De_Funcionamento());
     ps.setString(8, e.getTelefone());
	 ps.setInt(9, e.getId());
     int result = ps.executeUpdate();
  } // atualizar

  //BRU_DUVIDA: O que � importante na busca?
  public EstacionamentoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Estacionamento where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     EstacionamentoDO e = new EstacionamentoDO();
     e.setId (rs.getInt("ID"));
     e.setNome (rs.getString("Nome"));
     e.setEndereco(rs.getString("Endereco"));
     e.setVagas(rs.getInt("Vagas"));
     e.setTipo(rs.getBoolean("Tipo"));
     e.setNome_Do_Responsavel(rs.getString("Nome_do_Responsavel"));
     e.setDocumento_Do_Convenio(rs.getString("Documento_do_Convenio"));
     e.setHorario_De_Funcionamento(rs.getString("Horairo_de_Funcionamento"));
     e.setTelefone(rs.getString("Telefone"));
     return e;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Estacionamento where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector estacionamentos = new Vector();
     while (rs.next()) {
        EstacionamentoDO e = new EstacionamentoDO();
        e.setId (rs.getInt("ID"));
        e.setNome (rs.getString("Nome"));
        System.out.println(" got " + e.getNome());
        e.setEndereco(rs.getString("Endereco"));
        e.setVagas(rs.getInt("Vagas"));
        e.setTipo(rs.getBoolean("Tipo"));
        e.setNome_Do_Responsavel(rs.getString("Nome_do_Responsavel"));
        e.setDocumento_Do_Convenio(rs.getString("Documento_do_Convenio"));
        e.setHorario_De_Funcionamento(rs.getString("Horairo_de_Funcionamento"));
        e.setTelefone(rs.getString("Telefone"));
        estacionamentos.add(e);
     }
     return estacionamentos;
  } // pesquisarPorNome
  
  public Vector listar(Transacao tr) throws Exception{
      Connection con = tr.obterConexao();
      String sql = "select * from Estacionamento";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      Vector estacionamentos = new Vector();
      while(rs.next()){
        EstacionamentoDO e = new EstacionamentoDO();
        e.setId (rs.getInt("ID"));
        e.setNome (rs.getString("Nome"));
        System.out.println(" got " + e.getNome());
        e.setEndereco(rs.getString("Endereco"));
        e.setVagas(rs.getInt("Vagas"));
        e.setTipo(rs.getBoolean("Tipo"));
        e.setNome_Do_Responsavel(rs.getString("Nome_do_Responsavel"));
        e.setDocumento_Do_Convenio(rs.getString("Documento_do_Convenio"));
        e.setHorario_De_Funcionamento(rs.getString("Horairo_de_Funcionamento"));
        e.setTelefone(rs.getString("Telefone"));
        estacionamentos.add(e);
      }
      return estacionamentos;
  }

} // ContatoData