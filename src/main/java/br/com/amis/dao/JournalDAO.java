package br.com.amis.dao;

import br.com.amis.model.Journal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class JournalDAO {
    private java.sql.Date converterData(String data) throws Exception {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        formato.setLenient(false);
        return new java.sql.Date(formato.parse(data).getTime());
    }

    public boolean cadastrar(Journal journal) {
        String sql = "INSERT INTO DIARIO (ID_USUARIO, DATA, HUMOR, DESCRICAO) VALUES (?, ?, ?, ?)";
        try (Connection conexao = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, journal.getIdUsuario());
            ps.setDate(2, converterData(journal.getData()));
            ps.setString(3, journal.getHumor());
            ps.setString(4, journal.getDescricao());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar diario: " + e.getMessage());
            return false;
        }
    }

    public List<Journal> listar(int idUsuario) {
        List<Journal> registros = new ArrayList<>();
        String sql = "SELECT * FROM DIARIO WHERE ID_USUARIO = ? ORDER BY DATA DESC, ID_REGISTRO DESC";
        try (Connection conexao = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            while (rs.next()) {
                registros.add(new Journal(rs.getInt("ID_REGISTRO"), rs.getInt("ID_USUARIO"),
                        formato.format(rs.getDate("DATA")), rs.getString("HUMOR"), rs.getString("DESCRICAO")));
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar diario: " + e.getMessage());
        }
        return registros;
    }

    public Journal buscar(int idRegistro, int idUsuario) {
        String sql = "SELECT * FROM DIARIO WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, idRegistro);
            ps.setInt(2, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String data = new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("DATA"));
                return new Journal(idRegistro, idUsuario, data, rs.getString("HUMOR"), rs.getString("DESCRICAO"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao buscar diario: " + e.getMessage());
        }
        return null;
    }

    public boolean editar(Journal journal) {
        String sql = "UPDATE DIARIO SET DATA = ?, HUMOR = ?, DESCRICAO = ? WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setDate(1, converterData(journal.getData()));
            ps.setString(2, journal.getHumor());
            ps.setString(3, journal.getDescricao());
            ps.setInt(4, journal.getIdRegistro());
            ps.setInt(5, journal.getIdUsuario());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao editar diario: " + e.getMessage());
            return false;
        }
    }

    public boolean excluir(int idRegistro, int idUsuario) {
        String sql = "DELETE FROM DIARIO WHERE ID_REGISTRO = ? AND ID_USUARIO = ?";
        try (Connection conexao = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
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
