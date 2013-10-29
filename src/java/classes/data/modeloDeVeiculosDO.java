/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sav;

/**
 *
 * @author Rodrigo
 */
public class modeloDeVeiculosDO {
  private int _id;
  private String _modelo;
  private String _marca;
  private int _ano;

  

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId
  
    public String getModelo() {
     return _modelo;
  } // getModelo

  public void setModelo(String modelo) {
    _modelo = modelo;
  } // setModelo

  public String getMarca() {
    return _marca;
  } // getMarca

  public void setMarca(String marca) {
    _marca = marca;
  } // setMarca

    public int getAno() {
     return _ano;
  } // getAno

  public void setAno (int ano) {
    _ano = ano;
  } // setAno

} // marcaDeVeiculosDO

