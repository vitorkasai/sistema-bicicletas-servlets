package br.ufscar.dc.dsw.domain;

public class Locadora extends Usuario {

    private String CNPJ;
    private String cidade;

    public Locadora(Long id, String email, String senha, String nome, boolean administrador, String tipoUsuario, String CNPJ, String cidade) {
        super(id, email, senha, nome, administrador, tipoUsuario);
        this.setCNPJ(CNPJ);
        this.setCidade(cidade);
    }

    public String getCNPJ() {
        return this.CNPJ;
    }

    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }

    public String getCidade() {
        return this.cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
}
