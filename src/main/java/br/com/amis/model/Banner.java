package br.com.amis.model;

public class Banner {
    private String id;
    private String subtitulo;
    private String titulo;
    private String texto;
    private String imagem;

    public Banner(String id, String subtitulo, String titulo, String texto, String imagem) {
        this.id = id;
        this.subtitulo = subtitulo;
        this.titulo = titulo;
        this.texto = texto;
        this.imagem = imagem;
    }

    public String getId() {
        return id;
    }

    public String getSubtitulo() {
        return subtitulo;
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
