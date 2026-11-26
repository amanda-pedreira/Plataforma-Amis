package br.com.amis.servlet;

import br.com.amis.dao.ItemSalvoDAO;
import br.com.amis.dao.CategoriaDAO;
import br.com.amis.dao.FlagDAO;

import br.com.amis.dao.PostagemDAO;
import br.com.amis.dao.UsuarioDAO;
import br.com.amis.dao.ComentarioDAO;
import br.com.amis.model.Postagem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-postagens")
public class ListPostagemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {

        String categoria = req.getParameter("categoria");
        String flag = req.getParameter("flag");
        String pesquisa = req.getParameter("pesquisa");
        String id = req.getParameter("id");
        PostagemDAO dao = new PostagemDAO();
        List<Postagem> postagens;
        if (id != null) {
            postagens = dao.findAllPostagens();
        } else {
            postagens = dao.findFeed(categoria, flag, pesquisa);
        }
        req.setAttribute("categorias", new CategoriaDAO().findAllCategorias());
        req.setAttribute("flags", new FlagDAO().findAllFlags());

        if (req.getSession().getAttribute("idUsuario") != null) {
            int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
            req.setAttribute("itensSalvos", new ItemSalvoDAO().listar(idUsuario));
        }
        if (req.getParameter("id") != null) {
            List<Postagem> selecionadas = new java.util.ArrayList<>();
            for (Postagem postagem : postagens) {
                if (String.valueOf(postagem.getIdPostagem()).equals(req.getParameter("id"))) selecionadas.add(postagem);
            }
            postagens = selecionadas;
        }
        req.setAttribute("postagens", postagens);
        req.setAttribute("usuarios", new UsuarioDAO().findAllUsuarios());
        req.setAttribute("comentarios", new ComentarioDAO().findAllComentarios());

        req.getRequestDispatcher("/WEB-INF/feed.jsp").forward(req, resp);
    }
}
