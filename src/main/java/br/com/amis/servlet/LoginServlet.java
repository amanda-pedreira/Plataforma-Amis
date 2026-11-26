package br.com.amis.servlet;

import br.com.amis.dao.UsuarioLoginDAO;
import br.com.amis.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {

        req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new User(username, password);

        int idUsuario = new UsuarioLoginDAO().verifyCredentials(user);

        if (idUsuario > 0) {

            req.getSession().setAttribute("loggedUser", username);
            req.getSession().setAttribute("idUsuario", idUsuario);

            int admin = new br.com.amis.dao.UsuarioDAO().isAdmin(idUsuario) ? 1 : 0;
            req.getSession().setAttribute("admin", admin);

            if (admin == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
            }

        } else {

            if (idUsuario == -1) {
                req.setAttribute("inativo", true);
                req.setAttribute("message", "Sua conta está inativa. Entre em contato com a administração da AMIS.");
            } else {
                req.setAttribute("message", "Usuário ou senha inválidos!");
            }

            req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);

        }

    }

}
