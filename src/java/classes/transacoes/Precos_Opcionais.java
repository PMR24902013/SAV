/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.transacoes;

import classes.data.Precos_OpcionaisDO;
import classes.data.Precos_OpcionaisData; 
import classes.utils.Transacao;
import java.util.Vector;
/**
 *
 * @author Bruna
 */
public class Precos_Opcionais {
    
public Vector pesquisar() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            Precos_OpcionaisData pdata = new Precos_OpcionaisData();
            Vector v = pdata.pesquisar(tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar Precos Opcionais");
            e.printStackTrace();
        }
        return null;
    } // pesquisarTodos
}
