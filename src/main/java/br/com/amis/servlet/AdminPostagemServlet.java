package br.com.amis.servlet;

import br.com.amis.dao.PostagemDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/postagens")
public class AdminPostagemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("postagens", new PostagemDAO().pesquisarAdmin(req.getParameter("pesquisa")));
        req.setAttribute("usuarios", new br.com.amis.dao.UsuarioDAO().findAllUsuarios());
        req.getRequestDispatcher("/WEB-INF/admin-postagens.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        new PostagemDAO().deletePostagemById(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect(req.getContextPath() + "/admin/postagens");
    }
}
