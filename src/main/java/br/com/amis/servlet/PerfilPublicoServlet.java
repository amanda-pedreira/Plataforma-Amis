package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
import br.com.amis.model.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/perfil-publico")
public class PerfilPublicoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Usuario usuario = new UsuarioDAO().findUsuarioById(id);
            req.setAttribute("usuarioPublico", usuario);
        } catch (Exception e) {
            req.setAttribute("usuarioPublico", null);
        }
        req.getRequestDispatcher("/pages/perfil-publico.jsp").forward(req, resp);
    }
}
