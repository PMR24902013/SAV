/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.transacoes;

import classes.data.ModelosDO;
import classes.data.ModelosData;
import classes.utils.Transacao;
import com.google.common.collect.Iterables;
import java.util.Vector;

public class Modelos {

    public Vector pesquisarTodos() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ModelosData mdata = new ModelosData();
            Vector v = mdata.pesquisarTodos(tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar modelos");
            e.printStackTrace();
        }
        return null;
    } // pesquisarTodos

    public Vector buscar(String modelo, String ano){
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ModelosData mdata = new ModelosData();
            Vector v = mdata.buscar(modelo, ano, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao buscar modelos");
            e.printStackTrace();
        }
        return null;
    } // buscar
    
    public ModelosDO pesquisarModelo(int ID) {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ModelosData mdata = new ModelosData();
            ModelosDO modelos = mdata.pesquisarModelo(tr, ID);
            tr.commit();
            return modelos;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar modelos");
            e.printStackTrace();
        }
        return null;
    } // pesquisarTodos
    
    public ModelosDO buscar(int idobj){
        Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	   ModelosData cdata = new ModelosData();
	   ModelosDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   //tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
    }
    
    public boolean incluir (ModelosDO modelo) throws Exception{
        if (isEmpty(String.valueOf(modelo.getAno())) || isEmpty(modelo.getMarca()) || isEmpty(modelo.getModelo())){
            return false;
        }
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {

            tr.begin();
            ModelosData cdata = new ModelosData();
            cdata.incluir(modelo, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + modelo.getModelo());
            e.printStackTrace();
          }
        return false;
    } // incluir
    
    public boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
    public static void main(String[] args) {
        Modelos m = new Modelos();
      ModelosDO modelos = new ModelosDO();
    }
    
}
