package br.com.amis.dao;

import br.com.amis.model.Funcionario;
import java.sql.*;
import java.util.*;

public class FuncionarioDAO {
    public void salvar(Funcionario f) {
        String sql = f.getIdFuncionario() == 0
                ? "INSERT INTO FUNCIONARIO (NOME, EMAIL, CARGO, STATUS, PERMISSAO) VALUES (?, ?, ?, ?, ?)"
                : "UPDATE FUNCIONARIO SET NOME=?, EMAIL=?, CARGO=?, STATUS=?, PERMISSAO=? WHERE ID_FUNCIONARIO=?";
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, f.getNome()); ps.setString(2, f.getEmail());
            ps.setString(3, f.getCargo()); ps.setString(4, f.getStatus());
            ps.setString(5, f.getPermissao());
            if (f.getIdFuncionario() != 0) ps.setInt(6, f.getIdFuncionario());
            ps.executeUpdate();
        } catch (Exception e) { System.out.println("Erro ao salvar funcionário: " + e.getMessage()); }
    }
    public void excluir(int id) {
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement("DELETE FROM FUNCIONARIO WHERE ID_FUNCIONARIO=?")) {
            ps.setInt(1, id); ps.executeUpdate();
        } catch (Exception e) { System.out.println("Erro ao excluir funcionário: " + e.getMessage()); }
    }
    public List<Funcionario> listar() {
        List<Funcionario> lista = new ArrayList<>();
        try (Connection c = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement ps = c.prepareStatement("SELECT * FROM FUNCIONARIO ORDER BY ID_FUNCIONARIO");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Funcionario f = new Funcionario();
                f.setIdFuncionario(rs.getInt("ID_FUNCIONARIO"));
                f.setNome(rs.getString("NOME")); f.setEmail(rs.getString("EMAIL"));
                f.setCargo(rs.getString("CARGO")); f.setStatus(rs.getString("STATUS"));
                f.setPermissao(rs.getString("PERMISSAO")); lista.add(f);
            }
        } catch (Exception e) { System.out.println("Erro ao listar funcionários: " + e.getMessage()); }
        return lista;
    }
}
