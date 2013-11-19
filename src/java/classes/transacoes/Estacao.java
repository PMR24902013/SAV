/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.transacoes;

import java.util.Vector;
import classes.utils.*;
import classes.data.*;
import java.util.*;

/**
 *
 * @author User
 */
public class Estacao {
    

  public boolean incluir (EstacionamentoDO estacionamento) throws Exception{

     // validacao das regras de negocio
     if ( (( isEmpty(estacionamento.getNome())) ||( isEmpty(estacionamento.getEndereco())) || ( isEmpty(estacionamento.getNome_Do_Responsavel())) 
             || ( isEmpty(estacionamento.getDocumento_Do_Convenio())) || ( isEmpty(estacionamento.getHorario_De_Funcionamento())) 
             || ( isEmpty(estacionamento. getTelefone())) || estacionamento.getTipo()!=false)){
       return false;
     }

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
  
public boolean atualizarCadastro(int id, String Estado) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    EstacionamentoData edata = new EstacionamentoData();
	     edata.atualizarCadastro(id, Estado, tr);
	   tr.commit(); 
	   return true;
	 } catch (Exception e) { 
	   tr.rollback();
	   System.out.println("erro ao atualizar situação do cadastro");
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
            EstacionamentoData edata = new EstacionamentoData();
            Vector v = edata.pesquisarCadastro(estado, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar cadastro");
            e.printStackTrace();
        }
        return null;
    } // pesquisarCadastro
  
  public boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}
