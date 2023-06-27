package br.ufscar.dc.dsw.domain;

import java.sql.Date;

public class Cliente extends Usuario {

    private String CPF;
    private String telefone;
    private String sexo;
    private Date dataNascimento;

    public Cliente(Long id, String email, String senha, String nome, boolean administrador, String tipoUsuario, String CPF, String telefone, String sexo, Date dataNascimento) {
        super(id, email, senha, nome, administrador, tipoUsuario);
        this.setCPF(CPF);
        this.setTelefone(telefone);
        this.setSexo(sexo);
        this.setDataNascimento(dataNascimento);
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
}
