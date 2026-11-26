package br.com.amis.dao;

import br.com.amis.servlet.config.ConnectionPoolConfig;
import br.com.amis.model.Funcionario;
import java.sql.*;
import java.util.*;

public class FuncionarioDAO {
    public boolean salvar(Funcionario f) {
        String sql;
        if (f.getIdFuncionario() == 0) {
            sql = "INSERT INTO USUARIO (NOME, EMAIL, USERNAME, CARGO, STATUS, PERMISSAO, SENHA, ADMIN, TIPO) VALUES (?, ?, ?, ?, ?, ?, ?, 1, 'FUNCIONARIO')";
        } else {
            sql = "UPDATE USUARIO SET NOME=?, EMAIL=?, USERNAME=?, CARGO=?, STATUS=?, PERMISSAO=? WHERE ID_USUARIO=? AND ADMIN=1";
        }
        try (Connection c = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, f.getNome());
            ps.setString(2, f.getEmail());
            ps.setString(3, f.getUsername());
            ps.setString(4, f.getCargo());
            ps.setString(5, f.getStatus());
            ps.setString(6, f.getPermissao());
            if (f.getIdFuncionario() == 0) {
                ps.setString(7, f.getSenha());
            } else {
                ps.setInt(7, f.getIdFuncionario());
            }
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean excluir(int id) {
        try (Connection c = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = c.prepareStatement("DELETE FROM USUARIO WHERE ID_USUARIO=? AND ADMIN=1")) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Funcionario buscar(int id) {
        for (Funcionario f : listar()) {
            if (f.getIdFuncionario() == id) return f;
        }
        return null;
    }

    public List<Funcionario> listar() {
        List<Funcionario> lista = new ArrayList<>();
        try (Connection c = ConnectionPoolConfig.getConnection();
        PreparedStatement ps = c.prepareStatement("SELECT * FROM USUARIO WHERE ADMIN=1 ORDER BY ID_USUARIO");
        ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Funcionario f = new Funcionario();
                f.setIdFuncionario(rs.getInt("ID_USUARIO"));
                f.setNome(rs.getString("NOME"));
                f.setEmail(rs.getString("EMAIL"));
                f.setUsername(rs.getString("USERNAME"));
                f.setFoto(rs.getString("FOTO"));
                f.setCargo(rs.getString("CARGO"));
                f.setStatus(rs.getString("STATUS"));
                f.setPermissao(rs.getString("PERMISSAO"));
                lista.add(f);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }
}
