/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

/**
 *
 * @author Ligia
 */
public class AssistenciaTecnicaDO {
    private int _id;
  private String _cliente;
  private String _opmanut;
  private String _queixa;
  private String _end;
  private String _data;
  private String _estadofinal;

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId

  public String getCliente() {
    return _cliente;
  } // obterCliente

  public void setCliente(String cliente) {
    _cliente = cliente;
  } // setCliente
  
  public String getOpManut() {
      return _opmanut;
  } //  obterOperador de Manutenção
  
  public void setOpManut(String opmanut) {
      _opmanut = opmanut;
  } // setOperador de Manutenção

  public String getQueixa() {
      return _queixa;
  } // obterQueixa
  
  public void setQueixa(String queixa) {
      _queixa = queixa;
  } // setQueixa

  public String getEndereco() {
    return _end;
  } // getEndereço

  public void setEndereco(String end) {
    _end = end;
  } // setEndereço
  
  public String getData(){
      return _data;
  } // obterData
  
  public void setData(String data){
      _data = data;
  } // setData
  
  public String getEstadoFinal(){
      return _estadofinal;
  } // obterEstadoFinal
  
  public void setEstadoFinal(String estadofinal) {
      _estadofinal = estadofinal;
  } // setEstadoFinal

} // AssistenciaTecnicaDO
  