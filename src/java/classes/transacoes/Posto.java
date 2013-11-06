/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.PostoDO;
import classes.data.PostoData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Posto {
    
     public boolean incluir (PostoDO Posto) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(Posto.getNome())) || ( isEmpty(Posto.getEndereco())) ||( isEmpty(Posto.getTelefone()))||( isEmpty(Posto.getHorario()))||( isEmpty(Posto.getResponsavel()))||( isEmpty(Posto.getDocumento()) )){
      return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
        PostoData cdata = new PostoData();
         cdata.incluir(Posto, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + Posto.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(PostoDO Posto) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     PostoData cdata = new PostoData();
	     cdata.atualizar(Posto, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + Posto.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(PostoDO Posto) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     PostoData cdata = new PostoData();
	     cdata.excluir(Posto, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + Posto.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public PostoDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     PostoData cdata = new PostoData();
	     PostoDO c = cdata.buscar(idobj, tr);
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
           PostoData cdata = new PostoData();
           Vector v = cdata.pesquisarPorLogin(nome, tr);
           
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Posto c = new Posto();
     PostoDO contato = new PostoDO();
      try {
	    contato = c.buscar(6);
		System.out.println(contato.getNome());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
 
    
}
