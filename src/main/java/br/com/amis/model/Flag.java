package br.com.amis.model;

public class Flag {

    private String id;
    private String nome;

    public Flag(String nome) {
        this.nome = nome;
    }

    public Flag(String id, String nome) {
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