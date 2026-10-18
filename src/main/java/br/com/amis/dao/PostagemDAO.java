
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

    public List<Postagem> findAllPostagens() {

        String SQL = "SELECT P.ID_POSTAGEM, P.TITULO, P.TEXTO, " +
                "C.NOME AS CATEGORIA, F.NOME AS FLAG " +
                "FROM POSTAGEM P " +
                "INNER JOIN CATEGORIA C ON P.ID_CATEGORIA = C.ID_CATEGORIA " +
                "INNER JOIN FLAG F ON P.ID_FLAG = F.ID_FLAG " +
                "ORDER BY P.ID_POSTAGEM DESC";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

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

                postagens.add(postagem);
            }

            System.out.println("success in select * postagem");

            connection.close();

            return postagens;

        } catch (Exception e) {

            System.out.println("fail in database connection");
            e.printStackTrace();

            return Collections.emptyList();
        }
    }
}
