package classes.data;

public class FuncionarioDO {
    
    private int _id;
    private int _usuarioID;
    private String _nome;
    private String _CPF;
    private String _email;
    private String _endereco;
    private String _telefone;
    private String _estado;
    private String _categoria;
   
    public int getId() {
        return _id;
    } // getId
    
    public void setId(int id) {
        _id = id;
    } // setId
    
    public int getUsuarioId() {
        return _usuarioID;
    } 
    
    public void setUsuarioId(int usuarioID) {
        _usuarioID = usuarioID;
    }
 
    public String getNome() {
        return _nome;
    } 
    
    public void setNome(String nome) {
        _nome = nome;
    }
    
    public String getCPF() {
        return _CPF;
    } 
    
    public void setCPF(String CPF) {
        _CPF = CPF;
    }  
    
    public String getEmail() {
        return _email;
    } 
    
    public void setEmail(String email) {
        _email = email;
    }
    
    public String getEndereco() {
        return _endereco;
    } 
    
    public void setEndereco(String endereco) {
        _endereco = endereco;
    }   
    
    public String getTelefone() {
        return _telefone;
    } 
    
    public void setTelefone(String telefone) {
        _telefone = telefone;
    }    
    
    
    public String getEstado() {
        return _estado;
    } 
    
    public void setEstado(String estado) {
        _estado= estado;
    }
    
    public String getCategoria() {
        return _categoria;
    } 
    
    public void setCategoria(String categoria) {
        _categoria= categoria;
    }
}
