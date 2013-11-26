/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.vagaDO;
import classes.data.vagaDATA;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Vaga {

    public Vector buscarPorNumero(int numero, int estacionamentoID) throws Exception {
     
     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           vagaDATA vdata = new vagaDATA();
           Vector v = vdata.pesquisarPorEstacionamentoId(numero, estacionamentoID, tr);
           tr.commit();
           return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
    
    public boolean incluir (vagaDO vaga) throws Exception{

     // validacao das regras de negocio
     if ( isEmpty(String.valueOf(vaga.getEstacionamento_id()) ) || isEmpty(String.valueOf(vaga.getNumero() )) )  {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         vagaDATA vdata = new vagaDATA();
         vdata.incluir(vaga, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return false;
  } // incluir

    private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}
