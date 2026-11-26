package br.com.amis.dao;

import br.com.amis.servlet.config.ConnectionPoolConfig;

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

            Connection connection = ConnectionPoolConfig.getConnection();

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
        return listarPostagens(null, null, null, false);
    }

    public List<Postagem> pesquisarAdmin(String pesquisa) {
        return listarPostagens(null, null, pesquisa, false);
    }

    public List<Postagem> findFeed(String categoria, String flag, String pesquisa) {
        return listarPostagens(categoria, flag, pesquisa, true);
    }

    private List<Postagem> listarPostagens(String categoriaFiltro, String flagFiltro, String pesquisa, boolean feed) {
        boolean filtrarCategoria = categoriaFiltro != null && !categoriaFiltro.isEmpty();
        boolean filtrarFlag = flagFiltro != null && !flagFiltro.isEmpty();

        boolean pesquisar = pesquisa != null && !pesquisa.trim().isEmpty();

        String SQL = "SELECT P.ID_POSTAGEM, P.ID_USUARIO, " +
        "P.ID_CATEGORIA, P.ID_FLAG, P.TITULO, P.TEXTO, P.DATA_POSTAGEM, " +
        "C.NOME AS CATEGORIA, F.NOME AS FLAG " +
        "FROM POSTAGEM P " +
        "INNER JOIN CATEGORIA C ON P.ID_CATEGORIA = C.ID_CATEGORIA " +
        "INNER JOIN FLAG F ON P.ID_FLAG = F.ID_FLAG " +
        "WHERE 1 = 1 ";

        if (filtrarCategoria) SQL += "AND P.ID_CATEGORIA = ? ";
        if (filtrarFlag) SQL += "AND P.ID_FLAG = ? ";
        if (pesquisar) SQL += "AND (LOWER(P.TITULO) LIKE ? OR LOWER(P.TEXTO) LIKE ?) ";
        if (feed && !pesquisar) SQL += "ORDER BY RAND() LIMIT 35";
        else if (feed) SQL += "ORDER BY P.DATA_POSTAGEM DESC, P.ID_POSTAGEM DESC LIMIT 35";
        else SQL += "ORDER BY P.DATA_POSTAGEM DESC, P.ID_POSTAGEM DESC";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement =
            connection.prepareStatement(SQL);

            int parametro = 1;
            if (filtrarCategoria) preparedStatement.setInt(parametro++, Integer.parseInt(categoriaFiltro));
            if (filtrarFlag) preparedStatement.setInt(parametro++, Integer.parseInt(flagFiltro));
            if (pesquisar) {
                String termo = "%" + pesquisa.trim().toLowerCase() + "%";
                preparedStatement.setString(parametro++, termo);
                preparedStatement.setString(parametro, termo);
            }

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

                postagem.setDataPostagem(resultSet.getDate("DATA_POSTAGEM").toString());
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

    public List<Postagem> findPostagensByUsuario(int idUsuario) {
        List<Postagem> minhasPostagens = new ArrayList<>();

        for (Postagem postagem : findAllPostagens()) {
            if (postagem.getIdUsuario() == idUsuario) {
                minhasPostagens.add(postagem);
            }
        }

        return minhasPostagens;
    }

    public void deletePostagemById(int id) {

        String SQL = "DELETE FROM POSTAGEM WHERE ID_POSTAGEM = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

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
