package br.com.amis.dao;

import br.com.amis.model.Configuracao;
import br.com.amis.servlet.config.ConnectionPoolConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConfiguracaoDAO {
    public Configuracao consultar() {
        String SQL = "SELECT * FROM CONFIGURACAO WHERE ID_CONFIGURACAO = 1";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) return new Configuracao(resultSet.getString("ID_CONFIGURACAO"), resultSet.getString("LOGO"), resultSet.getString("EMAIL"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void atualizar(Configuracao item) {
        String SQL = "UPDATE CONFIGURACAO SET LOGO = ?, EMAIL = ? WHERE ID_CONFIGURACAO = ?";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            statement.setString(1, item.getLogo());
            statement.setString(2, item.getEmail());
            statement.setString(3, item.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
