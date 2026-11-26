package br.com.amis.model;

public class Servico {
    private String id;
    private String nome;
    private String titulo;
    private String texto;
    private String imagem;

    public Servico(String id, String nome, String titulo, String texto, String imagem) {
        this.id = id;
        this.nome = nome;
        this.titulo = titulo;
        this.texto = texto;
        this.imagem = imagem;
    }

    public String getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getTexto() {
        return texto;
    }

    public String getImagem() {
        return imagem;
    }
}
