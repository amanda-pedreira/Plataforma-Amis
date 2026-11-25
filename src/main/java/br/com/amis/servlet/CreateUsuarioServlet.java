
package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
import br.com.amis.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-usuario")
public class CreateUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String tipo = req.getParameter("tipo");
        String foto = req.getParameter("foto");
        String username = req.getParameter("username");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String bio = req.getParameter("bio");
        String origem = req.getParameter("origem");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = new Usuario(
                tipo, foto, username, nome, email, senha
        );

        if ("perfil".equals(origem)) {
            if (req.getSession().getAttribute("idUsuario") == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
            usuario = dao.findUsuarioById(idUsuario);
            if (usuario == null) {
                resp.sendRedirect(req.getContextPath() + "/logout");
                return;
            }
            usuario.setNome(nome);
            usuario.setUsername(username);
            usuario.setEmail(email);
            usuario.setFoto(foto);
            usuario.setBio(bio);
            if (dao.updateUsuario(usuario)) {
                req.getSession().setAttribute("loggedUser", username);
                resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil");
            } else {
                resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil&erro=1");
            }
            return;
        }
        if (id != null && !id.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
            return;
        }
        if (!"PESSOAL".equals(tipo) && !"PAGINA".equals(tipo)) {
            resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?erro=1");
            return;
        }

        {
            boolean cadastrado = dao.createUsuario(usuario);

            if (cadastrado) {
                resp.sendRedirect(req.getContextPath() + "/login?cadastrado=1");
            } else {
                resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?erro=1");
            }
        }
    }
}
