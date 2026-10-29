
package br.com.amis.dao;

import br.com.amis.model.Postagem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PostagemDAO {

    public void createPostagem(Postagem postagem) {

        String SQL = "INSERT INTO POSTAGEM " +
                "(ID_USUARIO, ID_CATEGORIA, ID_FLAG, TITULO, TEXTO) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setInt(1, postagem.getIdUsuario());
            preparedStatement.setInt(2, postagem.getIdCategoria());
            preparedStatement.setInt(3, postagem.getIdFlag());
            preparedStatement.setString(4, postagem.getTitulo());
            preparedStatement.setString(5, postagem.getTexto());

            preparedStatement.execute();

            System.out.println("Postagem cadastrada com sucesso");

            connection.close();

        } catch (Exception e) {

            System.out.println("Erro ao cadastrar postagem: " + e.getMessage());

        }
    }

    public List<Postagem> findAllPostagens() {

        String SQL = "SELECT P.ID_POSTAGEM, P.ID_USUARIO, " +
                "P.ID_CATEGORIA, P.ID_FLAG, P.TITULO, P.TEXTO, " +
                "C.NOME AS CATEGORIA, F.NOME AS FLAG " +
                "FROM POSTAGEM P " +
                "INNER JOIN CATEGORIA C ON P.ID_CATEGORIA = C.ID_CATEGORIA " +
                "INNER JOIN FLAG F ON P.ID_FLAG = F.ID_FLAG " +
                "ORDER BY P.ID_POSTAGEM DESC";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Postagem> postagens = new ArrayList<>();

            while (resultSet.next()) {

                int idPostagem = resultSet.getInt("ID_POSTAGEM");
                String titulo = resultSet.getString("TITULO");
                String texto = resultSet.getString("TEXTO");
                String categoria = resultSet.getString("CATEGORIA");
                String flag = resultSet.getString("FLAG");

                Postagem postagem = new Postagem(
                        idPostagem, titulo, texto, categoria, flag);

                postagem.setIdUsuario(resultSet.getInt("ID_USUARIO"));
                postagem.setIdCategoria(resultSet.getInt("ID_CATEGORIA"));
                postagem.setIdFlag(resultSet.getInt("ID_FLAG"));

                postagens.add(postagem);
            }

            connection.close();

            return postagens;

        } catch (Exception e) {

            System.out.println("Erro ao listar postagens: " + e.getMessage());

        }

        return Collections.emptyList();
    }

    public void updatePostagem(Postagem postagem) {

        String SQL = "UPDATE POSTAGEM SET ID_USUARIO = ?, " +
                "ID_CATEGORIA = ?, ID_FLAG = ?, TITULO = ?, " +
                "TEXTO = ? WHERE ID_POSTAGEM = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setInt(1, postagem.getIdUsuario());
            preparedStatement.setInt(2, postagem.getIdCategoria());
            preparedStatement.setInt(3, postagem.getIdFlag());
            preparedStatement.setString(4, postagem.getTitulo());
            preparedStatement.setString(5, postagem.getTexto());
            preparedStatement.setInt(6, postagem.getIdPostagem());

            preparedStatement.execute();

            System.out.println("Postagem atualizada com sucesso");

            connection.close();

        } catch (Exception e) {

            System.out.println("Erro ao atualizar postagem: " + e.getMessage());

        }
    }

    public void deletePostagemById(int id) {

        String SQL = "DELETE FROM POSTAGEM WHERE ID_POSTAGEM = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement =
                    connection.prepareStatement(SQL);

            preparedStatement.setInt(1, id);

            preparedStatement.execute();

            System.out.println("Postagem excluida com sucesso");

            connection.close();

        } catch (Exception e) {

            System.out.println("Erro ao excluir postagem: " + e.getMessage());

        }
    }
}
