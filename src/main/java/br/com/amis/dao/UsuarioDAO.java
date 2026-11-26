package br.com.amis.dao;

import br.com.amis.servlet.config.ConnectionPoolConfig;

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
        "(TIPO, FOTO, USERNAME, NOME, EMAIL, SENHA, ADMIN) " +
        "VALUES (?, ?, ?, ?, ?, ?, 0)";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

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

        return pesquisarUsuarios("");
    }

    public List<Usuario> pesquisarUsuarios(String pesquisa) {
        List<Usuario> usuarios = new ArrayList<>();
        String SQL = "SELECT * FROM USUARIO WHERE ADMIN = 0 AND (LOWER(NOME) LIKE ? OR LOWER(USERNAME) LIKE ?) ORDER BY ID_USUARIO";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement =
            connection.prepareStatement(SQL);

            preparedStatement.setString(1, "%" + pesquisa.toLowerCase() + "%");
            preparedStatement.setString(2, "%" + pesquisa.toLowerCase() + "%");

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

        String SQL = "SELECT * FROM USUARIO WHERE ID_USUARIO = ? AND ADMIN = 0";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

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
            Connection connection = ConnectionPoolConfig.getConnection();

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
            Connection connection = ConnectionPoolConfig.getConnection();

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

    public boolean isAdmin(int id) {
        String SQL = "SELECT * FROM USUARIO WHERE ID_USUARIO = ? AND ADMIN = 1 AND STATUS = 'ATIVO'";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = connection.prepareStatement(SQL)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            return false;
        }
    }

    public void alterarStatus(int id, String status) {
        String SQL = "UPDATE USUARIO SET STATUS = ? WHERE ID_USUARIO = ? AND ADMIN = 0";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = connection.prepareStatement(SQL)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean alterarSenha(int id, String atual, String nova) {
        String SQL = "UPDATE USUARIO SET SENHA = ? WHERE ID_USUARIO = ? AND SENHA = ?";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = connection.prepareStatement(SQL)) {
            ps.setString(1, nova);
            ps.setInt(2, id);
            ps.setString(3, atual);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            return false;
        }
    }
}
