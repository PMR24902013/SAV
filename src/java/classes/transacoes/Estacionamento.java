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
    
}
