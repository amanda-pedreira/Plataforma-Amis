
package br.com.amis.model;

public class Postagem {

    private int idPostagem;
    private String titulo;
    private String texto;
    private String categoria;
    private String flag;

    public Postagem(int idPostagem, String titulo, String texto, String categoria, String flag) {
        this.idPostagem = idPostagem;
        this.titulo = titulo;
        this.texto = texto;
        this.categoria = categoria;
        this.flag = flag;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getTexto() {
        return texto;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getFlag() {
        return flag;
    }
}
