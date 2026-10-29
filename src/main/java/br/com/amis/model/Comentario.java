package br.com.amis.model;

public class Comentario {
    private int idComentario;
    private int idPostagem;
    private int idUsuario;
    private String texto;

    public Comentario(int idComentario, int idPostagem, int idUsuario, String texto) {
        this.idComentario = idComentario;
        this.idPostagem = idPostagem;
        this.idUsuario = idUsuario;
        this.texto = texto;
    }

    public int getIdComentario() { return idComentario; }
    public int getIdPostagem() { return idPostagem; }
    public int getIdUsuario() { return idUsuario; }
    public String getTexto() { return texto; }
}
