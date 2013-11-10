/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.AssistenciaTecnicaDO;
import classes.data.AssistenciaTecnicaData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author Nadia
 */
public class AssistenciaTecnica {
    public boolean incluir (AssistenciaTecnicaDO assist) throws Exception{

     // validacao das regras de negocio
     if ( ( isEmpty(assist.getQueixa()))||( isEmpty(assist.getEndereco()))||( isEmpty(assist.getData()))||( isEmpty(assist.getEstadoFinal()))) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         AssistenciaTecnicaData cdata = new AssistenciaTecnicaData();
         cdata.incluir(assist, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir chamado " );
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(AssistenciaTecnicaDO assist) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    AssistenciaTecnicaData cdata = new AssistenciaTecnicaData();
	     cdata.atualizar(assist, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar assistencia");
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(AssistenciaTecnicaDO cliente) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     AssistenciaTecnicaData cdata = new AssistenciaTecnicaData();
	     cdata.excluir(cliente, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir assistencia" );
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public AssistenciaTecnicaDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     AssistenciaTecnicaData cdata = new AssistenciaTecnicaData();
	     AssistenciaTecnicaDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
   public AssistenciaTecnicaDO buscarPorClienteUsuarioID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     AssistenciaTecnicaData cdata = new AssistenciaTecnicaData();
             Vector tn= new Vector();
             tn= cdata.pesquisarPorClienteID(idobj, tr);
	     AssistenciaTecnicaDO c =(AssistenciaTecnicaDO)tn.get(0);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
     AssistenciaTecnica c = new AssistenciaTecnica();
      AssistenciaTecnicaDO contato = new AssistenciaTecnicaDO();
      try {
	    contato = c.buscar(6);
		
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
    
}
