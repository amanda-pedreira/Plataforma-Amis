package br.com.amis.model;

public class Journal {
    private int idRegistro;
    private int idUsuario;
    private String data;
    private String humor;
    private String descricao;
    private String titulo;

    public Journal(int idRegistro, int idUsuario, String data, String humor, String descricao, String titulo) {
        this.idRegistro = idRegistro;
        this.idUsuario = idUsuario;
        this.data = data;
        this.humor = humor;
        this.descricao = descricao;
        this.titulo = titulo;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getData() {
        return data;
    }

    public String getHumor() {
        return humor;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getDia() {
        return data.substring(8, 10);
    }

    public String getDescricao() {
        return descricao;
    }
}
