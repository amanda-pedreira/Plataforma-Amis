
package br.com.amis.model;

import java.sql.Date;

public class Usuario {

    private String tipo;
    private String foto;
    private String bio;
    private Date dataCriacao;
    private String username;
    private String nome;
    private String email;
    private String senha;

    public Usuario(String tipo, String foto, String username, String nome, String email, String senha) {
        this.tipo = tipo;
        this.foto = foto;
        this.username = username;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }

    public String getTipo() {
        return tipo;
    }

    public String getFoto() {
        return foto;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public String getUsername() {
        return username;
    }

    public String getNome() {
        return nome;
    }

    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }
}
