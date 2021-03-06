/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.VeiculosDO;
import classes.data.VeiculosData;
import classes.utils.Transacao;
import java.util.Vector;

/**
 *
 * @author hidden
 */
public class Veiculos {

    public boolean incluir(VeiculosDO veiculo) throws Exception {

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         VeiculosData cdata = new VeiculosData();
         cdata.incluir(veiculo, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + veiculo.getPlaca());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(VeiculosDO veiculo) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   tr.begin();
  	   VeiculosData cdata = new VeiculosData();
	   cdata.atualizar(veiculo, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + veiculo.getPlaca());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
    public boolean realocar(VeiculosDO funcionario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	    VeiculosData cdata = new VeiculosData();
	     cdata.realocar(funcionario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + funcionario.getPlaca());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public boolean excluir(VeiculosDO veiculo) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     VeiculosData cdata = new VeiculosData();
	     cdata.excluir(veiculo, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + veiculo.getPlaca());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  public VeiculosDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     VeiculosData cdata = new VeiculosData();
	     VeiculosDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  
  public VeiculosDO buscarPorPlaca(String placa) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           VeiculosData cdata = new VeiculosData();
           VeiculosDO v = cdata.buscarPorPlaca(placa, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
  public Vector buscarPorEstado(String estado) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           VeiculosData cdata = new VeiculosData();
           Vector v = cdata.buscarPorEstado(estado, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
    public Vector buscarPorVaga(int idobj) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           VeiculosData cdata = new VeiculosData();
           Vector v = cdata.buscarPorVaga(idobj, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
    
        public Vector buscarPorEstacionamento(int idobj) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           VeiculosData cdata = new VeiculosData();
           Vector v = cdata.buscarPorEstacionamento(idobj, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " );
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
  public boolean jaExiste(String placa) throws Exception{
      Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
            VeiculosData cdata = new VeiculosData();
            return cdata.jaExiste(placa, tr);
        }
        catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " );
            e.printStackTrace();
        }
        return false;
    } // incluir

    public boolean isEmpty(String s) {
        if (null == s) {
            return true;
        }
        if (s.length() == 0) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        Veiculos c = new Veiculos();
        VeiculosDO contato = new VeiculosDO();
        try {
            contato = c.buscar(6);
            System.out.println(contato.getPlaca());
        } catch (Exception e) {
            e.printStackTrace();
        }
    } // main

    public Vector pesquisarTodos() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            VeiculosData vdata = new VeiculosData();
            Vector v = vdata.pesquisarTodos(tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar modelos");
            e.printStackTrace();
        }
        return null;
    } // pesquisarTodos

    public VeiculosDO buscarPorVeiculoID(int idobj) throws Exception {

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            VeiculosData cdata = new VeiculosData();
            VeiculosDO v = cdata.buscarPorVeiculoID(idobj, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar " + idobj);
            e.printStackTrace();
        }
        return null;
    } // pesquisar
}
