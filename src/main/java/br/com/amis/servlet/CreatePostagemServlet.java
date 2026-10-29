
package br.com.amis.servlet;

import br.com.amis.dao.PostagemDAO;
import br.com.amis.model.Postagem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-postagem")
public class CreatePostagemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String titulo = req.getParameter("titulo");
        String texto = req.getParameter("texto");
        int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
        int idCategoria = Integer.parseInt(req.getParameter("idCategoria"));
        int idFlag = Integer.parseInt(req.getParameter("idFlag"));

        PostagemDAO dao = new PostagemDAO();

        Postagem postagem = new Postagem(0, titulo, texto, null, null);

        postagem.setIdUsuario(idUsuario);
        postagem.setIdCategoria(idCategoria);
        postagem.setIdFlag(idFlag);

        if (id != null && !id.isEmpty()) {

            postagem.setIdPostagem(Integer.parseInt(id));

            dao.updatePostagem(postagem);

        } else {

            dao.createPostagem(postagem);

        }

        resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
    }
}
