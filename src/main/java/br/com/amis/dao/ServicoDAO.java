package br.com.amis.dao;

import br.com.amis.model.Servico;
import br.com.amis.servlet.config.ConnectionPoolConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServicoDAO {
    public List<Servico> consultar() {
        List<Servico> lista = new ArrayList<>();
        String SQL = "SELECT * FROM SERVICO ORDER BY ID_SERVICO";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                lista.add(new Servico(resultSet.getString("ID_SERVICO"), resultSet.getString("NOME"), resultSet.getString("TITULO"), resultSet.getString("TEXTO"), resultSet.getString("IMAGEM")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public void atualizar(Servico item) {
        String SQL = "UPDATE SERVICO SET NOME = ?, TITULO = ?, TEXTO = ?, IMAGEM = ? WHERE ID_SERVICO = ?";
        try (Connection connection = ConnectionPoolConfig.getConnection();
        PreparedStatement statement = connection.prepareStatement(SQL)) {
            statement.setString(1, item.getNome());
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
