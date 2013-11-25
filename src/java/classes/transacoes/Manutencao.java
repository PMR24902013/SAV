/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.ManutencaoDO;
import classes.data.ManutencaoData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Manutencao {
    public boolean incluir (ManutencaoDO op) throws Exception{

     // validacao das regras de negocio nao estou conseguindo colocar se int ==null ou float ==null
     

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
        ManutencaoData cdata = new ManutencaoData();
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

  public boolean atualizar(ManutencaoDO op) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ManutencaoData cdata = new ManutencaoData();
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

  public boolean excluir(ManutencaoDO Posto) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ManutencaoData cdata = new ManutencaoData();
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
  public ManutencaoDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ManutencaoData cdata = new ManutencaoData();
	     ManutencaoDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  
  public Vector buscarPorEstado(String estado) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ManutencaoData cdata = new ManutencaoData();
           Vector v = cdata.buscarPorEstado(estado, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar

    public Vector buscarPorID(int idobj) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ManutencaoData cdata = new ManutencaoData();
           Vector v = cdata.buscarPorID(idobj, tr);
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
      Manutencao c = new Manutencao();
    ManutencaoDO op = new ManutencaoDO();
      try {
	    op = c.buscar(6);
		
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
}

