package br.com.amis.dao;

import br.com.amis.model.Comentario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ComentarioDAO {
    public void createComentario(Comentario comentario) {
        String SQL = "INSERT INTO COMENTARIO (ID_POSTAGEM, ID_USUARIO, TEXTO) VALUES (?, ?, ?)";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, comentario.getIdPostagem());
            preparedStatement.setInt(2, comentario.getIdUsuario());
            preparedStatement.setString(3, comentario.getTexto());
            preparedStatement.execute();
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar comentario: " + e.getMessage());
        }
    }

    public List<Comentario> findAllComentarios() {
        List<Comentario> comentarios = new ArrayList<>();
        String SQL = "SELECT * FROM COMENTARIO ORDER BY ID_COMENTARIO DESC";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                comentarios.add(new Comentario(resultSet.getInt("ID_COMENTARIO"),
                        resultSet.getInt("ID_POSTAGEM"), resultSet.getInt("ID_USUARIO"),
                        resultSet.getString("TEXTO")));
            }
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao listar comentarios: " + e.getMessage());
        }
        return comentarios;
    }

    public void deleteComentarioById(int id) {
        String SQL = "DELETE FROM COMENTARIO WHERE ID_COMENTARIO = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao excluir comentario: " + e.getMessage());
        }
    }
}
