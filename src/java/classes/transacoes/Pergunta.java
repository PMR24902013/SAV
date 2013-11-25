/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.transacoes;

import classes.data.PerguntaDO;
import classes.data.PerguntaData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Pergunta {
    
     public boolean incluir (PerguntaDO duvida) throws Exception{

     // validacao das regras de negocio
     
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
        PerguntaData cdata = new PerguntaData();
         cdata.incluir(duvida, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return false;
  } // incluir
     
     public boolean atualizar(PerguntaDO pergunta) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    PerguntaData cdata = new PerguntaData();
	     cdata.atualizar(pergunta, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + pergunta.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
     
      public Vector buscarPorEstado(boolean estado) {

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            PerguntaData cdata = new PerguntaData();
            Vector v = cdata.buscarPorEstado(estado, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar ");
            e.printStackTrace();
        }
        return null;
    } // pesquisar
      
       public PerguntaDO buscar(int idobj) {

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            PerguntaData cdata = new PerguntaData();
            PerguntaDO pergunta = cdata.buscar(idobj, tr);
            tr.commit();
            return pergunta;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar ");
            e.printStackTrace();
        }
        return null;
    } // pesquisar
     
}