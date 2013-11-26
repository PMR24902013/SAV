/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.transacoes;

import classes.data.PrecosDO;
import classes.data.PrecosData;
import classes.utils.Transacao;
import java.util.Vector;


public class Precos {

    public PrecosDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     PrecosData pdata = new PrecosData();
	     PrecosDO p = pdata.buscar(idobj, tr);
	   tr.commit();
	   return p; 
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
    
    public PrecosDO buscarPorModeloID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     PrecosData pdata = new PrecosData();
	     PrecosDO p = pdata.buscarPorModeloID(idobj, tr);
	   tr.commit();
	   return p; 
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
    
     public boolean atualizar(PrecosDO preco) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     PrecosData cdata = new PrecosData();
	     cdata.atualizar(preco, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar");
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
    public static void main(String[] args) {
        Precos p = new Precos();
      PrecosDO precos = new PrecosDO();
    }
    
}
