package br.com.amis.servlet;

import br.com.amis.dao.ComentarioDAO;
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
        int id = Integer.parseInt(req.getParameter("id"));
        new ComentarioDAO().deleteComentarioById(id);
        resp.sendRedirect(req.getContextPath() + "/find-all-comentarios");
    }
}
