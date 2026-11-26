package br.com.amis.model;

public class Configuracao {
    private String id;
    private String logo;
    private String email;

    public Configuracao(String id, String logo, String email) {
        this.id = id;
        this.logo = logo;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public String getLogo() {
        return logo;
    }

    public String getEmail() {
        return email;
    }
}
