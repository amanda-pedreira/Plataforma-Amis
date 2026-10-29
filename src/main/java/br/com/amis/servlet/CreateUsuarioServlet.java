
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
        String status = req.getParameter("status");
        String origem = req.getParameter("origem");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = new Usuario(
                tipo, foto, username, nome, email, senha
        );

        if (id != null && !id.isEmpty()) {

            usuario.setIdUsuario(Integer.parseInt(id));
            usuario.setBio(bio);
            usuario.setStatus(status);

            dao.updateUsuario(usuario);

            if ("perfil".equals(origem)) {
                resp.sendRedirect(
                        req.getContextPath() +
                                "/find-all-usuarios?pagina=perfil&id=" + id
                );
            } else {
                resp.sendRedirect(
                        req.getContextPath() + "/find-all-usuarios"
                );
            }

        } else {

            boolean cadastrado = dao.createUsuario(usuario);

            if (cadastrado) {
                resp.sendRedirect(req.getContextPath() + "/pages/login.jsp?cadastrado=1");
            } else {
                resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?erro=1");
            }
        }
    }
}
