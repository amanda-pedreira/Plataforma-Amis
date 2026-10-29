package br.com.amis.servlet;

import br.com.amis.dao.ComentarioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/find-all-comentarios")
public class ListComentarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("comentarios", new ComentarioDAO().findAllComentarios());
        req.getRequestDispatcher("/pages/comentarios.jsp").forward(req, resp);
    }
}
