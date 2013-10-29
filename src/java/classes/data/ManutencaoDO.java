/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

/**
 *
 * @author hidden
 */
public class ManutencaoDO {
      private int _id;
  
  private String _data_da_Entrada_na_Manutencao;
  private int _veiculo_id;
  
  private int _funcionario_id;
  private String _estado;
  
   

 public int getId() {
     return _id;
  } // getId
  
   public String getDataDaEntradaNaManutencao() {
     return _data_da_Entrada_na_Manutencao;
  } // getDataDaEntradaNaManutencao
    public int getVeiculoID() {
     return _veiculo_id;
  } // getveiculoID
    
     public int getFuncionarioID() {
     return _funcionario_id;
  } // getFuncionarioId
    
       public String getEstado() {
     return _estado;
  } // getEstado
      
       
 public void setId(int id) {
     _id=id;
  } // setId
  
   public void setDataDaEntradaNaManutencao(String data) {
      _data_da_Entrada_na_Manutencao=data;
  } //setDataDaEntradaNaManutencao
    public void setVeiculoID(int vid) {
     _veiculo_id=vid;
  } // setVeiculoID
    
     public void setFuncionarioId(int fid) {
     _funcionario_id=fid;
  } // setFuncionarioId
    
       public void setEstado(String estado) {
      _estado=estado;
  } // setEstado
      
       
}

