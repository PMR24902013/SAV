package classes.transacoes;

import java.util.Vector;
import classes.utils.Transacao;
import classes.data.*;

public class Estacionamento {
    
    public Vector listar() throws Exception{
        Transacao tr = new Transacao();
        
        try{
            tr.begin();
            EstacionamentoData e = new EstacionamentoData();
            Vector estacionamentos = new Vector();
            estacionamentos = e.listar(tr);
            tr.commit();
            return estacionamentos;
        } catch(Exception e){
            tr.rollback();
            System.out.println("Erro ao incluir listar estacionamentos...");
            e.printStackTrace();
        }
        
        return null;
    }
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
    
}
