/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.FuncionarioDO;
import classes.data.FuncionarioData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Funcionario {
     public boolean incluir (FuncionarioDO funcionario) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(funcionario.getEmail())) || ( isEmpty(funcionario.getEndereco())) ||( isEmpty(funcionario.getTelefone()))||( isEmpty(funcionario.getEstado()))) {
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
         tr.rollback();
         System.out.println("erro ao incluir " + funcionario.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(FuncionarioDO funcionario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    FuncionarioData cdata = new FuncionarioData();
	     cdata.atualizar(funcionario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + funcionario.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(FuncionarioDO funcionario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     FuncionarioData cdata = new FuncionarioData();
	     cdata.excluir(funcionario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + funcionario.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public FuncionarioDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     FuncionarioData cdata = new FuncionarioData();
	     FuncionarioDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
   public FuncionarioDO buscarPorUsuarioID(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     FuncionarioData cdata = new FuncionarioData();
	     FuncionarioDO c = cdata.buscarPorUsuarioID(idobj, tr);
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
          FuncionarioData cdata = new FuncionarioData();
           Vector v = cdata.pesquisarPorLogin(nome, tr);
           
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Funcionario c = new Funcionario();
      FuncionarioDO contato = new FuncionarioDO();
      try {
	    contato = c.buscar(6);
		System.out.println(contato.getNome());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
 
    
}