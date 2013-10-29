/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

/**
 *
 * @author hidden
 */
public class Consumo_de_CombustivelDO {
    
     private int _id;
  private float _precoTotal;
  private String _horario;
  private int _operacoesDeCaixa_id;
  private int _cliente_id;
  private int _posto_id;
  private String _tipo;
  private float _quantidade;
  
    

 public int getId() {
     return _id;
  } // getId
  public float getPrecoTotal() {
     return _precoTotal;
  } // getprecototal
  
   public String getHorario() {
     return _horario;
  } // getHorario
    public int getOperacoesDeCaixaID() {
     return _operacoesDeCaixa_id;
  } // getOperacoesDeCaixaID
    
     public int getClienteId() {
     return _cliente_id;
  } // getClienteId
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
     _id=id;
  } // setId
  public void setPrecoTotal(float preco) {
     _precoTotal=preco;
  } // setprecototal
  
   public void setHorario(String horas) {
     _horario=horas;
  } // setHorario
    public void setOperacoesDeCaixaID(int op) {
     _operacoesDeCaixa_id=op;
  } // setOperacoesDeCaixaID
    
     public void setClienteId(int clienteid) {
     _cliente_id=clienteid;
  } // setClienteId
      public void setPostoId(int postoid) {
     _posto_id=postoid;
  } // setpostoId
       public void setTipo(String tipo) {
 _tipo=tipo;
  } // settipo 
       public void setQuantidade(float qtd) {
  _quantidade=qtd;
  } // setQuantidade
}
