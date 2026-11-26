package br.com.amis.servlet;

import br.com.amis.dao.FuncionarioDAO;
import br.com.amis.model.Funcionario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/funcionarios")
public class FuncionarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FuncionarioDAO dao = new FuncionarioDAO();
        if (req.getParameter("id") != null) {
            Funcionario f = dao.buscar(Integer.parseInt(req.getParameter("id")));
            if (f == null) {
                resp.sendError(404);
                return;
            }
            req.setAttribute("f", f);
            req.getRequestDispatcher("/WEB-INF/funcionario-editar.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("funcionarios", dao.listar());
        req.getRequestDispatcher("/pages/funcionarios.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        boolean sucesso = false;
        try {
            FuncionarioDAO dao = new FuncionarioDAO();
            if ("excluir".equals(req.getParameter("acao"))) {
                int id = Integer.parseInt(req.getParameter("id"));
                if (id != (Integer) req.getSession().getAttribute("idUsuario")) sucesso = dao.excluir(id);
            } else {
                Funcionario f = new Funcionario();
                String id = req.getParameter("id");
                if (id != null && !id.isEmpty()) f.setIdFuncionario(Integer.parseInt(id));
                f.setNome(req.getParameter("nome"));
                f.setEmail(req.getParameter("email"));
                f.setCargo(req.getParameter("cargo"));
                f.setStatus(req.getParameter("status"));
                f.setPermissao(req.getParameter("permissao"));
                f.setUsername(req.getParameter("username"));
                if (!"1".equals(f.getPermissao()) && !"2".equals(f.getPermissao()) && !"3".equals(f.getPermissao())) {
                    resp.sendError(400);
                    return;
                }
                f.setSenha(req.getParameter("senha"));
                if (f.getIdFuncionario() == 0 && (f.getSenha() == null || f.getSenha().isEmpty() || !f.getSenha().equals(req.getParameter("confirmarSenha")))) {
                    resp.sendRedirect(req.getContextPath() + "/funcionarios?erro=1");
                    return;
                }
                if (f.getIdFuncionario() == (Integer) req.getSession().getAttribute("idUsuario")) {
                    f.setStatus("ATIVO");
                    f.setPermissao("3");
                }
                sucesso = dao.salvar(f);
            }
        } catch (Exception e) {
            System.out.println("Erro no formulário de funcionário: " + e.getMessage());
        }
        resp.sendRedirect(req.getContextPath() + "/funcionarios" + (sucesso ? "?sucesso=1" : "?erro=1"));
    }
}
