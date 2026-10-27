package br.com.amis.model;

public class Categoria {

    private String id;
    private String nome;

    public Categoria(String nome) {
        this.nome = nome;
    }

    public Categoria(String id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public String getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }
}