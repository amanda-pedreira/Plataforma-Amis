package br.com.amis.model;

public class Sobre {
    private String id;
    private String titulo;
    private String texto;

    public Sobre(String id, String titulo, String texto) {
        this.id = id;
        this.titulo = titulo;
        this.texto = texto;
    }

    public String getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getTexto() {
        return texto;
    }
}
