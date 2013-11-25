/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.ClientesDO;
import classes.data.ClientesData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Clientes {
     public boolean incluir (ClientesDO cliente) throws Exception{

     // validacao das regras de negocio
     
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ClientesData cdata = new ClientesData();
         cdata.incluir(cliente, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + cliente.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(ClientesDO cliente) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    ClientesData cdata = new ClientesData();
	     cdata.atualizar(cliente, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + cliente.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(ClientesDO cliente) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ClientesData cdata = new ClientesData();
	     cdata.excluir(cliente, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + cliente.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public ClientesDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ClientesData cdata = new ClientesData();
	     ClientesDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  
  // Eduardo
  public ClientesDO buscar(String nome) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	   ClientesData cdata = new ClientesData();
	   ClientesDO c = cdata.buscar(nome, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + nome);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  
   public ClientesDO buscarPorUsuarioID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ClientesData cdata = new ClientesData();
	     ClientesDO c = cdata.buscarPorUsuarioID(idobj, tr);
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
          ClientesData cdata = new ClientesData();
           Vector v = cdata.pesquisarPorLogin(nome, tr);
           
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
    public Vector pesquisarCadastro(String estado) {
        if (isEmpty(estado)) {
            return null;
        }

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ClientesData cdata = new ClientesData();
            Vector v = cdata.pesquisarCadastro(estado, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar cadastro");
            e.printStackTrace();
        }
        return null;
    } // pesquisar

    public boolean atualizarCadastro(int id, String Estado) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    ClientesData cdata = new ClientesData();
	     cdata.atualizarCadastro(id, Estado, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) { 
	   tr.rollback();
	   System.out.println("erro ao atualizar situação do cadastro");
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  public boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Clientes c = new Clientes();
      ClientesDO contato = new ClientesDO();
      try {
	    contato = c.buscar(6);
		System.out.println(contato.getNome());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
 
    
}
