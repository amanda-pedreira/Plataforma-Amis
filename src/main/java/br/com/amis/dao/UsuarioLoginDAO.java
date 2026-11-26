package br.com.amis.dao;

import br.com.amis.model.User;
import br.com.amis.servlet.config.ConnectionPoolConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioLoginDAO {

    public int verifyCredentials(User user) {

        String SQL = "SELECT * FROM USUARIO WHERE USERNAME = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUsername());

            ResultSet resultSet = preparedStatement.executeQuery();

            int idUsuario = 0;

            while (resultSet.next()) {

                String senha = resultSet.getString("SENHA");

                if (senha.equals(user.getPassword())) {

                    if ("INATIVO".equals(resultSet.getString("STATUS"))) {
                        idUsuario = -1;
                    } else {
                        idUsuario = resultSet.getInt("ID_USUARIO");
                    }

                }

            }

            connection.close();

            return idUsuario;

        } catch (Exception e) {

            System.out.println("Erro ao verificar login: " + e.getMessage());

            return 0;

        }

    }

}
