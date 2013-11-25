/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.EstacionamentoDO;
import classes.data.EstacionamentoData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Estacionamento {
     public boolean incluir (EstacionamentoDO estacionamento) throws Exception{

     // validacao das regras de negocio
     
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         EstacionamentoData cdata = new EstacionamentoData();
         cdata.incluir(estacionamento, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + estacionamento.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(EstacionamentoDO estacionamento) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    EstacionamentoData cdata = new EstacionamentoData();
	     cdata.atualizar(estacionamento, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + estacionamento.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(EstacionamentoDO estacionamento) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     EstacionamentoData cdata = new EstacionamentoData();
	     cdata.excluir(estacionamento, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + estacionamento.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public EstacionamentoDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     EstacionamentoData cdata = new EstacionamentoData();
	     EstacionamentoDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
   public EstacionamentoDO buscarPorUsuarioID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     EstacionamentoData cdata = new EstacionamentoData();
	     EstacionamentoDO c = cdata.buscarPorUsuarioID(idobj, tr);
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
            EstacionamentoData cdata = new EstacionamentoData();
            Vector v = cdata.pesquisarPorNome(nome, tr);
           
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
            EstacionamentoData cdata = new EstacionamentoData();
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
  	    EstacionamentoData cdata = new EstacionamentoData();
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
    
        public String buscarNome(int id) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    EstacionamentoData cdata = new EstacionamentoData();
            
	    String c = cdata.buscarNome(id,tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) { 
	   tr.rollback();
	   System.out.println("erro ao atualizar situação do cadastro");
	   e.printStackTrace();
	 }
	 return null;
  } // atualizar
        
  public boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
  
  public boolean isEmpty(int s) {
     if (null == (Integer) s)
       return true;
     return false;
  }
  
}