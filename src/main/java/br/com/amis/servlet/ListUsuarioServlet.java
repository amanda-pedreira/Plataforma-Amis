
package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
import br.com.amis.dao.RelacionamentoDAO;
import br.com.amis.dao.ItemSalvoDAO;
import br.com.amis.dao.PostagemDAO;
import br.com.amis.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-usuarios")
public class ListUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UsuarioDAO dao = new UsuarioDAO();

        List<Usuario> usuarios = dao.findAllUsuarios();

        req.setAttribute("usuarios", usuarios);

        String pagina = req.getParameter("pagina");

        if ("perfil".equals(pagina)) {
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                RelacionamentoDAO relacao = new RelacionamentoDAO();
                req.setAttribute("pessoasSalvas", relacao.listar("PESSOA_SALVA", "ID_PESSOA", id));
                req.setAttribute("paginasSeguidas", relacao.listar("PAGINA_SEGUIDA", "ID_PAGINA", id));
                req.setAttribute("itensSalvos", new ItemSalvoDAO().listar(id));
                req.setAttribute("minhasPostagens", new PostagemDAO().findPostagensByUsuario(id));
            } catch (Exception e) {
            }
            req.getRequestDispatcher("/pages/perfil.jsp")
                    .forward(req, resp);
        } else {
            req.getRequestDispatcher("/pages/usuarios.jsp")
                    .forward(req, resp);
        }
    }
}
