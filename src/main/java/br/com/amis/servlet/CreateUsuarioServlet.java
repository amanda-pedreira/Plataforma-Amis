
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String tipo = req.getParameter("tipo");
        String foto = req.getParameter("foto");
        String username = req.getParameter("username");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String confirmarSenha = req.getParameter("confirmar-senha");

        if (tipo == null || (!tipo.equals("PESSOAL") && !tipo.equals("PAGINA"))
                || username == null || username.trim().isEmpty()
                || nome == null || nome.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || senha == null || senha.isEmpty()
                || confirmarSenha == null || !senha.equals(confirmarSenha)) {

            resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?erro=1");
            return;
        }

        if (foto != null && foto.trim().isEmpty()) {
            foto = null;
        }

        Usuario usuario = new Usuario(tipo, foto, username.trim(), nome.trim(), email.trim(), senha);

        boolean cadastrado = new UsuarioDAO().createUsuario(usuario);

        if (cadastrado) {
            resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?enviado=1");
        } else {
            resp.sendRedirect(req.getContextPath() + "/pages/cadastro.jsp?erro=1");
        }
    }
}
