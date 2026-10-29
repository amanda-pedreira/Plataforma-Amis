package br.com.amis.dao;

import br.com.amis.model.Flag;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FlagDAO {
    public void createFlag(Flag flag) {

        String SQL = "INSERT INTO FLAG (NOME) VALUES (?)";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            System.out.println("Sucesso ao conectar no banco de dados!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, flag.getNome());
            preparedStatement.execute();

            System.out.println("Sucesso ao cadastrar flag!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao cadastrar flag!");
            System.out.println(e.getMessage());
        }
    }
    public List<Flag> findAllFlags() {

        String SQL = "SELECT * FROM FLAG";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Flag> flags = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("ID_FLAG");
                String nome = resultSet.getString("NOME");

                Flag flag = new Flag(id, nome);

                flags.add(flag);
            }

            System.out.println("success in select * flag");

            connection.close();

            return flags;

        } catch (Exception e) {
            System.out.println("Erro ao consultar flags!");
            System.out.println(e.getMessage());

            return Collections.emptyList();
        }
    }
    public void deleteFlagById(String id) {

        String SQL = "DELETE FROM FLAG WHERE ID_FLAG = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, id);
            preparedStatement.execute();

            System.out.println("Sucesso ao excluir flag!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao excluir flag!");
            System.out.println(e.getMessage());
        }
    }
    public void updateFlag(Flag flag) {

        String SQL = "UPDATE FLAG SET NOME = ? WHERE ID_FLAG = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, flag.getNome());
            preparedStatement.setString(2, flag.getId());

            preparedStatement.execute();

            System.out.println("Sucesso ao atualizar flag!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao atualizar flag!");
            System.out.println(e.getMessage());
        }
    }
}