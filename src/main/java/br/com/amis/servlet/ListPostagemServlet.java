
package br.com.amis.servlet;

import br.com.amis.dao.PostagemDAO;
import br.com.amis.dao.UsuarioDAO;
import br.com.amis.model.Usuario;
import java.util.Map;
import java.util.HashMap;
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

        List<Postagem> postagens = new PostagemDAO().findAllPostagens();

        req.setAttribute("postagens", postagens);
        Map<Integer, String> nomes = new HashMap<>();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        for (Postagem postagem : postagens) {
            if (!nomes.containsKey(postagem.getIdUsuario())) {
                Usuario usuario = usuarioDAO.findUsuarioById(postagem.getIdUsuario());
                nomes.put(postagem.getIdUsuario(), usuario == null ? "Usuário" : usuario.getNome());
            }
        }
        req.setAttribute("nomesAutores", nomes);

        req.getRequestDispatcher("/WEB-INF/feed.jsp").forward(req, resp);
    }
}
