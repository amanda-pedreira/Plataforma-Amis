
package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
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

        List<Usuario> usuarios = new UsuarioDAO().findAllUsuarios();

        req.setAttribute("usuarios", usuarios);

        req.getRequestDispatcher("/pages/perfil.jsp")
                .forward(req, resp);
    }
}
