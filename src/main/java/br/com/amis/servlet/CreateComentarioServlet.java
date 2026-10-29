package br.com.amis.servlet;

import br.com.amis.dao.ComentarioDAO;
import br.com.amis.model.Comentario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-comentario")
public class CreateComentarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int idPostagem = Integer.parseInt(req.getParameter("idPostagem"));
        int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
        String texto = req.getParameter("texto");
        Comentario comentario = new Comentario(0, idPostagem, idUsuario, texto);
        new ComentarioDAO().createComentario(comentario);
        resp.sendRedirect(req.getContextPath() + "/find-all-comentarios?idPostagem=" + idPostagem);
    }
}
