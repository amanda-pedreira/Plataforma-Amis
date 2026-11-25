package br.com.amis.dao;

import br.com.amis.servlet.config.ConnectionPoolConfig;

import br.com.amis.model.Journal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JournalDAO {
    public boolean cadastrar(Journal journal) {
        String sql = "INSERT INTO DIARIO (ID_USUARIO, DATA, HUMOR, DESCRICAO, TITULO) VALUES (?, ?, ?, ?, ?)";
        try (Connection conexao = ConnectionPoolConfig.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, journal.getIdUsuario());
            ps.setDate(2, java.sql.Date.valueOf(journal.getData()));
            ps.setString(3, journal.getHumor());
            ps.setString(4, journal.getDescricao());
            ps.setString(5, journal.getTitulo());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar diario: " + e.getMessage());
            return false;
        }
    }

    public List<Journal> listar(int idUsuario) {
        List<Journal> registros = new ArrayList<>();
        String sql = "SELECT * FROM DIARIO WHERE ID_USUARIO = ? ORDER BY DATA DESC, ID_REGISTRO DESC";
        try (Connection conexao = ConnectionPoolConfig.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                registros.add(new Journal(rs.getInt("ID_REGISTRO"), rs.getInt("ID_USUARIO"),
                        rs.getDate("DATA").toString(), rs.getString("HUMOR"), rs.getString("DESCRICAO"), rs.getString("TITULO")));
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar diario: " + e.getMessage());
        }
        return registros;
    }

    public Journal buscar(int idRegistro, int idUsuario) {
        String sql = "SELECT * FROM DIARIO WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = ConnectionPoolConfig.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, idRegistro);
            ps.setInt(2, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String data = rs.getDate("DATA").toString();
                return new Journal(idRegistro, idUsuario, data, rs.getString("HUMOR"), rs.getString("DESCRICAO"), rs.getString("TITULO"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao buscar diario: " + e.getMessage());
        }
        return null;
    }

    public boolean editar(Journal journal) {
        String sql = "UPDATE DIARIO SET DATA = ?, HUMOR = ?, DESCRICAO = ?, TITULO = ? WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = ConnectionPoolConfig.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setDate(1, java.sql.Date.valueOf(journal.getData()));
            ps.setString(2, journal.getHumor());
            ps.setString(3, journal.getDescricao());
            ps.setString(4, journal.getTitulo());
            ps.setInt(5, journal.getIdRegistro());
            ps.setInt(6, journal.getIdUsuario());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao editar diario: " + e.getMessage());
            return false;
        }
    }

    public boolean excluir(int idRegistro, int idUsuario) {
        String sql = "DELETE FROM DIARIO WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = ConnectionPoolConfig.getConnection();
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, idRegistro);
            ps.setInt(2, idUsuario);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao excluir diario: " + e.getMessage());
            return false;
        }
    }
}
