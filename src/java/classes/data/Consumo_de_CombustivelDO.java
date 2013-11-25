/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.sql.*;

/**
 *
 * @author hidden
 */
public class Consumo_de_CombustivelDO {

    private int _id;
    private int _operacoesDeCaixa_id;
    private int _posto_id;
    private String _tipo;
    private float _quantidade;
    private float _precoTotal;
    private Time _horario;

    public int getId() {
        return _id;
    } // getId

    public float getPrecoTotal() {
        return _precoTotal;
    } // getprecototal

    public Time getHorario() {
        return _horario;
    } // getHorario

    public int getOperacoesDeCaixaID() {
        return _operacoesDeCaixa_id;
    } // getOperacoesDeCaixaID

    public int getPostoId() {
        return _posto_id;
    } // getpostoId

    public String getTipo() {
        return _tipo;
    } // getTipo

    public float getQuantidade() {
        return _quantidade;
    } // getQuantidade

    public void setId(int id) {
        _id = id;
    } // setId

    public void setPrecoTotal(float preco) {
        _precoTotal = preco;
    } // setprecototal

    public void setHorario(Time horario) {
        _horario = horario;
    } // setHorario

    public void setOperacoesDeCaixaID(int op) {
        _operacoesDeCaixa_id = op;
    } // setOperacoesDeCaixaID

    public void setPostoId(int postoid) {
        _posto_id = postoid;
    } // setpostoId

    public void setTipo(String tipo) {
        _tipo = tipo;
    } // settipo 

    public void setQuantidade(float qtd) {
        _quantidade = qtd;
    } // setQuantidade
}