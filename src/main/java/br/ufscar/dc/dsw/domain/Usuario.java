package br.ufscar.dc.dsw.domain;

public class Usuario {
    private Long id;
    private String email;
    private String senha;
    private String nome;
    private boolean administrador;
    private String tipoUsuario;

    public Usuario(Long id, String email, String senha, String nome, boolean administrador, String tipoUsuario) {
        this.setId(id);
        this.setEmail(email);
        this.setSenha(senha);
        this.setNome(nome);
        this.setAdministrador(administrador);
        this.setTipoUsuario(tipoUsuario);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public boolean isAdministrador() {
        return administrador;
    }

    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
}
