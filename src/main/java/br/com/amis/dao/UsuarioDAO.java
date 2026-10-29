
package br.com.amis.dao;

import br.com.amis.model.Usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public boolean createUsuario(Usuario usuario) {

        String SQL = "INSERT INTO USUARIO " +
                "(TIPO, FOTO, USERNAME, NOME, EMAIL, SENHA) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getTipo());
            preparedStatement.setString(2, usuario.getFoto());
            preparedStatement.setString(3, usuario.getUsername());
            preparedStatement.setString(4, usuario.getNome());
            preparedStatement.setString(5, usuario.getEmail());
            preparedStatement.setString(6, usuario.getSenha());

            preparedStatement.executeUpdate();

            connection.close();
            return true;

        } catch (Exception e) {
            System.out.println("Erro ao cadastrar usuario: " + e.getMessage());
            return false;
        }
    }

    public List<Usuario> findAllUsuarios() {

        List<Usuario> usuarios = new ArrayList<>();

        String SQL = "SELECT * FROM USUARIO ORDER BY ID_USUARIO";

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Usuario usuario = new Usuario(
                        resultSet.getString("TIPO"),
                        resultSet.getString("FOTO"),
                        resultSet.getString("USERNAME"),
                        resultSet.getString("NOME"),
                        resultSet.getString("EMAIL"),
                        null
                );

                usuario.setIdUsuario(resultSet.getInt("ID_USUARIO"));
                usuario.setBio(resultSet.getString("BIO"));
                usuario.setStatus(resultSet.getString("STATUS"));
                usuario.setDataCriacao(
                        resultSet.getDate("DATA_CRIACAO")
                );

                usuarios.add(usuario);
            }

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao listar usuarios: " + e.getMessage());
        }

        return usuarios;
    }

    public Usuario findUsuarioById(int id) {

        String SQL = "SELECT * FROM USUARIO WHERE ID_USUARIO = ?";

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                Usuario usuario = new Usuario(
                        resultSet.getString("TIPO"),
                        resultSet.getString("FOTO"),
                        resultSet.getString("USERNAME"),
                        resultSet.getString("NOME"),
                        resultSet.getString("EMAIL"),
                        null
                );

                usuario.setIdUsuario(resultSet.getInt("ID_USUARIO"));
                usuario.setBio(resultSet.getString("BIO"));
                usuario.setStatus(resultSet.getString("STATUS"));
                usuario.setDataCriacao(
                        resultSet.getDate("DATA_CRIACAO")
                );

                connection.close();
                return usuario;
            }

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao buscar usuario: " + e.getMessage());
        }

        return null;
    }

    public boolean updateUsuario(Usuario usuario) {

        String SQL = "UPDATE USUARIO SET TIPO = ?, FOTO = ?, " +
                "USERNAME = ?, NOME = ?, EMAIL = ?, BIO = ?, " +
                "STATUS = ? WHERE ID_USUARIO = ?";

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getTipo());
            preparedStatement.setString(2, usuario.getFoto());
            preparedStatement.setString(3, usuario.getUsername());
            preparedStatement.setString(4, usuario.getNome());
            preparedStatement.setString(5, usuario.getEmail());
            preparedStatement.setString(6, usuario.getBio());
            preparedStatement.setString(7, usuario.getStatus());
            preparedStatement.setInt(8, usuario.getIdUsuario());

            int resultado = preparedStatement.executeUpdate();

            connection.close();
            return resultado > 0;

        } catch (Exception e) {
            System.out.println("Erro ao atualizar usuario: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteUsuario(int id) {

        String SQL = "DELETE FROM USUARIO WHERE ID_USUARIO = ?";

        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa"
            );

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setInt(1, id);

            int resultado = preparedStatement.executeUpdate();

            connection.close();
            return resultado > 0;

        } catch (Exception e) {
            System.out.println("Erro ao excluir usuario: " + e.getMessage());
            return false;
        }
    }
}
