
package br.com.amis.model;

public class Postagem {

    private int idPostagem;
    private int idUsuario;
    private int idCategoria;
    private int idFlag;
    private String titulo;
    private String texto;
    private String categoria;
    private String flag;

    public Postagem(int idPostagem, String titulo, String texto,
                    String categoria, String flag) {
        this.idPostagem = idPostagem;
        this.titulo = titulo;
        this.texto = texto;
        this.categoria = categoria;
        this.flag = flag;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(int idPostagem) {
        this.idPostagem = idPostagem;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdFlag() {
        return idFlag;
    }

    public void setIdFlag(int idFlag) {
        this.idFlag = idFlag;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getFlag() {
        return flag;
    }
}
