
package br.com.amis.servlet;

import br.com.amis.dao.PostagemDAO;
import br.com.amis.dao.CategoriaDAO;
import br.com.amis.dao.FlagDAO;
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("categorias", new CategoriaDAO().findAllCategorias());
        req.setAttribute("flags", new FlagDAO().findAllFlags());
        req.getRequestDispatcher("/pages/postagem-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String titulo = req.getParameter("titulo");
        String texto = req.getParameter("texto");
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
        int idCategoria = Integer.parseInt(req.getParameter("idCategoria"));
        int idFlag = Integer.parseInt(req.getParameter("idFlag"));

        PostagemDAO dao = new PostagemDAO();

        Postagem postagem = new Postagem(0, titulo, texto, null, null);

        postagem.setIdUsuario(idUsuario);
        postagem.setIdCategoria(idCategoria);
        postagem.setIdFlag(idFlag);

        dao.createPostagem(postagem);

        resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
    }
}
