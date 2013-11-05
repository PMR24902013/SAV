/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import java.util.Vector;
import classes.utils.*;
import classes.data.*;
import java.util.*;

/**
 *
 * @author hidden
 */
public class Usuarios {




  public boolean incluir (UsuariosDO contato) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(contato.getLogin())) || ( isEmpty(contato.getSenha())) ||( isEmpty(contato.getTipo()))) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         UsuariosData cdata = new UsuariosData();
         cdata.incluir(contato, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + contato.getLogin());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(UsuariosDO contato) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuariosData cdata = new UsuariosData();
	     cdata.atualizar(contato, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + contato.getLogin());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(UsuariosDO contato) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuariosData cdata = new UsuariosData();
	     cdata.excluir(contato, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + contato.getLogin());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public UsuariosDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuariosData cdata = new UsuariosData();
	     UsuariosDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public Vector pesquisar(String nome) {
     if ( isEmpty(nome) )
        return null;

     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           UsuariosData cdata = new UsuariosData();
           Vector v = cdata.pesquisarPorLogin(nome, tr);
           
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Usuarios c = new Usuarios();
      UsuariosDO contato = new UsuariosDO();
      try {
	    contato = c.buscar(6);
		System.out.println(contato.getLogin());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
 
    
}
