package br.com.amis.dao;

import br.com.amis.model.Banner;
import br.com.amis.servlet.config.ConnectionPoolConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BannerDAO {
    public Banner consultar() {
        String SQL = "SELECT * FROM BANNER WHERE ID_BANNER = 1";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) return new Banner(resultSet.getString("ID_BANNER"), resultSet.getString("SUBTITULO"), resultSet.getString("TITULO"), resultSet.getString("TEXTO"), resultSet.getString("IMAGEM"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void atualizar(Banner item) {
        String SQL = "UPDATE BANNER SET SUBTITULO = ?, TITULO = ?, TEXTO = ?, IMAGEM = ? WHERE ID_BANNER = ?";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            statement.setString(1, item.getSubtitulo());
            statement.setString(2, item.getTitulo());
            statement.setString(3, item.getTexto());
            statement.setString(4, item.getImagem());
            statement.setString(5, item.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
