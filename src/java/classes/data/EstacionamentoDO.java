package classes.data;

public class EstacionamentoDO {

    private int _id;
    private int _usuario_id;
    private String _nome;
    private String _endereco;
    private int _vagas;
    private boolean _tipo;
    private String _nome_do_responsavel;
    private String _documento_do_convenio;
    private String _horario_de_funcionamento;
    private String _telefone;
    private String _estado;

    public int getId() {
        return _id;
    } // getId

    public void setId(int id) {
        _id = id;
    } // setId

    public int getUsuario_Id() {
        return _usuario_id;
    } // getUsuario_Id

    public void setUsuario_Id(int usuario_id) {
        _usuario_id = usuario_id;
    } // setUsuario_Id

    public String getNome() {
        return _nome;
    } // obterNome

    public void setNome(String nome) {
        _nome = nome;
    } // setNome

    public String getEndereco() {
        return _endereco;
    } // getEndereco

    public void setEndereco(String endereco) {
        _endereco = endereco;
    } // setEndereco

    public int getVagas() {
        return _vagas;
    } // getVagas

    public void setVagas(int vagas) {
        _vagas = vagas;
    } // setVagas

    public boolean getTipo() {
        return _tipo;
    } // getUsuario_Id

    public void setTipo(boolean tipo) {
        _tipo = tipo;
    } // setTipo

    public String getNome_Do_Responsavel() {
        return _nome_do_responsavel;
    } // getNome_Do_Responsavel

    public void setNome_Do_Responsavel(String nome_do_responsavel) {
        _nome_do_responsavel = nome_do_responsavel;
    } // setNome_Do_Responsavel

    public String getDocumento_Do_Convenio() {
        return _documento_do_convenio;
    } // getDocumento_Do_Convenio

    public void setDocumento_Do_Convenio(String documento_do_convenio) {
        _documento_do_convenio = documento_do_convenio;
    } // setDocumento_Do_Convenio

    public String getHorario_De_Funcionamento() {
        return _horario_de_funcionamento;
    } // getHorario_De_Funcionamento

    public void setHorario_De_Funcionamento(String horario_de_funcionamento) {
        _horario_de_funcionamento = horario_de_funcionamento;
    } // setHorario_De_Funcionamento

    public String getTelefone() {
        return _telefone;
    } // getTelefone

    public void setTelefone(String telefone) {
        _telefone = telefone;
    } // setTelefone

    public String getEstado() {
        return _estado;
    }

    public void setEstado(String estado) {
        _estado = estado;
    }

} // EstacionamentoDO
