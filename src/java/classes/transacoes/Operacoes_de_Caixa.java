/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.Operacoes_de_CaixaDO;
import classes.data.Operacoes_de_CaixaData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Operacoes_de_Caixa {
    public boolean incluir (Operacoes_de_CaixaDO op) throws Exception{

     // validacao das regras de negocio nao estou conseguindo colocar se int ==null ou float ==null
     

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
        Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
         cdata.incluir(op, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " );
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(Operacoes_de_CaixaDO op) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
	     cdata.atualizar(op, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" );
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(Operacoes_de_CaixaDO Posto) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
	     cdata.excluir(Posto, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" );
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public Operacoes_de_CaixaDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
	     Operacoes_de_CaixaDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public Vector buscarPorUsuarioID(int id) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
           Vector v = cdata.buscarPorUsuarioID(id, tr);
           
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
  public Vector buscarPorEstado(String estado) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           Operacoes_de_CaixaData cdata = new Operacoes_de_CaixaData();
           Vector v = cdata.buscarPorEstado(estado, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
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
      Operacoes_de_Caixa c = new Operacoes_de_Caixa();
    Operacoes_de_CaixaDO op = new Operacoes_de_CaixaDO();
      try {
	    op = c.buscar(6);
		
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
}
