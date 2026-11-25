
package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-usuario")
public class DeleteUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int id = (Integer) req.getSession().getAttribute("idUsuario");
        if (!"perfil".equals(req.getParameter("origem"))) {
            resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
            return;
        }

        UsuarioDAO dao = new UsuarioDAO();

        if (dao.deleteUsuario(id)) {
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        resp.sendRedirect(
                req.getContextPath() +
                        "/find-all-usuarios?pagina=perfil&erro=1"
        );
    }
}
