package br.com.amis.dao;

import br.com.amis.model.Usuario;
import java.sql.*;
import java.util.*;

public class RelacionamentoDAO {
    public boolean salvar(String tabela, String coluna, int idUsuario, int idDestino) {
        if (!tabela.equals("PESSOA_SALVA") && !tabela.equals("PAGINA_SEGUIDA")) return false;
        String sql = "INSERT INTO " + tabela + " (ID_USUARIO, " + coluna + ") VALUES (?, ?)";
        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setInt(2, idDestino);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao salvar: " + e.getMessage());
            return false;
        }
    }

    public boolean remover(String tabela, String coluna, int idUsuario, int idDestino) {
        if (!tabela.equals("PESSOA_SALVA") && !tabela.equals("PAGINA_SEGUIDA")) return false;
        String sql = "DELETE FROM " + tabela + " WHERE ID_USUARIO = ? AND " + coluna + " = ?";
        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setInt(2, idDestino);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao remover: " + e.getMessage());
            return false;
        }
    }

    public List<Usuario> listar(String tabela, String coluna, int idUsuario) {
        List<Usuario> usuarios = new ArrayList<>();
        if (!tabela.equals("PESSOA_SALVA") && !tabela.equals("PAGINA_SEGUIDA")) return usuarios;
        String sql = "SELECT U.ID_USUARIO, U.NOME, U.USERNAME, U.TIPO, U.BIO, U.FOTO " +
                "FROM USUARIO U INNER JOIN " + tabela + " R ON U.ID_USUARIO = R." + coluna +
                " WHERE R.ID_USUARIO = ? ORDER BY U.NOME";
        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString("TIPO"), rs.getString("FOTO"),
                        rs.getString("USERNAME"), rs.getString("NOME"), null, null);
                u.setIdUsuario(rs.getInt("ID_USUARIO"));
                u.setBio(rs.getString("BIO"));
                usuarios.add(u);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar salvos: " + e.getMessage());
        }
        return usuarios;
    }
}
