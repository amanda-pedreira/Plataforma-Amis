package br.com.amis.servlet;

import br.com.amis.dao.ComentarioDAO;
import br.com.amis.model.Comentario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-comentario")
public class DeleteComentarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int id = Integer.parseInt(req.getParameter("id"));
        ComentarioDAO dao = new ComentarioDAO();
        for (Comentario comentario : dao.findAllComentarios()) {
            if (comentario.getIdComentario() == id && comentario.getIdUsuario() == (Integer) req.getSession().getAttribute("idUsuario")) {
                dao.deleteComentarioById(id);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/find-all-comentarios");
    }
}
