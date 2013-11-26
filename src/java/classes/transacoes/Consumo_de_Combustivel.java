/* 
    Document   : Consumo_de_Combustível
    Created on : 22/11/2013, 10:44:08
    Author     : Lígia Bárbara
*/

package classes.transacoes;

import classes.data.Consumo_de_CombustivelDO;
import classes.data.Consumo_de_CombustivelData;
import classes.utils.Transacao;
import java.util.Vector;


public class Consumo_de_Combustivel {
    
    public static void main (String [] args){
        Consumo_de_Combustivel cc = new Consumo_de_Combustivel();
        Consumo_de_CombustivelDO consumo = new Consumo_de_CombustivelDO();
    }
    
    public void incluir (Consumo_de_CombustivelDO consumo) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
            Consumo_de_CombustivelData ccdata = new Consumo_de_CombustivelData();
            ccdata.incluir(consumo, tr);
            tr.commit();           
        }
        catch (Exception e){
            tr.rollback();
            System.out.println("Erro ao incluir");
            e.printStackTrace();
        }
 
    }
    
    public Consumo_de_CombustivelDO buscar (int idobj) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
            Consumo_de_CombustivelData ccdata = new Consumo_de_CombustivelData();
            Consumo_de_CombustivelDO cc = ccdata.buscar(idobj, tr);
            tr.commit();
            return cc;            
        }
        catch (Exception e){
            tr.rollback();
            System.out.println("Erro ao buscar" + idobj);
            e.printStackTrace();
        }
        return null;
    }
    
    public Vector pesquisarPorPostoID(int idobj) {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            Consumo_de_CombustivelData vdata = new Consumo_de_CombustivelData();
            Vector v = vdata.pesquisarPorPostoID(idobj, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar postos");
            e.printStackTrace();
        }
        return null;
    } // pesquisarTodos
    
    public boolean atualizar (Consumo_de_CombustivelDO consumo) throws Exception {
        Transacao tr = new Transacao();
        try{
            tr.begin();
            Consumo_de_CombustivelData ccdata = new Consumo_de_CombustivelData();
            ccdata.atualizar(consumo, tr);
            tr.commit();
            return true;
        }
        catch (Exception e){
            tr.rollback();
            System.out.println("Erro ao atualizar");
            e.printStackTrace();
        }
        return false;
    }
    
  }
