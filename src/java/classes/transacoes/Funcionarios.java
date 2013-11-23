/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.utils.Transacao;
import classes.data.*;
/**
 *
 * @author User
 */
public class Funcionarios {
    
    public boolean incluirFuncionarioManutencao (FuncionarioDO funcionario){
        // validacao das regras de negocio
     if ( (isEmpty(funcionario.getNome())) || isEmpty(funcionario.getCPF()) || isEmpty(funcionario.getEmail()) || isEmpty(funcionario.getEndereco()) ||
             ( isEmpty(funcionario.getTelefone())) || funcionario.getCategoria()!="1" ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
       FuncionarioData cdata = new FuncionarioData();
       cdata.incluir(funcionario, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         //tr.rollback();
         System.out.println("erro ao incluir " + funcionario.getNome());
         e.printStackTrace();
     }
     return false;
        
    }
    
private boolean isEmpty(String s) {
     if (null == s)
        return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}
