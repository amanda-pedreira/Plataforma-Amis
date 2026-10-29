package br.com.amis.dao;

import br.com.amis.model.Postagem;
import java.sql.*;
import java.util.*;

public class ItemSalvoDAO {
    public void salvar(int idUsuario, int idPostagem) {
        String sql = "INSERT INTO ITEM_SALVO (ID_USUARIO, ID_POSTAGEM) VALUES (?, ?)";
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setInt(2, idPostagem);
            ps.executeUpdate();
        } catch (Exception e) { System.out.println("Erro ao salvar postagem: " + e.getMessage()); }
    }

    public void remover(int idUsuario, int idPostagem) {
        String sql = "DELETE FROM ITEM_SALVO WHERE ID_USUARIO = ? AND ID_POSTAGEM = ?";
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setInt(2, idPostagem);
            ps.executeUpdate();
        } catch (Exception e) { System.out.println("Erro ao remover postagem salva: " + e.getMessage()); }
    }

    public List<Postagem> listar(int idUsuario) {
        List<Postagem> lista = new ArrayList<>();
        String sql = "SELECT P.ID_POSTAGEM, P.ID_USUARIO, P.TITULO, P.TEXTO, C.NOME AS CATEGORIA, F.NOME AS FLAG " +
                "FROM POSTAGEM P INNER JOIN ITEM_SALVO S ON P.ID_POSTAGEM = S.ID_POSTAGEM " +
                "INNER JOIN CATEGORIA C ON P.ID_CATEGORIA = C.ID_CATEGORIA " +
                "INNER JOIN FLAG F ON P.ID_FLAG = F.ID_FLAG WHERE S.ID_USUARIO = ? ORDER BY P.ID_POSTAGEM DESC";
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Postagem postagem = new Postagem(rs.getInt("ID_POSTAGEM"), rs.getString("TITULO"),
                        rs.getString("TEXTO"), rs.getString("CATEGORIA"), rs.getString("FLAG"));
                postagem.setIdUsuario(rs.getInt("ID_USUARIO"));
                lista.add(postagem);
            }
        } catch (Exception e) { System.out.println("Erro ao listar postagens salvas: " + e.getMessage()); }
        return lista;
    }
}
