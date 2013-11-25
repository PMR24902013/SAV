/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.util.*;
import java.text.*;
import java.sql.*;

/**
 *
 * @author User
 */
public class Operacoes_de_CaixaDO {

    private int _id;
    private float _valorDoPagamento;
    private java.sql.Date _dataDoPagamento;
    private int _usuario_id;
    private String _estado;

    public int getID() {
        return _id;
    }

    public float getValorDoPagamento() {
        return _valorDoPagamento;
    }

    public java.sql.Date getDataDoPagamento() {
        return _dataDoPagamento;
    }

    public int getUsuarioID() {
        return _usuario_id;
    }

    public void setID(int id) {
        _id = id;
    }

    public void setValorDoPagamento(float valorDoPagamento) {
        _valorDoPagamento = valorDoPagamento;
    }

    public void setDataDoPagamento(java.sql.Date dataDoPagamento) {
        _dataDoPagamento = dataDoPagamento;
    }

    public void setUsuarioID(int UsuarioID) {
        _usuario_id = UsuarioID;
    }

    public String getEstado() {
        return _estado;
    }

    public void setEstado(String estado) {
        _estado = estado;
    }
}
