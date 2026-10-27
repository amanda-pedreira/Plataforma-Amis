package br.com.amis.dao;

import br.com.amis.model.Categoria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CategoriaDAO {

    // INSERT - Lab 2
    public void createCategoria(Categoria categoria) {

        String SQL = "INSERT INTO CATEGORIA (NOME) VALUES (?)";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            System.out.println("Sucesso ao conectar no banco de dados!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, categoria.getNome());
            preparedStatement.execute();

            System.out.println("Sucesso ao cadastrar categoria!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao cadastrar categoria!");
            System.out.println(e.getMessage());
        }
    }

    // SELECT - Lab 3
    public List<Categoria> findAllCategorias() {

        String SQL = "SELECT * FROM CATEGORIA";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Categoria> categorias = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("ID_CATEGORIA");
                String nome = resultSet.getString("NOME");

                Categoria categoria = new Categoria(id, nome);

                categorias.add(categoria);
            }

            System.out.println("success in select * categoria");

            connection.close();

            return categorias;

        } catch (Exception e) {
            System.out.println("Erro ao consultar categorias!");
            System.out.println(e.getMessage());

            return Collections.emptyList();
        }
    }

    // DELETE - Lab 4
    public void deleteCategoriaById(String id) {

        String SQL = "DELETE FROM CATEGORIA WHERE ID_CATEGORIA = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, id);
            preparedStatement.execute();

            System.out.println("Sucesso ao excluir categoria!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao excluir categoria!");
            System.out.println(e.getMessage());
        }
    }

    // UPDATE - Lab 5
    public void updateCategoria(Categoria categoria) {

        String SQL = "UPDATE CATEGORIA SET NOME = ? WHERE ID_CATEGORIA = ?";

        try {

            Connection connection = DriverManager.getConnection(
                    "jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, categoria.getNome());
            preparedStatement.setString(2, categoria.getId());

            preparedStatement.execute();

            System.out.println("Sucesso ao atualizar categoria!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro ao atualizar categoria!");
            System.out.println(e.getMessage());
        }
    }
}