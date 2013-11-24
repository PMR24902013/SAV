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
     
}