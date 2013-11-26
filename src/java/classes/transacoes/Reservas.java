/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.transacoes;

import classes.data.ReservasDO;
import classes.data.ReservasData;
import classes.utils.Transacao;
import java.util.Vector;

public class Reservas {

    public boolean incluir(ReservasDO Reserva) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            ReservasData rdata = new ReservasData();
            rdata.incluir(Reserva, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir");
            e.printStackTrace();
        }
        return false;
    } // incluir

    public boolean atualizar(ReservasDO Reserva) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            ReservasData rdata = new ReservasData();
            rdata.atualizar(Reserva, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar reserva");
            e.printStackTrace();
        }
        return false;
    } // atualizar

    public boolean atualizarEstado(ReservasDO Reserva) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            ReservasData rdata = new ReservasData();
            rdata.atualizarEstado(Reserva, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar reserva");
            e.printStackTrace();
        }
        return false;
    } // atualizar

    public boolean excluir(ReservasDO Reserva) throws Exception {
        Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ReservasData cdata = new ReservasData();
	     cdata.excluir(Reserva, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir");
	   e.printStackTrace();
	 }
	 return false;
    } // excluir

    public Vector pesquisar(int idobj, String estado) throws Exception {
        if (idobj == -1) {
            return null;
        }
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ReservasData rdata = new ReservasData();
            Vector r = rdata.pesquisar(idobj, estado, tr);
            tr.commit();
            return r;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar");
            e.printStackTrace();
        }
        return null;
    } // buscar

    public Vector pesquisarPorCliente(int idobj) throws Exception {
        if (idobj == -1) {
            return null;
        }
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ReservasData rdata = new ReservasData();
            Vector r = rdata.pesquisarPorCliente(idobj, tr);
            tr.commit();
            return r;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar");
            e.printStackTrace();
        }
        return null;
    } // buscar

    public ReservasDO buscar(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ReservasData rdata = new ReservasData();
            ReservasDO r = rdata.buscar(idobj, tr);
            tr.commit();
            return r;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar" + idobj);
            e.printStackTrace();
        }
        return null;
    } // buscar

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
        Reservas r = new Reservas();
        ReservasDO reserva = new ReservasDO();
        try {
            //reserva = r.buscar(6);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } // main
}
