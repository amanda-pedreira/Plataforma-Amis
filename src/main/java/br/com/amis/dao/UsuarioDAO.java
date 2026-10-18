
package br.com.amis.dao;

import br.com.amis.model.Usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UsuarioDAO {

    public boolean createUsuario(Usuario usuario) {

        String SQL = "INSERT INTO USUARIO " + "(TIPO, FOTO, USERNAME, NOME, EMAIL, SENHA) " + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
                Connection connection = DriverManager.getConnection(
                        "jdbc:h2:~/test", "sa", "sa"
                );

                PreparedStatement preparedStatement =
                        connection.prepareStatement(SQL)
        ) {

            System.out.println("Sucesso ao conectar no banco de dados!");

            preparedStatement.setString(1, usuario.getTipo());
            preparedStatement.setString(2, usuario.getFoto());
            preparedStatement.setString(3, usuario.getUsername());
            preparedStatement.setString(4, usuario.getNome());
            preparedStatement.setString(5, usuario.getEmail());
            preparedStatement.setString(6, usuario.getSenha());

            preparedStatement.executeUpdate();

            System.out.println("Sucesso ao cadastrar o usuário!");

            return true;

        } catch (Exception e) {

            System.out.println("Falha ao inserir o usuário no banco de dados!");
            e.printStackTrace();

            return false;
        }
    }

    public List<Usuario> findAllUsuarios() {

        String SQL = "SELECT * FROM USUARIO";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            System.out.println("success in database connection");

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Usuario> usuarios = new ArrayList<>();

            int quantidade = 0;
            while (resultSet.next()) {

                quantidade++;

                Usuario usuario = new Usuario(
                        resultSet.getString("TIPO"),
                        resultSet.getString("FOTO"),
                        resultSet.getString("USERNAME"),
                        resultSet.getString("NOME"),
                        resultSet.getString("EMAIL"),
                        null
                );

                usuario.setBio(resultSet.getString("BIO"));
                usuario.setDataCriacao(
                        resultSet.getDate("DATA_CRIACAO")
                );

                usuarios.add(usuario);
            }

            System.out.println("Quantidade de usuários encontrados: " + quantidade);
            System.out.println("success in select * usuario");

            connection.close();

            return usuarios;

        } catch (Exception e) {

            System.out.println("fail in database connection");
            e.printStackTrace();

            return Collections.emptyList();
        }
    }
}
