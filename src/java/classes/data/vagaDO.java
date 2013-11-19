/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

/**
 *
 * @author Rodrigo
 */
public class vagaDO {
  private int _id;
  private int _estacionamento_id;
  private boolean _estado;
  private int _numero;

  

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId
  
    public int getEstacionamento_id() {
     return _estacionamento_id;
  } // getEstacionamento_id

  public void setEstacionamento_id(int estacionamento_id) {
    _estacionamento_id = estacionamento_id;
  } // setEstacionamento_id

  public boolean getEstado() {
    return _estado;
  } // getEstado

  public void setEstado(boolean estado) {
    _estado = estado;
  } // setEstado

    public int getNumero() {
     return _numero;
  } // getEndereco

  public void setNumero (int numero) {
    _numero = numero;
  } // setNumero

} // vagaDO
