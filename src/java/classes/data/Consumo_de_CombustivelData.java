/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

/**
 *
 * @author hidden
 */
import java.sql.*;
import java.util.*;
import classes.utils.Transacao;
public class Consumo_de_CombustivelData {
    


  public void incluir(Consumo_de_CombustivelDO consumo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Consumo_de_Combustivel ( Operacoes_de_Caixa_ID, Cliente_ID,  Posto_ID, Tipo, Quantidade, Preco_Total, Horario) VALUES (?,?,?, ?, ?, ?, ?);";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, consumo.getOperacoesDeCaixaID());
     ps.setInt(2, consumo.getClienteId());
     ps.setInt(3, consumo.getPostoId());
     ps.setString(4, consumo.getTipo());
     ps.setFloat(5, consumo.getQuantidade());
     ps.setFloat(6, consumo.getPrecoTotal());
     ps.setString(7, consumo.getHorario());
     
     
     int result = ps.executeUpdate();
  }

  public void excluir(Consumo_de_CombustivelDO consumo, Transacao tr) throws Exception {
     excluir(consumo.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
      Connection con = tr.obterConexao();
     String sql = "update Consumo_de_Combustivel set Operacoes_de_Caixa_ID=null, Cliente_ID=null,  Posto_ID=null, =null, Quantidade=null, Preco_Total=null, Horario=null where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     
     ps.setInt(1, idobj);
       int result = ps.executeUpdate();
 
     
     
  } // excluir 

  public void atualizar(Consumo_de_CombustivelDO consumo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Consumo_de_Combustivel set Operacoes_de_Caixa_ID=?, Cliente_ID=?,  Posto_ID=?, Tipo=?, Quantidade=?, Preco_Total=?, Horario=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, consumo.getOperacoesDeCaixaID());
     ps.setInt(2, consumo.getClienteId());
     ps.setInt(3, consumo.getPostoId());
     ps.setString(4, consumo.getTipo());
     ps.setFloat(5, consumo.getQuantidade());
     ps.setFloat(6, consumo.getPrecoTotal());
     ps.setString(7, consumo.getHorario());
     
	 ps.setInt(8, consumo.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public Consumo_de_CombustivelDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Consumo_de_Combustivel where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Consumo_de_CombustivelDO consumo = new Consumo_de_CombustivelDO();
     consumo.setId(rs.getInt("id"));
     consumo.setOperacoesDeCaixaID(rs.getInt("Operacoes_de_Caixa_ID"));
   consumo.setClienteId(rs.getInt("Cliente_ID"));
      consumo.setPostoId(rs.getInt("Posto_ID"));
     consumo.setTipo(rs.getString("Tipo")) ;
             consumo.setQuantidade(rs.getFloat("Quantidade"));
      consumo.setPrecoTotal(rs.getFloat(" Preco_Total"));
      consumo.setHorario(rs.getString("Horario"));
    
     return consumo;
  } // buscar

   public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Consumo_de_Combustivel where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector consumo = new Vector();
     while (rs.next()) {
        Consumo_de_CombustivelDO c = new Consumo_de_CombustivelDO();
        c.setId (rs.getInt("id"));
        c.setOperacoesDeCaixaID(rs.getInt("Operacoes_de_Caixa_ID"));
   c.setClienteId(rs.getInt("Cliente_ID"));
      c.setPostoId(rs.getInt("Posto_ID"));
     c.setTipo(rs.getString("Tipo")) ;
             c.setQuantidade(rs.getFloat("Quantidade"));
      c.setPrecoTotal(rs.getFloat(" Preco_Total"));
      c.setHorario(rs.getString("Horario"));
        consumo.add(c);
     }
     return consumo;
  } // pesquisarPorNome
} // ContatoData
