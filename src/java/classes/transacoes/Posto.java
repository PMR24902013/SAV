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
  
  public PostoDO buscarPorUsuarioID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     PostoData cdata = new PostoData();
	     PostoDO c = cdata.buscarPorUsuarioID(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  public PostoDO buscarPorNome(String nome) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     PostoData cdata = new PostoData();
	     PostoDO c = cdata.buscarPorNome(nome, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + nome);
	   e.printStackTrace();
	 }
	 return null;
  }

   public boolean atualizarCadastro(int id, String Estado) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    PostoData pdata = new PostoData();
	     pdata.atualizarCadastro(id, Estado, tr);
	   tr.commit(); 
	   return true;
	 } catch (Exception e) { 
	   tr.rollback();
	   System.out.println("erro ao atualizar situação do cadastro");
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
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
  
  public Vector pesquisarCadastro(String estado) {
        if (isEmpty(estado)) {
            return null;
        }

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            PostoData pdata = new PostoData();
            Vector v = pdata.pesquisarCadastro(estado, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar cadastro");
            e.printStackTrace();
        }
        return null;
    } // pesquisarCadastro

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
