package br.com.amis.dao;

import br.com.amis.model.Sobre;
import br.com.amis.servlet.config.ConnectionPoolConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SobreDAO {
    public Sobre consultar() {
        String SQL = "SELECT * FROM SOBRE WHERE ID_SOBRE = 1";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) return new Sobre(resultSet.getString("ID_SOBRE"), resultSet.getString("TITULO"), resultSet.getString("TEXTO"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void atualizar(Sobre item) {
        String SQL = "UPDATE SOBRE SET TITULO = ?, TEXTO = ? WHERE ID_SOBRE = ?";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            statement.setString(1, item.getTitulo());
            statement.setString(2, item.getTexto());
            statement.setString(3, item.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
