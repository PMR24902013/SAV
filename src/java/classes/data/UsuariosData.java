package classes.data;

import java.sql.*;
import java.util.*;
import classes.utils.Transacao;

/**
 *
 * @author Ligia
 */
public class UsuariosData {
    public void incluir(UsuariosDO usuarios, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Usuarios (login, senha, tipo) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuarios.getLogin());
     ps.setString(2, usuarios.getSenha());
     ps.setString(3, usuarios.getTipo());
     int result = ps.executeUpdate();
  }

  public void excluir(UsuariosDO usuarios, Transacao tr) throws Exception {
     excluir(usuarios.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Usuarios where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     String id = ""+idobj;
     ps.setString(1, id);
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(UsuariosDO usuarios, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Usuarios set login=?, senha=?, tipo=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuarios.getLogin());
     ps.setString(2, usuarios.getSenha());
     ps.setString(3, usuarios.getTipo());
	 ps.setInt(4, usuarios.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public UsuariosDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuarios where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuariosDO usuarios = new UsuariosDO();
     usuarios.setId (rs.getInt("id"));
     usuarios.setLogin (rs.getString("login"));
     usuarios.setSenha (rs.getString("senha"));
     usuarios.setTipo (rs.getString("tipo"));
     return usuarios;
  } // buscar

  public Vector pesquisarPorLogin(String login, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuarios where login like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, login);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        UsuariosDO c = new UsuariosDO();
        c.setId (rs.getInt("id"));
        c.setLogin (rs.getString("login"));
        c.setSenha(rs.getString("senha"));
        c.setTipo(rs.getString("tipo"));
        usuarios.add(c);
     }
     return usuarios;
  } // pesquisarPorLogin
    
}
