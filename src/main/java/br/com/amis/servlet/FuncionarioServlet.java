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
        req.setAttribute("funcionarios", new FuncionarioDAO().listar());
        req.getRequestDispatcher("/pages/funcionarios.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            FuncionarioDAO dao = new FuncionarioDAO();
            if ("excluir".equals(req.getParameter("acao"))) {
                dao.excluir(Integer.parseInt(req.getParameter("id")));
            } else {
                Funcionario f = new Funcionario();
                String id = req.getParameter("id");
                if (id != null && !id.isEmpty()) f.setIdFuncionario(Integer.parseInt(id));
                f.setNome(req.getParameter("nome")); f.setEmail(req.getParameter("email"));
                f.setCargo(req.getParameter("cargo")); f.setStatus(req.getParameter("status"));
                f.setPermissao(req.getParameter("permissao")); dao.salvar(f);
            }
        } catch (Exception e) { System.out.println("Erro no formulário de funcionário: " + e.getMessage()); }
        resp.sendRedirect(req.getContextPath() + "/funcionarios");
    }
}
