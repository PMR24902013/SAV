/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

/**
 *
 * @author Ligia
 */
public class UsuariosDO {
    private int _id;
  private String _login;
  private String _senha;
  private String _tipo;

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId

  public String getLogin() {
      return _login;
  } // getLogin
  
  public void setLogin(String login) {
      _login = login;
  } // setLogin
  
  public String getSenha() {
      return _senha;
  } // getSenha
  
  public void setSenha(String senha) {
      _senha = senha;
  } // setSenha
  
  public String getTipo(){
      return _tipo;
  } // getTipo
  
  public void setTipo(String tipo){
      _tipo = tipo;
  } // setTipo
  
} // UsuariosDO
