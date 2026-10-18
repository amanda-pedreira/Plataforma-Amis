package br.com.amis.dao;

import br.com.amis.model.Amis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AmisDAO {

    public void createAmis(Amis amis) {

        String SQL = "INSERT INTO AMIS (NAME) VALUES (?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("Sucesso ao conectar no banco de dados!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, amis.getName());

            preparedStatement.execute();

            System.out.println("Sucesso ao cadastrar o Amis no banco de dados");

            connection.close();

        } catch (Exception e ) {

            System.out.println("Falha ao inserir o Amis no banco de dados!");

        }

    }

    public List<Amis> findAllAmis() {

        String SQL = "SELECT * FROM AMIS";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("Sucesso ao abrir a conexão com DB");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Amis> amis = new ArrayList<>();

            while (resultSet.next()) {

                String amisName = resultSet.getString("name");

                Amis amisItem = new Amis(amisName);

                amis.add(amisItem);

            }

            System.out.println("Sucesso ao consultar os dados no DB");

            connection.close();

            return amis;

        }catch (Exception e) {

            System.out.println("Falha na conexão com o DB");

            return Collections.emptyList();

        }

    }

}
